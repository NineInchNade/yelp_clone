require 'rails_helper'

describe 'restaurants' do 
	context 'no restaurants have been added' do 
		it 'should display a promt to add a restaurant' do
			visit '/restaurants' 
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before do
			Restaurant.create(name: "KFC")		
		end

		it 'should display them' do
			visit '/restaurants' 
			expect(page).to have_content('KFC')
			expect(page).not_to have_content('No restaurants yet')
		end
	end
end

