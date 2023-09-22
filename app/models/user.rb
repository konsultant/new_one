class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vacancies
  has_many :responses
  has_many :notes
  has_many :projects

  scope :executors, -> { where(character: :executor) }

  enum character: {
    customer: 'customer',
    executor: 'executor'
  }

end
