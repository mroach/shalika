class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :author
      t.string :title
      t.string :content
      t.boolean :published
      t.datetime :published_at
      t.string :slug

      t.timestamps
    end

    add_index :articles, :slug, unique: true
    add_index :articles, :published_at
    add_index :articles, :author
  end
end
