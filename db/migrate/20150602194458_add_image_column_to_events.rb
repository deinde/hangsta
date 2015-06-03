class AddImageColumnToEvents < ActiveRecord::Migration
   def up
    add_attachment :events, :image
  end

  def down
    remove_attachment :events, :image
  end
end
