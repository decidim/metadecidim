# frozen_string_literal: true

require "rails_helper"

describe "Views the menu", type: :system, perform_enqueued: true do
  let(:organization) { create :organization }
  let(:user) { create :user, :confirmed }

  before do
    Decidim::ContentBlock.create!(
      organization:,
      scope_name: :homepage,
      scoped_resource_id: nil,
      manifest_name: :global_menu,
      published_at: Time.zone.now
    )

    switch_to_host(organization.host)
  end

  it "the user menu has the elements" do
    login_as user, scope: :user
    visit decidim.account_path

    within "#dropdown-menu-profile" do
      expect(page).to have_content("Account")
      expect(page).to have_content("Notifications settings")
      expect(page).to have_content("My interests")
      expect(page).to have_content("My data")
      expect(page).to have_content("Delete my account")
    end
  end

  context "with Metadecidim organization" do
    let(:organization) { create :organization, name: { en: "Metadecidim" } }

    it "the main menu has the Metadecidim elements" do
      visit decidim.root_path

      within "#home__menu" do
        expect(page).to have_content("Start here")
        expect(page).to have_content("Participate")
        expect(page).to have_content("The Association")
        expect(page).to have_content("News")
        expect(page).to have_content("Decidim Fest")
        expect(page).to have_content("Chat")
      end
    end

    it "the footer menu has the Metadecidim elements" do
      visit decidim.root_path

      within ".main-footer" do
        expect(page).to have_content("Home")
        expect(page).to have_content("Start here")
        expect(page).to have_content("Participate")
        expect(page).to have_content("The Association")
        expect(page).to have_content("News")
        expect(page).to have_content("Decidim Fest")
        expect(page).to have_content("Chat")
      end
    end

    it "the breadcrumb menu has the Metadecidim elements" do
      visit decidim.pages_path

      find("a.menu-bar__breadcrumb-desktop__dropdown-trigger").sibling("button[data-component='dropdown']").hover

      within "#breadcrumb-main-dropdown-desktop" do
        expect(page).to have_content("Home")
        expect(page).to have_content("Start here")
        expect(page).to have_content("Participate")
        expect(page).to have_content("The Association")
        expect(page).to have_content("News")
        expect(page).to have_content("Decidim Fest")
        expect(page).to have_content("Chat")
      end
    end

    context "with another locale" do
      before do
        visit decidim.root_path

        within_language_menu do
          click_link "Català"
        end
      end

      specify "the menu is translated" do
        within "#home__menu" do
          expect(page).to have_content("Comença aquí")
          expect(page).to have_content("Participa")
          expect(page).to have_content("L'Associació")
          expect(page).to have_content("Notícies")
          expect(page).to have_content("Decidim Fest")
          expect(page).to have_content("Xat")
        end
      end
    end
    context "when the device is mobile" do
      before do
        driven_by(:iphone)
        switch_to_host(organization.host)
        visit decidim.root_path
      end

      specify "the menu is customized" do
        click_on "Main menu"

        within "#breadcrumb-main-dropdown-mobile" do
          expect(page).to have_content("Home")
          expect(page).to have_content("Start here")
          expect(page).to have_content("Participate")
          expect(page).to have_content("The Association")
          expect(page).to have_content("News")
          expect(page).to have_content("Decidim Fest")
          expect(page).to have_content("Chat")
        end
      end
    end
  end
end
