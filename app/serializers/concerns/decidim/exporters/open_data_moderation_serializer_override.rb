# frozen_string_literal: true

module Decidim
  module Exporters
    # Stops a single moderation from aborting the whole Open Data export.
    # Computing the URL of the reported content raises when it belongs to a
    # removed module (e.g. collaborative drafts) or to a component in the
    # trash. In those cases the URL is exported as empty.
    module OpenDataModerationSerializerOverride
      extend ActiveSupport::Concern

      included do
        # Public: Exports a hash with the serialized data for this resource.
        def serialize
          {
            id: resource.id,
            hidden_at: resource.hidden_at,
            report_count: resource.report_count,
            reported_url:,
            reportable_type: resource.decidim_reportable_type,
            reportable_id: resource.decidim_reportable_id,
            reported_content: resource.reported_content,
            reports: {
              reasons: resource.reports.map(&:reason),
              locale: resource.reports.map(&:locale),
              details: resource.reports.map(&:details)
            }
          }
        end

        private

        def reported_url
          resource.reportable&.reported_content_url
        rescue StandardError => e
          Rails.logger.warn("[OpenData] Could not build reported_url for moderation #{resource.id}: #{e.class}")
          nil
        end
      end
    end
  end
end
