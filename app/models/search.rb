class Search < ApplicationRecord
  def search_boards
  # hsasdf
  boards = Board.all
  # А если добавлены условия то magic is here
    boards = boards.where(["title LIKE ?", "%#{keywords}%"]) if keywords.present?
    boards = boards.where(["body LIKE ?", "%#{keywords}%"]) if keywords.present?
    #boards = boards.where(["body LIKE ?", body]) if body.present?
    boards = boards.where(["author LIKE ?", author]) if author.present?
      return boards
  end
end
