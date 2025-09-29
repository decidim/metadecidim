# frozen_string_literal: true

Decidim.configure do |config|
  config.sms_gateway_service = "SmsGateway"

  # Machine Translation Configuration
  #
  # See Decidim docs at https://docs.decidim.org/en/develop/machine_translations/
  # for more information about how it works and how to set it up.
  #
  # Enable machine translations
  config.enable_machine_translations = false

  # Defines data consent categories and items (aka cookies consent).
  # config.consent_categories = [
  #   {
  #     slug: "essential",
  #     mandatory: true,
  #     items: [
  #       {
  #         type: "cookie",
  #         name: "_session_id"
  #       },
  #       {
  #         type: "cookie",
  #         name: Decidim.consent_cookie_name
  #       }
  #     ]
  #   },
  #   {
  #     slug: "preferences",
  #     mandatory: false
  #   },
  #   {
  #     slug: "analytics",
  #     mandatory: false
  #   },
  #   {
  #     slug: "marketing",
  #     mandatory: false
  #   }
  # ]
end


Rails.application.config.i18n.available_locales = Decidim.available_locales
Rails.application.config.i18n.default_locale = Decidim.default_locale

# Inform Decidim about the assets folder
Decidim.register_assets_path File.expand_path("app/packs", Rails.application.root)

Decidim.configure do |config|
  config.consent_categories = [
    {
      slug: "essential",
      mandatory: true,
      items: [
        {
          type: "cookie",
          name: "_session_id"
        },
        {
          type: "cookie",
          name: Decidim.consent_cookie_name
        },
        {
          type: "cookie",
          name: "remember_user_token"
        }
      ]
    },
    {
      slug: "preferences",
      mandatory: false,
      items: [
        {
          type: "localstorage",
          name: "emojiPicker-recent"
        },
        {
          type: "localstorage",
          name: "graphiql:docExplorerOpen"
        },
        {
          type: "localstorage",
          name: "graphiql:editorFlex"
        },
        {
          type: "localstorage",
          name: "graphiql:historyPaneOpen"
        },
        {
          type: "localstorage",
          name: "graphiql:queries"
        },
        {
          type: "localstorage",
          name: "graphiql:query"
        },
        {
          type: "localstorage",
          name: "graphiql:tabState"
        },
        {
          type: "cookie",
          name: "YSC"
        },
        {
          type: "cookie",
          name: "VISITOR_INFO1_LIVE"
        },
        {
          type: "cookie",
          name: "PREF"
        },
        {
          type: "cookie",
          name: "CONSENT"
        },
        {
          type: "localstorage",
          name: "language"
        },
        {
          type: "localstorage",
          name: "features/base/known-domains"
        },
        {
          type: "localstorage",
          name: "features/base/settings"
        },
        {
          type: "localstorage",
          name: "features/calendar-sync"
        },
        {
          type: "localstorage",
          name: "features/dropbox"
        },
        {
          type: "localstorage",
          name: "features/prejoin"
        },
        {
          type: "localstorage",
          name: "features/recent-list"
        },
        {
          type: "localstorage",
          name: "features/video-quality-persistent-storage"
        },
        {
          type: "localstorage",
          name: "features/virtual-background"
        },
        {
          type: "localstorage",
          name: "endpointID"
        },
        {
          type: "localstorage",
          name: "callStatsUserName"
        },
        {
          type: "localstorage",
          name: "endpointID"
        },
        {
          type: "localstorage",
          name: "callStatsUserName"
        },
        {
          type: "localstorage",
          name: "endpointID"
        },
      ]
    },
    {
      slug: "analytics",
      mandatory: false,
      items: [
        {
          type: "cookie",
          name: "VISITOR_INFO1_LIVE"
        },
        {
          type: "localstorage",
          name: "amp_"
        },
        {
          type: "localstorage",
          name: "amplitude_unsent"
        },
        {
          type: "localstorage",
          name: "amplitude_unsent_identify"
        },
      ]
    },
    {
      slug: "marketing",
      mandatory: false,
      items: [
        {
          type: "cookie",
          name: "VISITOR_INFO1_LIVE"
        }
      ]
    }
  ]
end

Decidim.icons.register(name: "decidim-fill", icon: "decidim-fill", category: "system", description: "", engine: :core)
