# frozen_string_literal: true

# This migration comes from decidim (originally 20230322101707)
# This file has been modified by `decidim upgrade:migrations` task on 2025-04-29 11:25:42 UTC
class RenameTermsOfUse < ActiveRecord::Migration[6.1]
  def change
    rename_column :decidim_organizations, :admin_terms_of_use_body, :admin_terms_of_service_body

    # rubocop:disable Rails/SkipsModelValidations
    reversible do |dir|
      dir.up do
        Decidim::StaticPage.where(slug: "terms-and-conditions").update_all(
          slug: "terms-of-service"
        )
      end

      dir.down do
        Decidim::StaticPage.where(slug: "terms-of-service").update_all(
          slug: "terms-and-conditions"
        )
      end
    end
    # rubocop:enable Rails/SkipsModelValidations
  end
end
