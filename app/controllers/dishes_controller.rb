class DishesController < ApplicationController
  
    def index
        @dishes = Dish.all
    end
  
    def upload_csv
        if params[:csv_file].present?
          uploaded_file = params[:csv_file]
        #   CsvWorker.perform_async(uploaded_file.tempfile.path)
          flash[:notice] = 'CSV file is being processed in the background.'
        else
          flash[:alert] = 'Please select a CSV file.'
        end

        redirect_to dishes_path
    end

end
