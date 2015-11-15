class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # consider adding validations in the future.
end
