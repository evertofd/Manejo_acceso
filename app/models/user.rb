class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

after_initialize :set_default_role, :if => :new_record?

def set_default_role
  self.role ||= :visit
end

  enum role: [:admin, :visit]
end
