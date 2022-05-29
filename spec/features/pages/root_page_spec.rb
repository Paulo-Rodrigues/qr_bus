require 'rails_helper'

feature 'Root' do
  it 'returns status code 200' do
    visit root_path

    expect(page.status_code).to eq(200)
  end

  context 'when have bus_lines' do
    it 'successfully render the list' do
      bus_line = create(:bus_line)

      visit root_path

      expect(page).to have_content(bus_line.from)
      expect(page).to have_content(bus_line.to)
    end
  end

  context 'when does not have any bus line' do
    it 'successfully render the empty page template' do
      visit root_path

      expect(page).to have_content(/Ainda não possuimos/)
    end
  end
end
