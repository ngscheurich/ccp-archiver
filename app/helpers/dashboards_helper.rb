module DashboardsHelper
  def stories_chart_data
    labels = []
    series = []
    stories_processed = 0
    @api_responses.each do |api_response|
      # labels << api_response.created_at
      labels << ""
      stories_processed += api_response.stories_retrieved
      series << stories_processed
    end

    { labels: labels, series: [series] }.to_json
  end

  def stories_chart_options
    {
      axisY: { onlyInteger: true },
      showArea: true
    }.to_json
  end

  def stories_chart
    html = <<HTML
      <div id='stories-chart' class='ct-chart ct-golden-section'></div>
      <script>
        new Chartist.Line('#stories-chart', #{stories_chart_data}, #{stories_chart_options});
      </script>
HTML
    html.html_safe
  end

  def stories_pie
    stories_count = Story.count
    data = {
      labels: %w(Imported Remaining),
      series: [stories_count, 147_000 - stories_count]
    }.to_json
    html = <<HTML
      <div id='stories-pie' class='ct-chart ct-golden-section'></div>
      <script>
        new Chartist.Pie('#stories-pie', #{data}, {
          labelInterpolationFnc: function(value) { return value[0] }
        });
      </script>
HTML
    html.html_safe
  end
end
