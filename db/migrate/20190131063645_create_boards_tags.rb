class CreateBoardsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :boards_tags, id: false do |t|
      t.integer :board_id
      t.integer :tag_id
    end
  end
end
