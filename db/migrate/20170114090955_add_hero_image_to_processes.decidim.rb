# frozen_string_literal: true

# This migration comes from decidim (originally 20161011125616)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddHeroImageToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :hero_image, :string
  end
end
