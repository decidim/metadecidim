# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171017091458)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class RemoveSupportsRequiredFromDecidimInitiativesTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :decidim_initiatives_types, :supports_required, :integer, null: false
  end
end
