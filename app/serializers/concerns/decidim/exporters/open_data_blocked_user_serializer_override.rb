# frozen_string_literal: true

module Decidim
  module Exporters
    # Users blocked with Decidim 0.27.3 have their UserBlock record but no
    # `block_id`, so `resource.blocking` is nil and the whole Open Data export
    # aborts. Fall back to the user's latest UserBlock.
    module OpenDataBlockedUserSerializerOverride
      extend ActiveSupport::Concern

      included do
        # Public: Exports a hash with the serialized data for this resource.
        def serialize
          {
            user_id: resource.user.id,
            blocked_at: resource.user.blocked_at,
            about: resource.user.about,
            reasons: resource.reports.map(&:reason),
            details: resource.reports.map(&:details),
            block_reasons: blocking&.justification,
            blocking_user: blocking&.blocking_user&.presenter&.name
          }
        end

        private

        def blocking
          @blocking ||= resource.blocking || Decidim::UserBlock.where(decidim_user_id: resource.decidim_user_id).order(:id).last
        end
      end
    end
  end
end
