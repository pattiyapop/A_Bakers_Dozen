class User < ActiveRecord::Base
  has_many :recipes
   def initialize
     @name = 'N/A'
     @username = 'N/A'
     @pic = 'N/A'
     #@password = 'badpassword'
     @interests = 'None'
     @ingredients = ['']
     #@isachef? = false
   end
end
