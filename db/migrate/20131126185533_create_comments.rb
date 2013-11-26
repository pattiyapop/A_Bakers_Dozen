class CreateComments < ActiveRecord::Migration
  def change
    #drop_table :comments, then rake db:migrate 
    create_table :comments do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
