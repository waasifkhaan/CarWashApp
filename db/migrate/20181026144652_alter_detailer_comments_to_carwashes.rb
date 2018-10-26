class AlterDetailerCommentsToCarwashes < ActiveRecord::Migration[5.2]
  def change
    rename_column :carwashes, :detailer_comments, :detailer_comment
  end
end
