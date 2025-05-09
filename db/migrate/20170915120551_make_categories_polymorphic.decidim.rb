# frozen_string_literal: true

# This migration comes from decidim (originally 20170726145242)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class MakeCategoriesPolymorphic < ActiveRecord::Migration[5.1]
  def change
    remove_index :decidim_categories,
                 name: "index_decidim_categories_on_decidim_participatory_process_id"

    add_column :decidim_categories, :decidim_participatory_space_type, :string

    reversible do |direction|
      direction.up do
        execute <<~SQL.squish
          UPDATE decidim_categories
          SET decidim_participatory_space_type = 'Decidim::ParticipatoryProcess'
        SQL
      end
    end

    rename_column :decidim_categories,
                  :decidim_participatory_process_id,
                  :decidim_participatory_space_id

    add_index :decidim_categories,
              [:decidim_participatory_space_id, :decidim_participatory_space_type],
              name: "index_decidim_categories_on_decidim_participatory_space"
  end
end
