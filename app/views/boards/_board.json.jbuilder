#Явно вернем null (хз)
json.extract! board, :id, :title, :body, :picture, :created_at, :updated_at, :author
json.url board_url(board, format: :json)
