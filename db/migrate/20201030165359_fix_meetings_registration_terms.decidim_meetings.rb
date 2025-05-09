# frozen_string_literal: true

# This migration comes from decidim_meetings (originally 20201016065302)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class FixMeetingsRegistrationTerms < ActiveRecord::Migration[5.2]
  def up
    reset_column_information

    PaperTrail.request(enabled: false) do
      Decidim::Meetings::Meeting.unscoped.find_each do |meeting|
        next if meeting.component.nil?
        # Only user-created meetings have this problem
        next if meeting.official?

        # Since user-created meetings have no way to override the `registration_terms` field
        # and it is supposed to use the component defaults,
        # we can safely override this.
        meeting.registration_terms = meeting.component.settings.default_registration_terms
        meeting.save!
      end
    end
    reset_column_information
  end

  def down; end

  def reset_column_information
    Decidim::Meetings::Meeting.reset_column_information
    Decidim::Component.reset_column_information
  end
end
