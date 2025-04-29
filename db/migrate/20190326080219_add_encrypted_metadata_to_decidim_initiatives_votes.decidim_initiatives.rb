# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20181220134322)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddEncryptedMetadataToDecidimInitiativesVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_votes, :encrypted_metadata, :text
  end
end
