# frozen_string_literal: true

Decidim.menu :metadecidim_menu do |menu|
  menu.remove_item :assemblies
  menu.remove_item :conferences
  menu.remove_item :initiatives
  menu.remove_item :consultations
  menu.remove_item :participatory_processes
  menu.remove_item :pages
  menu.remove_item :root

  welcome_path = Decidim::ParticipatoryProcesses::Engine.routes.url_helpers.participatory_process_path("Welcome")
  menu.add_item :welcome,
    I18n.t("menu.welcome", scope: "decidim"),
    welcome_path,
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
