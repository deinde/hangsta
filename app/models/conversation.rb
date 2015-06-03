class Conversation < ActiveRecord::Base
	
	#conversations will belong to both a sender and a recipient all of which are instances of a user.

	belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
	belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

	has_many :messages, dependent: :destroy

	validates_uniqueness_of :sender_id, :scope => :recipient_id  #this ensures that the sender_id and recipient_id are always unique so that this app only have unique conversations 

	#the following scope helps to retrieve all conversations of the currently logged-in user
	scope :involving, -> (user) {where("conversations.sender_id = ? OR conversations.recipient_id =?)",user.id,user.id)}
	
	#the following scope checks if a conversation exists between any given two users before the conversation is created
	scope :between, -> (sender_id,recipient_id) {where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)}
end
