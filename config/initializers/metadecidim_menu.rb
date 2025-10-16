# frozen_string_literal: true

Decidim.menu :metadecidim_home_content_block_menu do |menu|
  start_here_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.participatory_process_path("Welcome")
  menu.add_item :start_here,
    I18n.t("menu.start_here", scope: "decidim"),
    start_here_path,
    position: 10,
    active: :inclusive

  participate_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.participatory_process_group_path(76)
  menu.add_item :participate,
    I18n.t("menu.participate", scope: "decidim"),
    participate_path,
    position: 20,
    active: :inclusive

  governance_path = Decidim::Assemblies::Engine.routes.url_helpers.assembly_path("the-association")
  menu.add_item :governance,
    I18n.t("menu.governance", scope: "decidim"),
    governance_path,
    position: 40,
    active: :inclusive

  news_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.decidim_participatory_process_blogs_path("news", 1719)
  menu.add_item :news,
    I18n.t("menu.news", scope: "decidim"),
    news_path,
    position: 50,
    active: :inclusive

  community_meetings_path = Decidim::Assemblies::Engine.routes.url_helpers.assembly_path("eix-comunitat")
  menu.add_item :community_meetings,
    I18n.t("menu.community_meetings", scope: "decidim"),
    community_meetings_path,
    position: 52,
    active: :inclusive

  conferences_path = Decidim::Conferences::Engine.routes.url_helpers.conferences_path
  menu.add_item :decidim_fest,
    I18n.t("menu.decidim_fest", scope: "decidim"),
    conferences_path,
    position: 55,
    active: :inclusive

  chat_url = "http://chat.decidim.org"
  menu.add_item :chat,
    I18n.t("menu.chat", scope: "decidim"),
    chat_url,
    position: 60,
    active: :false
end

Decidim.menu :metadecidim_menu do |menu|
  menu.add_item :root,
              I18n.t("menu.home", scope: "decidim"),
              decidim.root_path,
              position: 1,
              active: :exclusive

  start_here_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.participatory_process_path("Welcome")
  menu.add_item :start_here,
    I18n.t("menu.start_here", scope: "decidim"),
    start_here_path,
    position: 10,
    active: :inclusive

  participate_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.participatory_process_group_path(76)
  menu.add_item :participate,
    I18n.t("menu.participate", scope: "decidim"),
    participate_path,
    position: 20,
    active: :inclusive

  governance_path = Decidim::Assemblies::Engine.routes.url_helpers.assembly_path("the-association")
  menu.add_item :governance,
    I18n.t("menu.governance", scope: "decidim"),
    governance_path,
    position: 40,
    active: :inclusive

  news_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.decidim_participatory_process_blogs_path("news", 1719)
  menu.add_item :news,
    I18n.t("menu.news", scope: "decidim"),
    news_path,
    position: 50,
    active: :inclusive

  community_meetings_path = Decidim::Assemblies::Engine.routes.url_helpers.assembly_path("eix-comunitat")
  menu.add_item :community_meetings,
    I18n.t("menu.community_meetings", scope: "decidim"),
    community_meetings_path,
    position: 52,
    active: :inclusive

  conferences_path = Decidim::Conferences::Engine.routes.url_helpers.conferences_path
  menu.add_item :decidim_fest,
    I18n.t("menu.decidim_fest", scope: "decidim"),
    conferences_path,
    position: 55,
    active: :inclusive

  chat_url = "http://chat.decidim.org"
  menu.add_item :chat,
    I18n.t("menu.chat", scope: "decidim"),
    chat_url,
    position: 60,
    active: :false
end

# Monkey patch MenuHelper to have a custom menu
Rails.application.config.to_prepare do
  Decidim::MenuHelper.module_eval do
    def home_content_block_menu
      menu_name = current_organization.name["en"] == "Metadecidim" ? :metadecidim_home_content_block_menu : :home_content_block_menu

      @home_content_block_menu ||= ::Decidim::MenuPresenter.new(
        menu_name,
        self,
        element_class: "main-nav__link",
        active_class: "main-nav__link--active",
        label: t("layouts.decidim.header.main_menu")
      )
    end

    def breadcrumb_root_menu
      menu_name = current_organization.name["en"] == "Metadecidim" ? :metadecidim_menu : :menu

      @breadcrumb_root_menu ||= ::Decidim::BreadcrumbRootMenuPresenter.new(
        menu_name,
        self,
        container_options: { class: "menu-bar__dropdown-menu" }
      )
    end

    def footer_menu
      menu_name = current_organization.name["en"] == "Metadecidim" ? :metadecidim_menu : :menu

      @footer_menu ||= ::Decidim::FooterMenuPresenter.new(
        menu_name,
        self,
        element_class: "font-semibold underline",
        active_class: "is-active",
        container_options: { class: "space-y-4 break-inside-avoid" },
        label: t("layouts.decidim.footer.decidim_title")
      )
    end

    def mobile_breadcrumb_root_menu
      menu_name = current_organization.name["en"] == "Metadecidim" ? :metadecidim_menu : :mobile_menu

      @mobile_breadcrumb_root_menu ||= ::Decidim::BreadcrumbRootMenuPresenter.new(
        menu_name,
        self,
        container_options: { class: "menu-bar__dropdown-menu" }
      )
    end
  end
end
