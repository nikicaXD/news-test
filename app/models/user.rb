class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # devise :database_authenticatable, :registerable,
    #       :recoverable, :rememberable, :validatable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
    
    has_one_attached :avatar

    has_many :articles
    has_many :posts

    acts_as_followable
    acts_as_follower

    # has_many :playlist
    
    # has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    # has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    # has_many :followed_users, through: :active_relationships, source: :followed_user
    # has_many :follower_users, through: :passive_relationships, source: :follower_user
    # has_and_belongs_to_many :playlists

    # devise :omniauthable, omniauth_providers: %i[facebook]

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.name = auth.info.name   # assuming the user model has a name
        #   user.avatar = auth.info.image # assuming the user model has an image
          # If you are using confirmable and the provider(s) you use validate emails, 
          # uncomment the line below to skip the confirmation emails.
          # user.skip_confirmation!
        end
    end

    def self.new_with_session(params, session)
        super.tap do |user|
          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
    end

    def self.search(query)
        if query
            where(["LOWER(name) LIKE LOWER(?)", "%#{query}%"])
        else
            all
        end
    end
end
