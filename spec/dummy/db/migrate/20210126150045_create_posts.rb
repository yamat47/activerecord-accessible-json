class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.json :author, null: false
      t.json :tags, null: false

      t.timestamps
    end
  end
end
