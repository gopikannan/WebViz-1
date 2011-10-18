Crom.schedule do

  every '10s' do
          year, month, day = Date.today.to_s.split(/-/)
          @date = year+month+day
          @poll = Poll.find(1)
          @data_set = @poll.data_sets.find_by_date(@date)
          @clicks = @poll.clicks.count

          if @data_set == nil 
                  @data_set = DataSet.new
                  @data_set.poll_id = 1
                  @data_set.date = @date
                  @data_set.poll_data = @clicks.to_s
                  @data_set.save
          else
                  
                  @data_set.poll_data += "," + @clicks.to_s
                  @data_set.save
          end 
  end

  # cron '* * * * *' do
    # Some task
  # end

  # schedule_in '20m' do
    # Some task
  # end

  # schedule_at 'Thu Mar 26 07:31:43 +0900 2020' do
    # Some task
  # end

end
