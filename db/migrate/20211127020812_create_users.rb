class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :login_token
      t.datetime :login_time

      t.timestamps
    end
  end
end
