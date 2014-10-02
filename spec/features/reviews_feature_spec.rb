require 'rails_helper'

describe 'restaurant reviews' do 

		before do 
			Restaurant.create(name: "Wasabi", description: "Sushi and Asian food")
		end

		def leave_review(thoughts, rating)
			visit '/restaurants' 
			click_link 'Add a review for Wasabi'
			fill_in "review_thoughts", with: thoughts
			select rating, :from => "review_rating"
			click_button "Submit review"
		end

		it 'a user should be able to add a review for a restaurant' do
			leave_review('The sushi is great but the tofu is awful', "4")
			expect(current_path).to eq '/restaurants'
			within('.show_review') do 
				expect(page).to have_content "The sushi is great but the tofu is awful"
				expect(page).to have_content "4"
			end
		end

		

		it 'displays an average rating for all reviews' do 
			leave_review('soso', '2')
			leave_review('really soso', "4")
			expect(page).to have_content("Average: 3")
		end
	end


