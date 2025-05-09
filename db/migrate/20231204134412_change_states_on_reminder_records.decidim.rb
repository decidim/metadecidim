# frozen_string_literal: true

# This migration comes from decidim (originally 20230427105701)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class ChangeStatesOnReminderRecords < ActiveRecord::Migration[6.1]
  class ReminderRecord < ApplicationRecord
    self.table_name = :decidim_reminder_records
    STATES = { active: 0, pending: 10, completed: 20, deleted: -1 }.freeze
  end

  def up
    rename_column :decidim_reminder_records, :state, :old_state
    add_column :decidim_reminder_records, :state, :integer, default: 0, null: false

    ReminderRecord.reset_column_information

    ReminderRecord::STATES.each_pair do |status, index|
      ReminderRecord.where(old_state: status).update_all(state: index) # rubocop:disable Rails/SkipsModelValidations
    end

    remove_column :decidim_reminder_records, :old_state
  end

  def down
    rename_column :decidim_reminder_records, :state, :old_state
    add_column :decidim_reminder_records, :state, :string, default: "draft", null: false
    ReminderRecord.reset_column_information

    ReminderRecord::STATES.each_pair do |status, index|
      ReminderRecord.where(old_state: index).update_all(state: status) # rubocop:disable Rails/SkipsModelValidations
    end

    remove_column :decidim_reminder_records, :old_state
  end
end
