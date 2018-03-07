class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :checklists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]


  has_attached_file :avatar, styles: { avatar_index: "300x300>", avatar_show: "100x100>" }, default_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNEiZh1o_vDGs9LM2tfzlRVk3EXnh-yjeJPHfG2g0p7LATl89w"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
