# frozen_string_literal: true

# This migration comes from decidim (originally 20181108131058)
# This file has been modified by `decidim upgrade:migrations` task on 2025-02-19 10:36:38 UTC
class AddUsersRegistrationModeToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_organizations, :users_registration_mode, :integer, default: 0, null: false
  end
end
