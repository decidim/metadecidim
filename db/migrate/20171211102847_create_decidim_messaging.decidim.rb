# frozen_string_literal: true

# This migration comes from decidim (originally 20171023123330)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class CreateDecidimMessaging < ActiveRecord::Migration[5.1]
  def change
    create_table :decidim_messaging_conversations, &:timestamps

    create_table :decidim_messaging_participations do |t|
      t.references :decidim_conversation, null: false, index: { name: "index_conversation_participations_on_conversation_id" }
      t.references :decidim_participant, null: false, index: { name: "index_conversation_participations_on_participant_id" }

      t.timestamps
    end

    create_table :decidim_messaging_messages do |t|
      t.references :decidim_conversation, null: false
      t.references :decidim_sender, null: false

      t.text :body, null: false

      t.timestamps
    end
  end
end
