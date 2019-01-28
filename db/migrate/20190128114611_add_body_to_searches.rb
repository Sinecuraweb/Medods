class AddBodyToSearches < ActiveRecord::Migration[5.2]
  def change
  	add_column :searches, :body, :text
  end
end
