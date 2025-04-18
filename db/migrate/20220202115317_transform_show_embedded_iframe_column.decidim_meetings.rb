# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20210922140454)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class TransformShowEmbeddedIframeColumn < ActiveRecord::Migration[6.0]
  def up
    add_column :decidim_meetings_meetings, :iframe_embed_type, :integer, default: 0
    execute "UPDATE decidim_meetings_meetings SET iframe_embed_type = 1 WHERE show_embedded_iframe = 't'"
    remove_column :decidim_meetings_meetings, :show_embedded_iframe
  end

  def down
    add_column :decidim_meetings_meetings, :show_embedded_iframe, :boolean, default: false
    execute "UPDATE decidim_meetings_meetings SET show_embedded_iframe = 't' WHERE iframe_embed_type = 1"
    remove_column :decidim_meetings_meetings, :iframe_embed_type
  end
end
