class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :todo_list
end
