# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20171011110714)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddBannerImageToInitiativeType < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_initiatives_types, :banner_image, :string
  end
end
