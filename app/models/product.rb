class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: {unique: true, message: "Bhai title pehle se h chori h"}, length: {minimum: 10, message: '%{value} Bhai check kar rha bura na manna'}
	# validates :title, length: {minimum: 10, message: '%{value} Bhai check kar rha bura na manna'}
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	def self.latest
		Product.order(:updated_at).last
	end
end
