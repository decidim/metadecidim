# frozen_string_literal: true

# This migration comes from decidim_assemblies (originally 20180314143822)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class AddAssemblyMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_assembly_members do |t|
      t.references :decidim_assembly, index: true
      t.integer :weight, null: false, default: 0, index: { name: "index_decidim_assembly_members_on_weight" }
      t.string :full_name
      t.string :gender
      t.date :birthday
      t.string :birthplace
      t.date :designation_date
      t.string :designation_mode
      t.string :position
      t.string :position_other
      t.date :ceased_date

      t.timestamps
    end
  end
end
