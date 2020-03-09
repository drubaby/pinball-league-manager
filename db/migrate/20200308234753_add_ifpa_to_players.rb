class AddIfpaToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :ifpa_id, :int
  end
end
