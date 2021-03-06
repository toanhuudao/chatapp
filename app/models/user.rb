class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username

  def self.generate
    adjectives = ['Dao', 'Nguyen', 'Van', 'Tran', 'Hai', 'Vu']
    nouns = ['Toan', 'Hai', 'Tung', 'Minh', 'Lam']
    number = rand.to_s[2..4]
    username="#{adjectives.sample}-#{nouns.sample}-#{number}"
    create(username: username)
  end
end
