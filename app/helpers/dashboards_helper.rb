module DashboardsHelper
  def stories_chart_data
    labels = []
    series = []
    stories_processed = 0
    @api_responses.each do |api_response|
      labels << api_response.created_at
      stories_processed += api_response.stories_retrieved
      series << stories_processed
    end

    { labels: labels, series: [series] }.to_json
  end

  def stories_chart_options
    {
      axisY: { onlyInteger: true }
    }.to_json
  end

  def stories_chart
    html = "<div id='stories-chart' class='ct-chart ct-golden-section'></div>"
    html << "<script>"
    html << "new Chartist.Line('#stories-chart', #{stories_chart_data}, #{stories_chart_options});"
    html << "</script>"
    html.html_safe
  end
end
