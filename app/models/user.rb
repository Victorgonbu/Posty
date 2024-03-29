class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments, as: :commentable
  has_many :events 
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: {case_sensitive: true}
  validates :name, length: {minimum: 5, max: 20}
  validates :password, length: {minimum: 6}


  def likes?(post)
    post.likes.where(user_id: id).any?
  end

  def avatar_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end
  
  def username
    "@#{name.gsub(/\s/, '')}"
  end
end
