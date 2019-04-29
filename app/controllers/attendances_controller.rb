class AttendancesController < ApplicationController

  def create 
    @event = Event.find(params[:id])
    @user = current_user
    @attendance = Attendance.new(:attended_event => @event, :event_attendee=> @user)

    if @attendance.save
      flash[:success] = "You're attending!"
      redirect_to event_path
    else 
      flash[:danger] = "Try again"
      redirect_to event_path
    end
  end

end
