class AddGender < ActiveRecord::Migration[7.0]
  def change
    add_column :genders ,:gender, :string
  end
end
