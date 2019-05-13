# frozen_string_literal: true

# AttendancesController
class AttendancesController < ApplicationController
  before_action :logged_in, only: [:create]

  def create
    @event = Event.find(params[:id])
    @user = current_user
    @attendance = Attendance.new(attended_event: @event, event_attendee: @user)

    if @attendance.save
      flash[:success] = "You're attending!"
    else
      flash[:danger] = 'Try again'
    end
    redirect_to event_path
  end
end
