# Рендерим @board
# @boards= 
json.array! @boards, partial: 'boards/board', as: :board
