class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :buses,:city_id, :integer
    
  end
end
