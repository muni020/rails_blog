class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}

  VALID_STATUSES = [ "public", "private", "archived" ]

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == "archived"
  end

  def get_statuses
[ "public", "private", "archived" ]
  end
end
