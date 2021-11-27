class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.string :status
      t.belongs_to :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
