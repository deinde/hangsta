class AddBioColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :bio, :string
  end
end
