#=header
class Comment < ActiveRecord::Base
#==sub-header
#1 list item #1
#2 list item #2
   def initialize
     @owner = 'N/A'
     @comment = 'None' 
     @date = '2013-11-23'
     @rating = 0
   end
end
