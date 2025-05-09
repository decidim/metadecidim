# frozen_string_literal: true

# This migration comes from decidim (originally 20180206183235)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateParticipatorySpacePrivateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_participatory_space_private_users do |t|
      t.references :decidim_user, index: { name: "index_decidim_spaces_users_on_private_user_id" }
      t.integer :privatable_to_id
      t.string :privatable_to_type

      t.timestamps
    end

    add_index(:decidim_participatory_space_private_users, [:privatable_to_type, :privatable_to_id], name: "space_privatable_to_privatable_id")
  end
end
