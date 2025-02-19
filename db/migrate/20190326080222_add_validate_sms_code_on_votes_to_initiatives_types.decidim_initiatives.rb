# frozen_string_literal: true

# This migration comes from decidim_initiatives (originally 20190124170442)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddValidateSmsCodeOnVotesToInitiativesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_initiatives_types, :validate_sms_code_on_votes, :boolean, default: false
  end
end
