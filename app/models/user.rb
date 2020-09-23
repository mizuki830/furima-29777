class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, inclusion: {in: %w(@)}
    validates :encrypted_password, format: { with: /\A[a-z\d]{6}+\z/i}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/}
    validates :birthday
  end
end
