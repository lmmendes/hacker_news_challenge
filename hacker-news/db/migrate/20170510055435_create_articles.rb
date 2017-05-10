class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :link
      t.string :author
      t.integer :points
      t.string :comments

      t.timestamps
    end
  end
end
