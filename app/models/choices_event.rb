class ChoicesEvent < ApplicationRecord
  belongs_to :choice
  belongs_to :event
end
