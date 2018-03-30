class Comment < ApplicationRecord

	belongs_to :user

	validates_presence_of :user_id, :comment

 	has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

	default_scope {order("created_at DESC")}

end