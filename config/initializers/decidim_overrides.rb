# frozen_string_literal: true

Rails.application.config.to_prepare do
  Decidim::Exporters::OpenDataModerationSerializer.include(Decidim::Exporters::OpenDataModerationSerializerOverride)
  Decidim::Exporters::OpenDataBlockedUserSerializer.include(Decidim::Exporters::OpenDataBlockedUserSerializerOverride)
end
