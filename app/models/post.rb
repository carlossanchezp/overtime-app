class Post < ApplicationRecord

  # VALIDATIONS
  validates_presence_of :date, :rationale

end
