class CreateContactAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_addresses do |t|
      t.string :city
      t.string :state
      t.integer :contact_id
      t.timestamps
    end
  end
end
