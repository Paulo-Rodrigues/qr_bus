class BusLinesController < ApplicationController
  before_action :find_bus, only: %i[ show edit update destroy ]

  def index
    @bus_lines = BusLine.all
  end

  def show
  end

  def new
    @bus_line = BusLine.new
  end

  def create
    @bus_line = BusLine.new(bus_line_params)

    if @bus_line.save
      redirect_to @bus_line
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @bus_line.update(bus_line_params)
      redirect_to @bus_line
    else
      render 'edit'
    end
  end

  def destroy
    @bus_line.destroy

    flash[:success] = 'Rota deletada com sucesso!'

    redirect_to bus_lines_path
  end

  private

  def bus_line_params
    params.require(:bus_line).permit(:from, :to, :name)
  end

  def find_bus
    @bus_line = BusLine.find(params[:id])
  end
end
