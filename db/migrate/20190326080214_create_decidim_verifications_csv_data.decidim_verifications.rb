# frozen_string_literal: true

# This migration comes from decidim_verifications (originally 20181227135423)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:43 UTC
class CreateDecidimVerificationsCsvData < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_verifications_csv_data do |t|
      t.string :email
      t.references :decidim_organization, foreign_key: true, index: { name: "index_verifications_csv_census_to_organization" }

      t.timestamps
    end
  end
end
