class MembershipsController < ApplicationController
   before_filter :authenticate_user!


  def create
    @event = Event.find(params[:membership][:event_id])
    @event.memberships.create!(member_id: current_user.id)
    flash[:notice] = 'You joined the Event successfully'
    redirect_to event_path(@event)
  end

  def destroy
    @event = Membership.find(params[:id]).event
    @event.memberships.find_by_member_id(current_user.id).destroy
    flash[:notice] = 'You have quited the Event successfully'
    redirect_to event_path(@event)
  end
end
