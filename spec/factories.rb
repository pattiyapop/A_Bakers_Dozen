#FactoryGirl.define do
#  factory :user do |f|
#    f.name      { |n| "name#{n}" }
#    f.username     { |n| "username#{n}" }
#    f.interests "food"
#    f.password "foobar"
#    f.password_confirmation "foobar"
#  end
#end

#use the code below, or else factory girl won't create unique usernames as it should
FactoryGirl.define do
  factory :user do |f|
  f.sequence(:name) { |n| "test#{n}" }
  f.sequence(:username) { |n| "test#{n}" }
  f.sequence(:interests) { |n| "food" }
  f.sequence(:password) { |n| "test123" }
  f.sequence(:password_confirmation) { |n| "test123" }

  factory :chef do
    chef true
  end
 end
end
