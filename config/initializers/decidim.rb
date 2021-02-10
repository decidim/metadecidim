# frozen_string_literal: true

Decidim.configure do |config|
  config.application_name = "Metadecidim"
  config.mailer_sender = Rails.application.secrets.email
  config.authorization_handlers = []

  # Change these lines to set your preferred locales
  config.default_locale = :ca
  config.available_locales = %i[en ca es]

  # Geocoder configuration
  config.geocoder = {
    static_map_url: "https://image.maps.ls.hereapi.com/mia/1.6/mapview",
    here_api_key: Rails.application.secrets.geocoder[:here_api_key]
  }
  config.maps = {
    provider: :here,
    api_key: Rails.application.secrets.geocoder[:here_api_key],
    static: { url: "https://image.maps.ls.hereapi.com/mia/1.6/mapview" }
  }
  config.geocoder = {
    timeout: 5,
    units: :km
  }

  # Custom resource reference generator method
  # config.resource_reference_generator = lambda do |resource, feature|
  #   # Implement your custom method to generate resources references
  #   "1234-#{resource.id}"
  # end

  # Currency unit
  config.currency_unit = "€"

  # The number of reports which an object can receive before hiding it
  # config.max_reports_before_hiding = 3

  # Custom HTML Header snippets
  #
  # The most common use is to integrate third-party services that require some
  # extra JavaScript or CSS. Also, you can use it to add extra meta tags to the
  # HTML. Note that this will only be rendered in public pages, not in the admin
  # section.
  #
  # Before enabling this you should ensure that any tracking that might be done
  # is in accordance with the rules and regulations that apply to your
  # environment and usage scenarios. This feature also comes with the risk
  # that an organization's administrator injects malicious scripts to spy on or
  # take over user accounts.
  #
  config.enable_html_header_snippets = true

  # See Devise :confirmable. We ask for confirmation before creating an account.
  config.unconfirmed_access_for = 0.days

  if Rails.application.secrets.sms.values.all?(&:present?)
    config.sms_gateway_service = "SmsGateway"
  end
end

Decidim::Initiatives.do_not_require_authorization = true

Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale
