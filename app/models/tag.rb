class Tag < ApplicationRecord
  belongs_to :article
  belongs_to :user
  belongs_to :note
  belongs_to :project

  def formatted_title
    "#{title} - #{user.email}"
  end

  def formatted_title
    "#{title} - #{user.email}"
  end

end
