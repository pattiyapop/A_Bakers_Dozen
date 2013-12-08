#=header
class Recipe < ActiveRecord::Base
#==sub-header
#* list item #1
#* list item #2
  belongs_to :user
  has_many :comments
   #def initialize
   #  @name = 'N/A'
   #  @pic = 'N/A'
   #  @description = 'None'
   #  @rating = 0
   #  @ingredients = ['']
   #end
    
   def self.search(search_query)
     find(:all, :conditions => ['name LIKE ?', "%#{search_query}%"])
   end
end
