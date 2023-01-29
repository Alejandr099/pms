class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :properties
  has_many :reservations, through: :properties
  has_one_attached :avatar
  has_one_attached :cover_image



  def avatar_thumbnail
    if avatar.attached?
      self.avatar.variant(resize: "100x100!").processed
    else
      avatar.attached("default-profile.jpg")
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
