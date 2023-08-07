class DishesController < ApplicationController
    require 'csv'

  
    def index
        @dishes = Dish.all
    end
  
    def upload_csv
        if params[:csv_file].present?
            uploaded_file = params[:csv_file]
            csv_file_path = Rails.root.join('tmp', uploaded_file.original_filename)
            File.open(csv_file_path, 'wb') do |file|
              file.write(uploaded_file.read)
            end
            # CsvWorkerJob.perform_later(uploaded_file.tempfile.path)
            csv_file_path = uploaded_file.tempfile.path
          flash[:notice] = 'CSV file is being processed in the background.'
        else
          flash[:alert] = 'Please select a CSV file.'
        end

        redirect_to dishes_path
    end

end
