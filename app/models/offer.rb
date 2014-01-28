class Offer < ActiveRecord::Base
	belongs_to :user
	validates :content, presence: true, length: { maximum: 70 }
	validates :user_id, presence: true
end
