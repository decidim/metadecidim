# frozen_string_literal: true

# This migration comes from decidim (originally 20200320105917)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class IndexForeignKeysInDecidimContextualHelpSections < ActiveRecord::Migration[5.2]
  def change
    add_index :decidim_contextual_help_sections, :section_id
  end
end
