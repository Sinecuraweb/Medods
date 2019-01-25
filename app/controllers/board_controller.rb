class BoardController < ApplicationController
	# index вызывает шаблон в views/board
	def index 
		@board = Post.all #все объявления
	end

	def new
		

		@board = Board.new

	end

	def show
		@board= Board.find(params[:id])
	end

	def edit
		@board= Board.find(params[:id])
	end


	def create
		#render plain: params[:post].inspect  создание постов в базу данных
		

		@board = Post.new(post_params)

		if(@board.save)  	  #Сохраняем в базе объявление
			redirect_to @board #Редиректим после добавления
		else 
			render 'new'
		end

 	end

	private def post_params
		params.requeire(:post).permit(:title , :body)
	end
end
