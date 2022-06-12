class BusLinesController < ApplicationController
  before_action :find_bus, only: %i[ show ]

  def index
    @bus_lines = BusLine.all

    render json: @bus_lines, status: :ok
  end

  def show
    @bus_line = BusLine.find(params[:id])

    render json: @bus_line, status: :ok
  end
end
