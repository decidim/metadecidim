# frozen_string_literal: true

require "rails_helper"
require "decidim/proposals/test/factories"

describe "Views the proposals answers overrides", type: :system do
  let!(:accepted_proposal) { create :proposal, :accepted, component: }
  let!(:evaluating_proposal) { create :proposal, :evaluating, component: }

  include_context "with a component"
  let(:manifest_name) { "proposals" }

  before do
    visit_component
  end

  it "views the overrided colors" do
    within "main" do
      # Capybara understands rgba instead of hexadecimal colors
      expect(page.find("span.label.success")).to match_style("background-color" => "rgba(204, 190, 230, 1)")
      expect(page.find("span.label.success")).to match_style("color" => "rgba(102, 57, 186, 1)")
      expect(page.find("span.label.warning")).to match_style("background-color" => "rgba(196, 236, 208, 1)")
      expect(page.find("span.label.warning")).to match_style("color" => "rgba(22, 89, 46, 1)")
    end
  end

  context "with the english locale" do
    it "views the overrided strings" do
      within "main" do
        expect(page).to have_content("Finished")
        expect(page).to have_content("Accepted / In progress")
      end
    end
  end

  context "with the catalan locale" do
    before do
      within_language_menu do
        click_link "Català"
      end
    end

    it "views the overrided strings" do
      within "main" do
        expect(page).to have_content("Finalitzada")
        expect(page).to have_content("Acceptada / En curs")
      end
    end
  end

  context "with the spanish locale" do
    before do
      within_language_menu do
        click_link "Castellano"
      end
    end

    it "views the overrided strings" do
      within "main" do
        expect(page).to have_content("Finalizada")
        expect(page).to have_content("Aceptada / En curso")
      end
    end
  end
end
