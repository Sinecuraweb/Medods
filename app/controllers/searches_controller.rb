class SearchesController < ApplicationController

	def new
		@search = Search.new

		#Выбираем объвление в определенном теге, но без дублирования
		@tags = Board.pluck(:tag).uniq
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
		
	end

	def show
		@search = Search.find(params[:id])
	end

	#Доступ к параметрам по которым идет поиск
	private
	def search_params
		params.require(:search).permit(:keywords, :autor, :title, :tag)
		
	end

end
