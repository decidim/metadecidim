# frozen_string_literal: true

# This migration comes from decidim (originally 20240722215500)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class ChangeObjectChangesOnVersions < ActiveRecord::Migration[6.1]
  def up
    rename_column :versions, :object_changes, :old_object_changes
    add_column :versions, :object_changes, :jsonb # or :json

    PaperTrail::Version.reset_column_information

    PaperTrail::Version.where.not(old_object_changes: nil).find_each do |version|
      # we set a time interval to ensure that deployment has succeeded
      Decidim::Migrate::PaperTrailJob.set(wait: 10.minutes).perform_later(version.id)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
