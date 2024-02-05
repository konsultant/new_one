class Project < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :responses
  has_many :tags
  belongs_to :confirmed_response, class_name: "Response", foreign_key: "response_id", optional: true
  #Перечень статусов при которых не выводится форма отклика
  Statuses_for_not_response = %i[performer_selected performing approval completed archive]
  #Статусы исполнителя: 
  ## performer_selected - выбран исполнитель, performing - выполняется, approval - на проверке у заказчика 
  scope :executors_statuses, -> { where(project_status: %i[performer_selected performing approval]) }
  
  scope :performer_selected, -> { where(project_status: %i[ performer_selected]) }

  scope :approval, -> { where(project_status: %i[ approval]) }
  scope :complete, -> { where(project_status: %i[ completed]) }

  def check_status
    !Statuses_for_not_response.include?(project_status.to_sym)
  end

  def to_s
    "#{short_title}"
  end

  aasm column: :project_status do
    state :draft, initial: true
    state :published, :choosing_performer, :performer_selected, :performing, :approval, :completed, :archive

    event :publish do
      transitions from: :draft, to: :published
    end

    event :withdraw_from_publication do
      transitions from: [:published, :choosing_performer], to: :draft
    end

    event :get_respond do
      transitions from: :published, to: :choosing_performer
    end

    event :select do
      transitions from: :choosing_performer, to: :performer_selected
    end

    event :execute do
      transitions from: [:performer_selected, :approval], to: :performing
    end

    event :complete do
      transitions from: [:performing, :approval], to: :completed
    end

    event :submit_for_inspection do
      transitions from: :performing, to: :approval
    end

  end
end
