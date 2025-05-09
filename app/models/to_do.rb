class ToDo < ApplicationRecord
    
    belongs_to :user
    belongs_to :category
	validates :title, length: {maximum: 140}, presence: true


	def details
		if self.user.nil?
			"Created on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
		else
			"By #{self.user.name} on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
		end
	end
end
