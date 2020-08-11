class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :email, uniqueness: { case_sensitive: true }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_phonetic, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_phonetic, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
