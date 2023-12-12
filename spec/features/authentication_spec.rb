# frozen_string_literal: true

require 'rails_helper'

describe 'Authentication', type: :system do
  let(:organization) { create(:organization) }

  before do
    switch_to_host(organization.host)
    visit decidim.root_path
  end

  describe 'Sign Up' do
    context 'when using email and password' do
      it 'ask confirmations on new Users' do
        find('a[href="/users/sign_up"').click

        within '.new_user' do
          fill_in :registration_user_email, with: 'user@example.org'
          fill_in :registration_user_name, with: 'Responsible Citizen'
          fill_in :registration_user_password, with: 'DfyvHn425mYAy2HL'
          check :registration_user_tos_agreement
          check :registration_user_newsletter
          find('*[type=submit]').click
        end

        expect(page).to have_content('confirmation link')
      end
    end
  end
end
