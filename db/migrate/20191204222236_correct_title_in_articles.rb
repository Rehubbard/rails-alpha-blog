class CorrectTitleInArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :titles, :title
  end
end
