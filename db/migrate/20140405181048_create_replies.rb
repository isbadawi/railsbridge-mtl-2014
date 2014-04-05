class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :post, null: false
      t.belongs_to :user, null: false
      t.text :content, null: false, default: ""
      t.timestamps
    end
  end
end
