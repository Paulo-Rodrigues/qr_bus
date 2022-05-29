require 'rails_helper'

feature 'About Page' do
  it 'returns status code 200' do
    visit about_path

    expect(page.status_code).to eq(200)
  end

  it 'returns content' do
    visit about_path

    expect(page).to have_content('Sobre')
  end
end
