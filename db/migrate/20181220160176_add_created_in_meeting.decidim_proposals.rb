# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20181026073215)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddCreatedInMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_proposals_proposals, :created_in_meeting, :boolean, default: false
  end
end
