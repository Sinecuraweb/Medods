class AddPictureToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :picture, :string
  end
end
