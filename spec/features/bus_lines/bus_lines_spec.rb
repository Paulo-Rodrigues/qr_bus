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

  context 'Create a Bus Line' do
    context 'successfully' do
      it 'created' do
        visit bus_lines_path
        click_link 'Criar nova rota'

        fill_in 'Nome da linha:', with: 'Linha 1'
        fill_in 'De:', with: 'Bairro X'
        fill_in 'Para:', with: 'Bairro Y'

        click_button 'Enviar'

        expect(page).to have_content('Linha 1')
        expect(page).to have_content('Bairro X')
        expect(page).to have_content('Bairro Y')
      end
    end

    xcontext 'fail' do
    end
  end

  context 'Edit a Bus Line' do
    context 'successfully' do
      it 'and redirect to show page' do
        bus_line = create(:bus_line)

        visit bus_line_path(bus_line)

        click_link 'Editar essa rota'


        fill_in 'De:', with: 'Bairro Z'
        fill_in 'Para:', with: 'Bairro W'

        click_button 'Enviar'

        expect(page).not_to have_content('Bairro X')
        expect(page).not_to have_content('Bairro Y')
        expect(page).to have_content('Bairro Z')
        expect(page).to have_content('Bairro W')
      end
    end

    xcontext 'fail' do
    end
  end

  context 'Delete a Bus line' do
    context 'successfully' do
      it 'and redirect to list' do
        bus_line = create(:bus_line)

        visit bus_line_path(bus_line)

        click_link 'Delete essa rota'

        expect(page).to have_content('Rota deletada com sucesso!')
      end
    end

    xcontext 'fail' do
    end
  end
end
