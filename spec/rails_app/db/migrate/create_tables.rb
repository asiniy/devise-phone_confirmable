class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email, null: true, default: ''
      t.string :encrypted_password, null: true, default: true

      ## PhoneConfirmable
      add_column :users, :phone_confirmation_token, :string
      add_column :users, :phone_confirmed_at, :datetime
      add_column :users, :phone_confirmation_sent_at, :datetime
    end
  end
end
