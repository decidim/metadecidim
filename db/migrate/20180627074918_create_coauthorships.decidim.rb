# frozen_string_literal: true

# This migration comes from decidim (originally 20180427141253)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class CreateCoauthorships < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_coauthorships do |t|
      t.references :decidim_author, null: false, index: { name: "index_author_on_coauthorsihp" }
      t.references :decidim_user_group, index: { name: "index_user_group_on_coauthorsihp" }
      t.references :coauthorable, polymorphic: true, index: { name: "index_coauthorable_on_coauthorship" }

      t.timestamps
    end
  end
end
