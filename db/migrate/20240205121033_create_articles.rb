class CreateArticles < ActiveRecord::Migration[7.1]
  def up
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end