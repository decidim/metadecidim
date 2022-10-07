# frozen_string_literal: true

require "rails_helper"

describe "Views the menu", type: :system, perform_enqueued: true do
  let(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
  end

  it "has the elements" do
    visit decidim.root_path

    within ".navbar" do
      expect(page).to have_content("Home")
      expect(page).to have_content("Initiatives")
      expect(page).to have_content("Help")
    end
  end

  context "with Metadecidim organization" do
    let(:organization) { create :organization, name: "Metadecidim" }

    it "has the elements" do
      visit decidim.root_path

      within ".navbar" do
        expect(page).to have_content("Welcome")
        expect(page).to have_content("Participate")
        expect(page).to have_content("Meetings")
        expect(page).to have_content("Our governance")
        expect(page).to have_content("News")
        expect(page).to have_content("Chat")
      end
    end
  end
end
