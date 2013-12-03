class User < ActiveRecord::Base
#relationships:
  has_many :comments
  has_many :recipes
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
