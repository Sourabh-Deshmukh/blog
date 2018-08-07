class User < ApplicationRecord
  rolify
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
  #resourcify
  #belongs_to :role, polymorphic: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_one :user_address, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :posts, through: :blog, dependent: :destroy
  
  accepts_nested_attributes_for :user_address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  after_create :assign_default_role

 def assign_default_role
   add_role(:user) if self.roles.blank?
 end

 def to_s
   email
end
end
