class RemoveColumnLanguage < ActiveRecord::Migration[7.0]
  def change
    remove_column :words, :language
  end
end
