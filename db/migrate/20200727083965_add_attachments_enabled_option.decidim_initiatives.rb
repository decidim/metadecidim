# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20200424110930)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddAttachmentsEnabledOption < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :attachments_enabled, :boolean, null: false, default: false
  end
end
