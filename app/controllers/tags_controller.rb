class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @boards = @tag.boards
  end
end