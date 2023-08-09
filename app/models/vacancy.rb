class Vacancy < ApplicationRecord
  belongs_to :user, optional: true
  validates :short_name, :body, presence: true
end
