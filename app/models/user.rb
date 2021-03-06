class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

 has_many :posts, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :votes, dependent: :destroy


 mount_uploader :avatar, AvatarUploader

   def favorited(post)
     favorites.where(post_id: post.id).first
   end
  
  def voted(post)
       votes.where(post_id: post.id).first
  end   

  def admin?
  	role == 'admin'
  end

  def moderator?
  	role == 'moderator'
  end

end