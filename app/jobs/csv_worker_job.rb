class CsvWorkerJob < ApplicationJob
    require 'csv'
    queue_as :default

    def perform(csv_file_path)
        rows = []
        CSV.foreach(csv_file_path, headers: true) do |row|
            values = [
              "'#{row['dish_name']}'", "'#{row['dish_description']}'", "'#{row['dish_type']}'", 
              "'#{row['allergens']}'", "'#{row['category']}'", row['Price'], 'NOW()', 'NOW()'
            ]
            rows << "(#{values.join(', ')})"
        end
        values_string = rows.join(', ')
        sql = <<-SQL
          INSERT INTO dishes (name, description, dish_type, allergens, category, price, created_at, updated_at)
          VALUES #{values_string}
        SQL
        ActiveRecord::Base.connection.execute(sql)

        # Remove the CSV file after processing
      File.delete(csv_file_path)
    end
end
