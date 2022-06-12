class Admins::BusLinesController < ApplicationController
  def index
    @bus_lines = BusLine.all
  end

  def show
    @bus_line = BusLine.find(params[:id])
  end

  def new
    @bus_line = BusLine.new
  end

  def create
    @bus_line = BusLine.new(bus_line_params)

    if @bus_line.save
      redirect_to admins_bus_line_path(@bus_line)
    else
      render new_admins_bus_line_path
    end
  end

  def edit
    @bus_line = BusLine.find(params[:id])
  end

  def update
    @bus_line = BusLine.find(params[:id])

    if @bus_line.update(bus_line_params)
      redirect_to admins_bus_line_path(@bus_line)
    else
      render edit_admins_bus_line_path
    end
  end

  def destroy
    @bus_line = BusLine.find(params[:id])

    @bus_line.destroy
  end

  private

  def bus_line_params
    params.require(:bus_line).permit(:from, :to, :name)
  end
end
