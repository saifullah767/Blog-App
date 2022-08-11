class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :Author, null: false, foreign_key: { to_table: :users }
      t.references :Post, null: false, foreign_key: { to_table: :posts }
      t.text :Text

      t.timestamps
    end
  end
end
