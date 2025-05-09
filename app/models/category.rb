class Category < ApplicationRecord
    belongs_to :user
    has_many :to_dos, dependent: :destroy	# if a user is deleted, also delete their todos
	validates :name, length: {maximum: 140}, presence: true


	def details
		if self.user.nil?
			"Created on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
		else
			"By #{self.user.name} on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
		end
	end
end
