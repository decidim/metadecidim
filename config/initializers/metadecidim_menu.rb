# frozen_string_literal: true

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

  meetings_path = Decidim::Meetings::DirectoryEngine.routes.url_helpers.root_path
  menu.add_item :meetings,
    I18n.t("menu.meetings", scope: "decidim"),
    meetings_path,
    position: 30,
    active: :inclusive

  governance_path = Decidim::Assemblies::Engine.routes.url_helpers.assembly_path("our-governance")
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

  chat_url = "http://chat.decidim.org"
  menu.add_item :chat,
    I18n.t("menu.chat", scope: "decidim"),
    chat_url,
    position: 60,
    active: :false
end
