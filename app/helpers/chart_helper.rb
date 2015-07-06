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
      f.legend(align: "right", verticalAlign: "top", y: 75, x: -50, layout: "vertical")
      f.chart({ defaultSeriesType: "area" })
      f.series(name: "Done (Accepted)",            data: accepted(burndowns))
      f.series(name: "Acceptance (Delivered)",     data: delivered(burndowns))
      f.series(name: "Testing (Finished)",         data: finished(burndowns))
      f.series(name: "In Progress (Started)",      data: started(burndowns))
      f.series(name: "To Do (Unstarted/Rejected)", data: unstarted(burndowns))
      f.series(name: "Ideal",                      data: planned, type: "line")
    end
  end
  
  private
    def burndowns(team, start)
      Burndown.where(team: team, date: start..Date.today)
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
      burndown.nil?? 0 : (burndown.unstarted + burndown.started +
      burndown.finished + burndown.delivered + burndown.accepted)
    end 
end
