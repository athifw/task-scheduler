class AddNullConstraintsToRoomFields < ActiveRecord::Migration
  def change
    change_column_null :rooms, :name, false
  end
end
