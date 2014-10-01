require 'rails_helper'

describe 'restaurant reviews' do 

	context 'add a review' do 
		before do 
			Restaurant.create(name: "Wasabi", description: "Sushi and Asian food")
		end

		it 'a user should be able to review a restaurant' do
			visit '/restaurants' 
			click_link 'Add a review for Wasabi'
			# save_and_open_page
			fill_in "review_thoughts", with: "The sushi is great but the tofu is awful"
			select "4", :from => "review_rating"
			click_button "Submit review"
			expect(current_path).to eq '/restaurants'
			within('.show_review') do 
				expect(page).to have_content "The sushi is great but the tofu is awful"
				expect(page).to have_content "4"
			end
		end
	end
end


