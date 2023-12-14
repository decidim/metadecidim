# frozen_string_literal: true

require "rails_helper"
require "decidim/proposals/test/factories"

describe "Views the proposals answers overrides", type: :system do
  let!(:finished_proposal) { create :proposal, :accepted, component:, title: { en: "This proposal has finished" } }
  let!(:progressing_proposal) { create :proposal, :evaluating, component:, title: { en: "This proposal is in progress" } }

  include_context "with a component"
  let(:manifest_name) { "proposals" }

  describe "index" do
    before do
      visit_component
    end

    it "views the overrided colors" do
      within "main" do
        # Capybara understands rgba instead of hexadecimal colors
        expect(page.find("span.label.finished")).to match_style("background-color" => "rgba(246, 245, 252, 1)")
        expect(page.find("span.label.finished")).to match_style("color" => "rgba(102, 57, 186, 1)")
        expect(page.find("span.label.progressing")).to match_style("background-color" => "rgba(196, 236, 208, 1)")
        expect(page.find("span.label.progressing")).to match_style("color" => "rgba(22, 89, 34, 1)")
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

    context "with another locale" do
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
  end

  describe "show" do
    before do
      visit Decidim::EngineRouter.main_proxy(component).proposal_path(proposal)
    end

    context "with the finished proposal" do
      let(:proposal) { finished_proposal }

      it "views the overrided colors" do
        within "main" do
          # Capybara understands rgba instead of hexadecimal colors
          expect(page.find("div.flash.finished")).to match_style("background-color" => "rgba(246, 245, 252, 1)")
          expect(page.find("div.flash.finished")).to match_style("border-color" => "rgb(102, 57, 186)")
        end
      end

      it "views the overrided strings" do
        within "main div.flash.finished" do
          expect(page).to have_content("This proposal has been implemented")
        end
      end

      context "with another locale" do
        before do
          within_language_menu do
            click_link "Castellano"
          end
        end

        it "views the overrided strings" do
          within "main div.flash.finished" do
            expect(page).to have_content("Esta propuesta ha sido implementada")
          end
        end
      end
    end

    context "with the progressing proposal" do
      let(:proposal) { progressing_proposal }

      it "views the overrided colors" do
        within "main" do
          # Capybara understands rgba instead of hexadecimal colors
          expect(page.find("div.flash.progressing")).to match_style("background-color" => "rgba(196, 236, 208, 1)")
          expect(page.find("div.flash.progressing")).to match_style("border-color" => "rgb(22, 89, 34)")
        end
      end

      it "views the overrided strings" do
        within "main div.flash.progressing" do
          expect(page).to have_content("This proposal has been accepted")
        end
      end

      context "with another locale" do
        before do
          within_language_menu do
            click_link "Català"
          end
        end

        it "views the overrided strings" do
          within "main div.flash.progressing" do
            expect(page).to have_content("Aquesta proposta ha sigut acceptada")
          end
        end
      end
    end
  end
end
