# frozen_string_literal: true

# This migration comes from decidim_accountability (originally 20220331150155)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class MoveLegacyDescriptionToTitleOfTimelineEntries < ActiveRecord::Migration[6.1]
  class TimelineEntry < ApplicationRecord
    self.table_name = :decidim_accountability_timeline_entries
  end

  def up
    TimelineEntry.find_each do |timeline_entry|
      timeline_entry.update!(title: timeline_entry.description, description: nil)
    end
  end
end
