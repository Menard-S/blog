class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy

    validates :title, presence: true,
                      uniqueness: true
    validates :body, presence: true,
                     length: { minimum: 5}

    VALID_STATUSES = ['public', 'private', 'archived']

    validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
