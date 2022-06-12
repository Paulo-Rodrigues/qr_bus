class Admins::BustracksController < ApplicationController
  def create
    @bus_line = BusLine.find(params[:bus_line_id])
    @bustrack = @bus_line.bustracks.create!(track_params)

    redirect_to admins_bus_line_path(@bus_line)
  end

  private

  def track_params
    params.require(:bustrack).permit(:start_time, :end_time)
  end
end
