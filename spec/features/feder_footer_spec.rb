# frozen_string_literal: true

require "rails_helper"

describe "Footer", type: :system do
  let(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
  end

  scenario "display feder logo on footer on homepage" do
    visit '/'
    expect(page).to have_content "Fons Europeu de Desenvolupament Regional"
  end

  scenario "display feder logo on footer on user registration page" do
    visit '/users/sign_up'
    expect(page).to have_content "Fons Europeu de Desenvolupament Regional"
  end
end
