# frozen_string_literal: true

# This migration comes from decidim (originally 20170720120231)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class MakeModerationsPolymorphic < ActiveRecord::Migration[5.1]
  def change
    remove_index :decidim_moderations,
                 name: "decidim_moderations_participatory_process"

    add_column :decidim_moderations, :decidim_participatory_space_type, :string

    reversible do |direction|
      direction.up do
        execute <<~SQL.squish
          UPDATE decidim_moderations
          SET decidim_participatory_space_type = 'Decidim::ParticipatoryProcess'
        SQL
      end
    end

    rename_column :decidim_moderations,
                  :decidim_participatory_process_id,
                  :decidim_participatory_space_id

    add_index :decidim_moderations,
              [:decidim_participatory_space_id, :decidim_participatory_space_type],
              name: "decidim_moderations_participatory_space"

    change_column_null :decidim_moderations, :decidim_participatory_space_type, false
  end
end
