# frozen_string_literal: true

# This migration comes from decidim_debates (originally 20180117100413)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddDebateInformationUpdates < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_debates_debates, :information_updates, :jsonb
  end
end
