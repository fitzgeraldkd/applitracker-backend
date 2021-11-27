class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.string :status
      t.boolean :favorite
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
