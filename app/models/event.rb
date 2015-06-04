class Event < ActiveRecord::Base
	belongs_to :user

	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
		# Event has passive_relationships because it doesn't have to follow back users
	has_many :followers, through: :passive_relationships, source: :follower

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.celebrate121212.org/wp/wp-content/uploads/2012/12/3._Silhouette-of-Kids-wit-670x380.jpg"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	scope :newest_first, -> { order("events.created_at DESC")}

end
