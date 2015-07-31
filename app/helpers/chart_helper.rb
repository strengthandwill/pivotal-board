require 'ext/Date'

module ChartHelper
  def chart(team, start, finish)
    burndowns = burndowns(team, start)
    dates = dates(start, finish)
    planned = planned(total_story_points(burndowns[0]), dates.length)
    
    LazyHighCharts::HighChart.new("graph") do |f|
      f.xAxis(categories: dates, tickmarkPlacement: "on", title: { enabled: false })
      f.yAxis [ {title: {text: "Story Points"} } ]
      f.plotOptions(area: { stacking: "normal", lineColor: "#666666", lineWidth: 1,
                            marker: { lineWidth: 1, lineColor: "#666666" } })
      f.tooltip(shared: true, valueSuffix: " sp")
      f.legend(verticalAlign: 'bottom', align:'center', y: 0, x: 0, layout: "vertical")
      f.chart({ defaultSeriesType: "area" })
      f.series(name: "Done",            data: accepted(burndowns),  color: '#f2a2e8')
      f.series(name: "Impeded",         data: delivered(burndowns), color: '#b2cefe')
      f.series(name: "PPO Acceptance",  data: delivered(burndowns), color: '#baed91')
      f.series(name: "QE Testing",      data: finished(burndowns),  color: '#faf884')
      f.series(name: "DEV In Progress", data: started(burndowns),   color: '#f8b88b')
      f.series(name: "DEV To Do",       data: unstarted(burndowns), color: '#fea3aa')
      f.series(name: "Ideal",           data: planned, type: "line")
    end
  end
  
  private
    def burndowns(team, start)
      Burndown.where(team: team, date: start..Date.today).order(:date)
    end
  
    def unstarted(burndowns)
      burndowns.collect { |burndown| burndown.unstarted }
    end
  
    def started(burndowns)
      burndowns.collect { |burndown| burndown.started }
    end
  
    def finished(burndowns)
      burndowns.collect { |burndown| burndown.finished }
    end
  
    def delivered(burndowns)
      burndowns.collect { |burndown| burndown.delivered }
    end
  
    def accepted(burndowns)
      burndowns.collect { |burndown| burndown.accepted }
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
      burndown.nil?? 0 : (burndown.unstarted + burndown.started + burndown.finished + 
                          burndown.delivered + burndown.impeded + burndown.accepted)
    end 
end
