class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards.json
  def index
    @boards = Board.all 

    #@boards = Board.search(params[:search])
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new

    #Свяжем авторизованного юзера и новое объявление
    #@users = User.all
    @user_options = User.all.map{|u| [ u.name, u.id ] }

  end

  # GET /boards/1/edit
  def edit
  end


  # POST /boards.json

  def create

    @board = Board.new(board_params)

    @board.user = current_user

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Ваше объявление успешно добавлено на сайт!' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  #/boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Ваше объявление было успешно отредактировано' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    #All params
    def board_params
      params.require(:board).permit(:title, :body, :picture, :all_tags)
    end
end
