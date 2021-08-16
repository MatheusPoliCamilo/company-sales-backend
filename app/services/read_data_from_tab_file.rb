class ReadDataFromTabFile < ApplicationService
  def initialize(file)
    @file = file
  end

  def call
    column_headers = []

    @file.each_with_index.filter_map do |record, row|
      if row.zero?
        populate_column_headers(column_headers, record)
        next
      end

      populate_sale_data(column_headers, record)
    end
  end

  private

  def populate_column_headers(column_headers, record)
    record.split("\t").each do |field|
      field.chomp!

      column_headers.push field
    end
  end

  def populate_sale_data(column_headers, record)
    sale_data = {}

    record.split("\t").each_with_index do |field, index|
      field.chomp!

      sale_data[column_headers[index]] = field
    end

    sale_data
  end
end
