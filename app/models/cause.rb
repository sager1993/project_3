class Cause < ApplicationRecord
  belongs_to :user
  has_many :supports, dependent: :destroy
end
