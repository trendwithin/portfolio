class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter_name
      t.string :commenter_url
      t.string :commenter_email
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.text :content
      t.boolean :approved
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :articles
  end
end
