# frozen_string_literal: true

Decidim.configure do |config|
  config.omniauth_providers = {
    decidim: {
      enabled: true,
      client_id:  ENV["DECIDIM_CLIENT_ID"],
      client_secret: ENV["DECIDIM_CLIENT_SECRET"],
      site_url: ENV["DECIDIM_SITE_URL"]
    },
    facebook: {
      enabled: false
    },
    twitter: {
      enabled: false
    },
    google_oauth2: {
      enabled: false
    }
  }

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
