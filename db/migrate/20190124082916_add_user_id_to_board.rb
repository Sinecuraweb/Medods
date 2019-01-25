class AddUserIdToBoard < ActiveRecord::Migration[5.2]
  def change
  	add_column :boards, :user_id, :integer, index:true
  end
end
