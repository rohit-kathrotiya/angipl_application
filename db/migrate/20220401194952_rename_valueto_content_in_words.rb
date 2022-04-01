class RenameValuetoContentInWords < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :value, :content
  end
end
