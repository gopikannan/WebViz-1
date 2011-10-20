class ClicksController < ApplicationController
  def create
	  if session[:latest_click] < 0  	
	  	@click = Click.new
         	@click.poll_id = params[:poll_id]
          	@click.user_id = current_user.id
          	@click.option = params[:option]
          	@click.location = params[:loc]
          	@click.save
         	session[:latest_click]=Time.now.to_i
		country_click=CountryClicks.where(:poll_id =>params[:poll_id],:date => get_date) || CountryClicks.create_with_params(params)
                country_click.clicks += 1;
                country_click.save
	  else
	 	if Time.now.to_i - session[:latest_click] > 60	 
	  		@click = Click.new
         		@click.poll_id = params[:poll_id]
          		@click.user_id = current_user.id
          		@click.option = params[:option]
          		@click.location = params[:loc]
          		@click.save
			session[:latest_click]=Time.now.to_i
			country_click=CountryClicks.where(:poll_id =>params[:poll_id],:date => get_date) || CountryClicks.create_with_params(params)
			country_click.clicks += 1;
			country_click.save
		else
			respond_to do |format|  
      				format.html {   
        				flash.now[:error] = "Chill dude !! "  
        				render :action => "new"  
      				}	  
      				# Render out the validation failed message with a  
      				# 403 status code.  
      				format.js { render :text => e.message, :status => 403 }  
			end
		end
		
	end
  end

end
