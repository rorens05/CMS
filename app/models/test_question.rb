class TestQuestion < ApplicationRecord
  require 'roo'

  belongs_to :test
  has_many :test_answers, dependent: :destroy


  def self.import(file, id)
    spreadsheet = open_spreadsheet(file)
    if spreadsheet == 0
      "invalid file"
    else
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        question = new        
        question.attributes = row.to_hash
        question.test_id = id
        question.save!
        
        test = question.test
        test.no_of_items = test.test_questions.count
        test.save
      end
      "Questions imported"
    end
  end

  private
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else 0
    end
  end
end
