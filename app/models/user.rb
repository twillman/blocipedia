class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: %w(standard premium admin)}

  has_many :wikis

  after_initialize do
    self.role ||= "standard"
  end

  def self.not_collab_users(wiki)
    self.all-wiki.users
  end
end
