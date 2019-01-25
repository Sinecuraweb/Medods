class Search < ApplicationRecord

	def search_boards

		#Если в поиске пусто выводим все
		boards = Board.all

		# А если добавлены условия то magic is here
		boards = boards.where(["title LIKE ?", "%#{keywords}%"]) if keywords.present?
		boards = boards.where(["tag LIKE ?",tag]) if tag.present?
		boards = boards.where(["author LIKE ?", autor]) if author.present?


		return boards
	end

end
