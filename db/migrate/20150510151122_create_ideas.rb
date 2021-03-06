class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :box, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
