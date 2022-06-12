require 'rails_helper'

feature 'Bus Lines', type: :feature do
  context 'List all bus lines' do
    it 'count lines' do
      bus_lines = create_list(:bus_line, 3)

      expect(BusLine.count).to eq(3)
    end

    it 'show lines' do
      bus_lines = create_list(:bus_line, 2)

      visit bus_lines_path

      expect(page).to have_content(bus_lines.first.from)
      expect(page).to have_content(bus_lines.first.to)
      expect(page).to have_content(bus_lines.last.from)
      expect(page).to have_content(bus_lines.last.to)
    end
  end

  context 'Show a particular bus line' do
    it '#name' do
      bus_line = create(:bus_line)

      visit bus_line_path(bus_line)

      expect(page).to have_content(bus_line.name)
    end

    it '#from' do
      bus_line = create(:bus_line)

      visit bus_line_path(bus_line)

      expect(page).to have_content(bus_line.from)
    end

    it '#to' do
      bus_line = create(:bus_line)

      visit bus_line_path(bus_line)

      expect(page).to have_content(bus_line.to)
    end
  end
end
