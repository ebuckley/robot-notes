class CreateArticleTags < ActiveRecord::Migration[6.0]
  def change

    # for hasmanythrough between article and tags
    create_table :tags do |t|
      t.string :name, uniqueness: true
      t.timestamps
    end

    create_table   :articles_tags do |t|
      t.belongs_to :tag
      t.belongs_to :article
      t.index [:tag_id, :article_id]
      t.timestamps
    end
  end
end
