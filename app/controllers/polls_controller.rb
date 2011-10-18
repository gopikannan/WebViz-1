class PollsController < ApplicationController
  def new
  end

  def show
          @poll = Poll.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def blob
          @poll = Poll.find(params[:poll_id])
          @data_set = @poll.data_sets.find_by_date(get_date)
          respond_to do |format|
                  format.js
          end
  end

  def update
          @poll = Poll.find(params[:poll_id])
          @count = @poll.clicks.where(:option => 1).count - @poll.clicks.where(:option => 2).count
  end
end
