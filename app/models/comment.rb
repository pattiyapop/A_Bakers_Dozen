#=header
class Comment < ActiveRecord::Base

  #relationships
  belongs_to :user
  belongs_to :recipe

  #validations
  validates :content, presence: true, length: { maximum: 300 }
  validates :rating, presence: true, :numericality => {:greater_than => 0, :less_than => 5}
  validates :user_id, presence: true
  validates :recipe_id, presence: true

  #orders it by creation date with newest first
  default_scope -> { order('created_at DESC') }

  #class methods
  def Comment.all_ratings
    all_ratings = {"Icky" => 1, "All right" => 2, "Good" => 3, "Delicious!" => 4}
  end

end
