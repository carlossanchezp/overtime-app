class Post < ApplicationRecord
  # Associations
  belongs_to :user
  # VALIDATIONS
  validates_presence_of :date, :rationale

end
