Devise.setup do |config|
  config.omniauth :decidim,
    ENV["DECIDIM_CLIENT_ID"],
    ENV["DECIDIM_CLIENT_SECRET"],
    ENV["DECIDIM_SITE_URL"],
    scope: :public
end

Decidim::User.omniauth_providers << :decidim
