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


	context  'creating restaurants' do

		context 'a valid restaurant' do

		it 'promts users to fill out a form, then displays the new restaurant' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: "KFC"
			click_button 'Create Restaurant'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq '/restaurants'
			end
		end 

		context 'an invalid restuarant' do 
			it 'does not let you submit a name that is too short' do
				visit '/restaurants'
				click_link 'Add a restaurant'
				fill_in 'Name', with: "KF"
				click_button 'Create Restaurant'
				expect(page).not_to have_css 'h2', text: "KF"
				expect(page).to have_content 'error'
			end
		end
	end

	def create_restaurant(name, description="") 
		visit '/restaurants'
		click_link "Add a restaurant"
		fill_in 'Name', with: name 
		fill_in 'Description', with: description
		click_button 'Create Restaurant'
	end  

	context 'editing restaurants' do
		before do
			create_restaurant("KFC")		
		end

		it 'can allow a user to edit a restaurant' do
		visit '/restaurants'
			click_link 'Edit KFC'
			fill_in 'Name', with: "Kentucky fried chicken"
			fill_in 'Description', with: "This stuff actually prevents people from gettting testicular cancer"
			click_button 'Update Restaurant'
			expect(page).to have_content 'Kentucky fried chicken'
			expect(current_path).to eq '/restaurants'
		end
	end

	context 'deleting restaurants' do
		before do
			create_restaurant("KFC")		
		end

		it 'removes a restuarant when a user clicks a delete Link' do
			visit '/restaurants'
			click_link "Delete KFC"
			expect(page).not_to have_content "KFC"
			expect(page).to have_content 'Restaurant deleted successfully'
		end
	end

	context 'restaurant description' do
		before do 
			create_restaurant("KFC", "KFC prevents people from getting testicular cancer")
		end

		it 'shou have a description link that leads to a different side with the description of the restaurant' do
			visit '/restaurants'
			click_link "KFC Description"
			expect(page).to have_content "KFC prevents people from getting testicular cancer"
		end
	end

	context ''
end 