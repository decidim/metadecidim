# frozen_string_literal: true

require "rails_helper"

describe Decidim::Exporters::OpenDataBlockedUserSerializer do
  subject { described_class.new(user_moderation).serialize }

  let(:organization) { create(:organization) }
  let(:admin) { create(:user, :admin, :confirmed, organization:) }
  let(:user) { create(:user, :blocked, :confirmed, organization:) }
  let!(:user_block) { create(:user_block, organization:, user:, blocking_user: admin, justification: "Spam account") }
  let(:user_moderation) { create(:user_moderation, user:) }

  it "exports the block justification and the blocking user" do
    expect(subject[:block_reasons]).to eq("Spam account")
    expect(subject[:blocking_user]).to eq(admin.presenter.name)
  end

  context "when the user has no block_id (blocked with Decidim 0.27.3)" do
    before { user.update_columns(block_id: nil) }

    it "falls back to the latest user block" do
      expect(subject[:block_reasons]).to eq("Spam account")
      expect(subject[:blocking_user]).to eq(admin.presenter.name)
    end
  end

  context "when the user has no user block at all" do
    before do
      user.update_columns(block_id: nil)
      user_block.delete
    end

    it "exports empty block fields instead of raising" do
      expect(subject[:block_reasons]).to be_nil
      expect(subject[:blocking_user]).to be_nil
      expect(subject[:user_id]).to eq(user.id)
    end
  end
end
