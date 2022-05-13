class CreatePassangerDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :passanger_details do |t|

      t.timestamps
    end
  end
end
