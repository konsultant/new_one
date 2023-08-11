class Project < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :responses

  aasm column: :project_status do
    state :draft, initial: true
    state :published, :reviews, :performer_selected, :performing, :completed, :archive

    event :publish do
      transitions from: :draft, to: :published
    end

    event :withdraw_from_publication do
      transitions from: [:published, :chosing_performer], to: :draft
    end

    event :get_respond do
      transitions from: :published, to: :chosing_performer
    end

    event :select do
      transitions from: :chosing_performer, to: :performer_selected
    end

    event :execute do
      transitions from: :performer_selected, to: :performing
    end

    event :complete do
      transitions from: :performing, to: :comleted
    end


  end
end
