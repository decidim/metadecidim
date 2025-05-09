# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20200827153856)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddCommentableCounterCacheToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_meetings_meetings, :comments_count, :integer, null: false, default: 0
    Decidim::Meetings::Meeting.reset_column_information
    Decidim::Meetings::Meeting.unscoped.find_each(&:update_comments_count)
  end
end
