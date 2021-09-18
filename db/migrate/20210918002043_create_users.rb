class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.date :birthdate
      t.string :password_digest
      t.string :type

      t.timestamps
    end
  end
end
