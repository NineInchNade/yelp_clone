class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy  
	validates :name, length: {minimum: 3, message: "Your di.. ehrm name is too short"}, uniqueness: true

	def average_rating
		return "N/A" if reviews.none?
		reviews.average(:rating) 
		# reviews.inject(0) {|memo, review|memo + review.rating} / reviews.count
	end

end
