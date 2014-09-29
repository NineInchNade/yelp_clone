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

describe 'creating restaurants' do

	it 'promts users to fill out a form, then displays the new restaurant' do
		visit '/restaurants'
		click_link 'Add a restaurant'
		fill_in 'Name', with: "KFC"
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
	end
end 

# describe 'editing restaurants' do

# 	it 'can allow a user to edit a restaurant'

# 	end
# end