json.extract! task, :id, :title, :description, :created_at, :updated_at
json.url todo_list_url(task, format: :json)
