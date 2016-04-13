class RemoveUnnecessaryAttributesFromStories < ActiveRecord::Migration
  def up
    remove_column :stories, :pull_quote
    remove_column :stories, :html_content
    remove_column :stories, :video_id
    remove_column :stories, :redirect_url
    remove_column :stories, :digest
    remove_column :stories, :video_provider
    remove_column :stories, :promo_text
    remove_column :stories, :suppress_comments
    remove_column :stories, :suppress_ads
    remove_column :stories, :html_content_two
  end

  def down
    add_column :stories, :pull_quote, :string
    add_column :stories, :html_content, :text
    add_column :stories, :video_id, :string
    add_column :stories, :redirect_url, :string
    add_column :stories, :digest, :text
    add_column :stories, :video_provider, :string
    add_column :stories, :promo_text, :string
    add_column :stories, :suppress_comments, :boolean
    add_column :stories, :suppress_ads, :boolean
    add_column :stories, :html_content_two, :boolean
  end
end
