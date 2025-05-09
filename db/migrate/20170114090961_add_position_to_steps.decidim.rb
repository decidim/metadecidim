# frozen_string_literal: true

# This migration comes from decidim (originally 20161020080756)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddPositionToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_process_steps, :position, :integer, null: false
    add_index :decidim_participatory_process_steps, :position, order: { position: :asc }, name: "index_order_by_position_for_steps"
    add_index :decidim_participatory_process_steps, [:decidim_participatory_process_id, :position], unique: true, name: "index_unique_position_for_process"
  end
end
