class Submission < ActiveRecord
  has_attached_file :csv_file, default_url: "test/fixtures/example_input.csv"
  # validates_attachment_content_type :csv_file, content_type: /\Atext\/csv\z/
end