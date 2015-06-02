class Event < ActiveRecord::Base
	belongs_to :user
	scope :newest_first, -> { order("users.created_at DESC")}
end
