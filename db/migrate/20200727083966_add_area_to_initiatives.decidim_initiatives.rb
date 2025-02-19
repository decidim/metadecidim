# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20200514085422)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddAreaToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_reference :decidim_initiatives, :decidim_area, index: true
  end
end
