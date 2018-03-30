class Post < ApplicationRecord

	has_many :comments
	belongs_to :user

	validates_presence_of :user_id, :title

	default_scope {order("created_at DESC")}
	
end