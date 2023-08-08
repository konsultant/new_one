class Vacancy < ApplicationRecord
  belongs_to :user, optional: true 
end
