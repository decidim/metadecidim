# frozen_string_literal: true

# This migration comes from decidim (originally 20171107103254)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
# This migration adds the optional `object_changes` column, in which PaperTrail
# will store the `changes` diff for each update event. See the readme for
# details.
class AddObjectChangesToVersions < ActiveRecord::Migration[5.1]
  # The largest text column available in all supported RDBMS.
  # See `create_versions.rb` for details.
  TEXT_BYTES = 1_073_741_823

  def change
    add_column :versions, :object_changes, :text, limit: TEXT_BYTES
  end
end
