#=Recipe:
#* name
#* description
#* picture
#* ingredients
#* instructions

class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy #if recipe is deleted, then the comments are deleted
  validates :name, presence: true, length: { maximum: 50 }

   def self.search(search_query)
     find(:all, :conditions => ['name LIKE ?', "%#{search_query}%"])
   end
end
