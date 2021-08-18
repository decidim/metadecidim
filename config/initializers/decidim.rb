# frozen_string_literal: true

Decidim.configure do |config|
  config.application_name = "Metadecidim"
  config.mailer_sender = Rails.application.secrets.email
  config.authorization_handlers = []

  config.default_locale = :ca
  config.available_locales = %i[en ca es]

  config.maps = {
    provider: :here,
    api_key: Rails.application.secrets.geocoder[:here_api_key],
    static: { url: "https://image.maps.ls.hereapi.com/mia/1.6/mapview" }
  }
  config.geocoder = {
    timeout: 5,
    units: :km
  }

  config.currency_unit = "€"
  config.enable_html_header_snippets = true
  config.unconfirmed_access_for = 0.days

  if Rails.application.secrets.sms.values.all?(&:present?)
    config.sms_gateway_service = "SmsGateway"
  end
end

Decidim::Initiatives.do_not_require_authorization = true

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale

Devise.allow_unconfirmed_access_for = Decidim.unconfirmed_access_for
