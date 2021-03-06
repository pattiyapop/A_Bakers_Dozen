class User < ActiveRecord::Base
#    attr_accessor :username, :name, :password

#    def initialize(attributes = {})
#      @username = attributes[:username]
#      @name = attributes[:name]
#      @password = attributes[:password]
#    end

#def initialize(user)
#  @picture = "/assets/defaultprofile.png"
#end

#def image
#  @user = User.find()
#  if @user.picture.empty?
#    "/assets/defaultprofile.png"
#  else
#    @user.picture
#  end
#end

#relationships:
  #destroys comments if user is destroyed:
  has_many :comments, dependent: :destroy 
  has_many :recipes
#followers:
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship", #not its own class
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

#6.3.2: password and password_confirmation attributes: these virtual attributes are implemented automatically by has_secure_password.
  has_secure_password

#required validations:
  validates :username, presence: true, length: { maximum: 25 },     		uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 4 }
  #picture and interests are not required to sign up.
  #picture does need to be of the form *.png, jpg, etc. though.
  #VALID_PIC_REGEX = /\A[\w+\-.]+\.[jpg, jpeg, png]\z/i
  #validates :picture, format: {with: VALID_PIC_REGEX}

#ensure username uniqueness by downcasing:
  before_save { self.username = username.downcase }

#to remeber a log-in:
  before_create :create_remember_token

#remember log-in class methods:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

#section 11: following others
  def following?(other_user)
    #relationships.find_by(followed_id: other_user.id) #in ruby 4.0
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
    #***used to be 'destroy!'
  end

  def feed
    Recipe.from_users_followed_by(self)
  end
  ############################################################
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end

#    t.string   "username"
#    t.string   "name"
#    t.string   "picture"
#    t.text     "interests"
#    t.datetime "created_at"
#    t.datetime "updated_at"
