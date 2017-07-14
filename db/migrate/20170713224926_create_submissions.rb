class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.attachment :csv_file
    end
  end
end
