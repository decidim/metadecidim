# frozen_string_literal: true

# This migration comes from decidim (originally 20170119145359)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateUserGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :decidim_user_groups do |t|
      t.string :name, null: false
      t.string :document_number, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
