class AddAttributesToStories < ActiveRecord::Migration
  def change
    add_column :stories, :headline, :string
    add_column :stories, :byline, :string
    add_column :stories, :body, :text
    add_column :stories, :subhead, :string
    add_column :stories, :pull_quote, :string
    add_column :stories, :html_content, :text
    add_column :stories, :video_id, :string
    add_column :stories, :redirect_url, :string
    add_column :stories, :digest, :text
    add_column :stories, :infobox, :text
    add_column :stories, :time_updated, :string
    add_column :stories, :location, :string
    add_column :stories, :video_provider, :string
    add_column :stories, :promo_text, :string
    add_column :stories, :publish_date, :datetime
    add_column :stories, :suppress_comments, :boolean
    add_column :stories, :suppress_ads, :boolean
    add_column :stories, :keywords, :string
    add_column :stories, :html_content_two, :text
    add_column :stories, :state, :boolean
  end
end
