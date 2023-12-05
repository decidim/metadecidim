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
    let(:organization) { create :organization, name: "Metadecidim" }

    it "the main menu has the Metadecidim elements" do
      visit decidim.root_path

      within "#home__menu" do
        expect(page).to have_content("Home")
        expect(page).to have_content("Start here")
        expect(page).to have_content("Participate")
        expect(page).to have_content("Meetings")
        expect(page).to have_content("Our governance")
        expect(page).to have_content("News")
        expect(page).to have_content("Chat")
      end
    end
  end
end
