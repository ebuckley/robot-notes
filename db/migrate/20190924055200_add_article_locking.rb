class AddArticleLocking < ActiveRecord::Migration[6.0]
  def change
    # Support lock_version to enable optimistic locking
    add_column :articles, :lock_version, :integer
    # add ownerId so we can save the article owner
    add_column :articles, :owner_id, :string
  end
end
