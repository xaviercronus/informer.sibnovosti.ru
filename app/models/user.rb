class User
  include Mongoid::Document
  
  ROLES = [:admin, :manage]
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  field :name, :type => String
  field :role, :type => Symbol
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  attr_accessible :name,
                  :role,
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me
                  
  ROLES.each do |role|
    define_method "is_#{role}?" do
      self.role == role
    end
  end
end
