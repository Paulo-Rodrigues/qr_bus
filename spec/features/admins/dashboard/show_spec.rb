require 'rails_helper'

feature 'Admin Dashboard' do
  context 'unauthenticated admin' do
    it 'returns sign in form' do
      visit "/admins/dashboard"

      expect(page).to have_current_path('/admins/sign_in')
    end
  end

  context 'authenticated admin' do
    let(:admin) { create(:admin) }

    before do
      login_as(admin)
    end

    it 'returns status code 200' do
      visit "/admins/dashboard"

      expect(page.status_code).to eq(200)
      expect(page).to have_content('Dashboard')
    end
  end
end
