class User
  include Mongoid::Document
  
  ROLES = [:admin, :manager]
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable,
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
                  
  def roles
    User::ROLES.map { |role| [role, role] }
  end
  
  ROLES.each do |role|
    define_method "is_#{role}?" do
      self.role == role
    end
  end
end
