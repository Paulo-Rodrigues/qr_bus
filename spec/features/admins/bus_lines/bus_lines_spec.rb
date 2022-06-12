require 'rails_helper'

feature 'Admin::BusLine' do
  context 'unauthenticated admin' do
  end

  context 'authenticated admin' do
    let(:admin) { create(:admin) }

    before do
      login_as(admin)
    end

    context 'create a bus line' do
      it 'successfully' do
        visit "/admins/dashboard"

        click_link 'Nova Linha'

        fill_in 'Nome da linha:', with: 'Linha 1'
        fill_in 'De:', with: 'Bairro X'
        fill_in 'Para:', with: 'Bairro Y'

        click_button 'Enviar'

        expect(page).to have_content('Linha 1')
        expect(page).to have_content('Bairro X')
        expect(page).to have_content('Bairro Y')
      end
    end

    context 'list bus lines' do
      let(:line) { create(:bus_line) }
      let(:other_line) { create(:bus_line, from: 'Bairro Z', to: 'Bairro W') }

      it 'with 2 lines' do
        visit 'admins/dashboard'

        click_link 'Linhas Atuais'

        expect(page.current_path).to match('admins/bus_lines')
      end
    end

    context 'show a particular bus line' do
      let(:line) { create(:bus_line) }

      it 'success' do
        visit "admins/bus_lines/#{line.id}"


        expect(page).to have_content(line.from)
      end
    end

    context 'edit a particular bus line' do
      let(:line) { create(:bus_line) }

      it 'successfully' do
        visit "admins/bus_lines/#{line.id}"

        click_link 'Editar Linha'

        fill_in 'Nome da linha:', with: 'Linha 1 Edited'

        click_button 'Enviar'

        expect(page).to have_content('Linha 1 Edited')
      end

    end

    context 'delete a particular bus line' do
      let(:line) { create(:bus_line) }

      it 'successfully' do
        visit "admins/bus_lines/#{line.id}"

        expect(BusLine.count).to eq(1)

        click_link 'Delete essa Linha'

        expect(BusLine.count).to eq(0)
      end
    end
  end
end
