class ExtractDataFromTabFile < ApplicationService
  def initialize(file)
    @file = file
  end

  def call
    row = 0
    column_headers = []

    @file.filter_map do |record|
      sale_data = {}
      column = 0

      record.split("\t").each do |field|
        field.chomp!

        if header_row?(row)
          column_headers.push field
        else
          sale_data[column_headers[column]] = field
          column += 1
        end
      end

      row += 1
      row == 1 ? nil : sale_data
    end
  end

  private

  def header_row?(row)
    row.zero?
  end
end
