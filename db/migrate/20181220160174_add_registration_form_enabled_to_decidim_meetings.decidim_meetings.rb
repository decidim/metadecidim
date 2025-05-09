# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20180801150031)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class AddRegistrationFormEnabledToDecidimMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_meetings_meetings, :registration_form_enabled, :boolean, default: false
  end
end
