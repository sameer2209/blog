class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
    	t.references :user
    	t.references :article
      t.timestamps
    end

    add_index :likes, [:user_id, :article_id], unique: true
  end
end
