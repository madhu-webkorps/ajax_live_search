class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :district
      t.string :state
      t.string :pin_code
      t.string :house_no
      t.references :user
      t.timestamps
    end
  end
end
