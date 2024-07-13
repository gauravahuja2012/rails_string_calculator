class CalculatorsController < ApplicationController
  def index
    redirect_to new_calculator_path
  end
  
  def new
  end

  def create
    input = params[:input]
    begin
      @result = StringCalculator.add(input)
    rescue => e
      @error = e.message
    end
    render :new
  end
end