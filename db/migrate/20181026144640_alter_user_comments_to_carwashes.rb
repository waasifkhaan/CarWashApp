class AlterUserCommentsToCarwashes < ActiveRecord::Migration[5.2]
  def change
    rename_column :carwashes, :user_comments, :user_comment
  end
end
