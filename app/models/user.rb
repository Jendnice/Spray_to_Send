class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :climbs, through: :reviews

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :username, presence: true 

end


# devise :database_authenticatable, :registerable,
# :recoverable, :rememberable, :trackable, :validatable, :omniauthabl