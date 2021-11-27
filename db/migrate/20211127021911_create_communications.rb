class CreateCommunications < ActiveRecord::Migration[6.1]
  def change
    create_table :communications do |t|
      t.string :heading
      t.text :description
      t.datetime :time
      t.boolean :received
      t.belongs_to :job, null: false, foreign_key: true
      t.string :contact

      t.timestamps
    end
  end
end
