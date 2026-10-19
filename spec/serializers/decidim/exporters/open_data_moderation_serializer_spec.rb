# frozen_string_literal: true

require "rails_helper"
require "decidim/proposals/test/factories"

describe Decidim::Exporters::OpenDataModerationSerializer do
  subject { described_class.new(moderation).serialize }

  let(:organization) { create(:organization) }
  let(:participatory_space) { create(:participatory_process, organization:) }
  let(:component) { create(:proposal_component, participatory_space:) }
  let(:reportable) { create(:proposal, component:) }
  let(:moderation) { create(:moderation, reportable:, participatory_space:, hidden_at: Time.current) }

  it "exports the reported content url" do
    expect(subject[:reported_url]).to eq(reportable.reported_content_url)
    expect(subject[:reportable_id]).to eq(reportable.id)
  end

  context "when the reported content url cannot be built" do
    before do
      allow(moderation.reportable).to receive(:reported_content_url).and_raise(NoMethodError)
    end

    it "exports an empty url instead of raising" do
      expect(subject[:reported_url]).to be_nil
      expect(subject[:id]).to eq(moderation.id)
    end
  end

  context "when the reportable no longer exists" do
    before do
      moderation.update_columns(decidim_reportable_id: reportable.id + 1000)
      moderation.reload
    end

    it "exports an empty url instead of raising" do
      expect(subject[:reported_url]).to be_nil
    end
  end

  context "when the reportable class no longer exists" do
    before do
      moderation.update_columns(decidim_reportable_type: "Decidim::Removed::Module")
      moderation.reload
    end

    it "exports an empty url instead of raising" do
      expect(subject[:reported_url]).to be_nil
      expect(subject[:reportable_type]).to eq("Decidim::Removed::Module")
    end
  end
end
