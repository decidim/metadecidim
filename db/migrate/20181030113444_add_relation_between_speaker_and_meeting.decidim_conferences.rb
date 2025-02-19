# frozen_string_literal: true

# This migration comes from decidim_conferences (originally 20181010133930)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddRelationBetweenSpeakerAndMeeting < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_conference_speaker_conference_meetings do |t|
      t.belongs_to :conference_speaker, null: false, index: { name: "index_meetings_on_decidim_conference_speaker_id" }
      t.belongs_to :conference_meeting, null: false, index: { name: "index_meetings_on_decidim_conference_meeting_id" }
    end
  end
end
