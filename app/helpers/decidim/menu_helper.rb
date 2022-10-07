# frozen_string_literal: true

module Decidim
  # Override helper to manage menus in layout
  module MenuHelper
    # Public: Returns the main menu presenter object
    #
    # We override this from the Decidim standard, so we can present the Metadecidim menu for the
    # Decidim organization in the Multitenant
    def main_menu
      menu_name = current_organization.name == "Metadecidim" ? :metadecidim_menu : :menu

      @main_menu ||= ::Decidim::MenuPresenter.new(
        menu_name,
        self,
        element_class: "main-nav__link",
        active_class: "main-nav__link--active",
        label: t("layouts.decidim.header.main_menu")
      )
    end
  end
end
