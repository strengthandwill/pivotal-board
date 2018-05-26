require 'ext/Date'

module ChartHelper
  def chart(team, start, finish, settings)
    burndowns = burndowns(team, start)
    dates = dates(start, finish)
    planned = planned(total_story_points(burndowns[0]), dates.length)

    LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: dates, tickmarkPlacement: 'on', title: { enabled: false })
      f.yAxis [{ title: { text: 'Story Points' } }]
      f.plotOptions(area: { stacking: 'normal', lineColor: '#666666', lineWidth: 1,
                            marker: { lineWidth: 1, lineColor: '#666666' } })
      f.tooltip(shared: true, valueSuffix: ' sp')
      f.legend(verticalAlign: 'bottom', align: 'center', y: 0, x: 0, layout: 'vertical')
      f.chart(defaultSeriesType: 'area')
      f.series(name: 'Done',            data: accepted(burndowns),  color: settings.accepted_color)
      f.series(name: 'Impeded',         data: impeded(burndowns),   color: settings.impeded_color)
      f.series(name: 'PPO Review', data: delivered(burndowns), color: settings.delivered_color)
      f.series(name: 'QE Testing',      data: finished(burndowns),  color: settings.finished_color)
      f.series(name: 'DEV In Progress', data: started(burndowns),   color: settings.started_color)
      f.series(name: 'DEV To Do',       data: unstarted(burndowns), color: settings.unstarted_color)
      f.series(name: 'Ideal',           data: planned, type: 'line')
    end
  end

  private

  def burndowns(team, start)
    Burndown.where(team: team, date: start..Date.today).order(:date)
  end

  def unstarted(burndowns)
    burndowns.collect(&:unstarted)
  end

  def started(burndowns)
    burndowns.collect(&:started)
  end

  def finished(burndowns)
    burndowns.collect(&:finished)
  end

  def delivered(burndowns)
    burndowns.collect(&:delivered)
  end

  def impeded(burndowns)
    burndowns.collect(&:impeded)
  end

  def accepted(burndowns)
    burndowns.collect(&:accepted)
  end

  def planned(story_points, days)
    story_points = story_points.to_f
    story_points_per_day = story_points / (days - 1)
    planned = []
    days.times do
      planned.push(story_points.to_i)
      story_points -= story_points_per_day
    end
    planned
  end

  def dates(start, finish)
    dates = []
    start.upto(finish) do |date|
      dates.push(date.to_formatted_s(:short)) if date.weekday?
    end
    dates
  end

  def total_story_points(burndown)
    burndown.nil? ? 0 : (burndown.unstarted + burndown.started + burndown.finished +
                        burndown.delivered + burndown.impeded + burndown.accepted)
  end
end
