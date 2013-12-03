#=header
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  validates :content, length: { maximum: 300 }
  validates :user_id, presence: true
  #orders it by creation date with newest first
  default_scope -> { order('created_at DESC') }

#==sub-header
#1 list item #1
#2 list item #2
end
