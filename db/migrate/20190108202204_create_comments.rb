class CreateComments < ActiveRecord::Migration[5.2]
	def change
		create_table :comments do |t|
			t.references :user
			t.references :article
			t.text :content, null: false
			t.timestamps
		end
		add_index :comments, ["user_id", "article_id"] 
	end
end
