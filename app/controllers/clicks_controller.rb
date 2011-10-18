class ClicksController < ApplicationController
  def create
          @click = Click.new
          @click.poll_id = params[:poll_id]
          @click.user_id = current_user.id
          @click.option = params[:option]
          @click.location = "Raleigh,NC"
          @click.save

          redirect_to root_path
  end

end
