# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20211125202008)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateDecidimParticipatoryProcessTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :decidim_participatory_process_types do |t|
      t.jsonb :title, null: false
      t.references(
        :decidim_organization,
        foreign_key: true,
        index: { name: "index_decidim_process_types_on_decidim_organization_id" }
      )
      t.timestamps
    end

    add_reference(
      :decidim_participatory_processes,
      :decidim_participatory_process_type,
      foreign_key: true,
      index: { name: "index_decidim_processes_on_decidim_process_type_id" }
    )
  end
end
