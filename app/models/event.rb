class Event < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_and_belongs_to_many :choices
end
