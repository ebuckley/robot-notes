class CreateArticleTags < ActiveRecord::Migration[6.0]
  def change

    # for hasmanythrough between article and tags
    create_table :article_tags do |t|
      t.belongs_to :tags, foreign_key: true
      t.belongs_to :articles, foreign_key: true
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
  end
end
