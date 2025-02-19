# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171011152425)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddHashtagToInitiatives < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_initiatives, :hashtag, :string, unique: true
  end
end
