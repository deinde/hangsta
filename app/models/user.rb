class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :events


    ######creating relationship for user and events######
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  	#we have to tell rails the model class name to look for and users following an event is identified by follower_id. dependent 
  	# and destroy is to ensure the relationship is broken when the event is deleted.
  has_many :following, through: :active_relationships, source: :followed
  	#instead of using followeds, we use following and use the source parameter to explicitly tell the rails that 
  	#the source of the following array is the set of followed ids


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #####creating chat functionality between users ##########
  has_many :conversations, foreign_key: "sender_id"

  scope :newest_first, -> { order("users.created_at DESC")}

  def follow(event)
  	active_relationships.create(followed_id: event.id)
  end

  def unfollow(event)
  	active_relationships.find_by(followed_id: event.id).destroy
  end

  # returns true if the current usesr is following an event
  def following?(event)
  	following.include?(event)
  end
end
