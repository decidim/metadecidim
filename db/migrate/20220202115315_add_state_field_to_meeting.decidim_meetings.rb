# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20210727085318)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddStateFieldToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_meetings_meetings, :state, :string, index: true
  end
end
