require "bundler/setup"
Bundler.require
require "sinatra/reloader" if development?
require "open-uri"
require "sinatra/json"
require "./models/contribution.rb"

use Rack::Session::Cookie

get "/" do
  erb :index
end


get "/q1who" do
  erb :q1who
end

post "/q1who" do
  session[:planner]     =params[:trip_planner]
  p session[:planner]
  redirect :"/q2name"
end


get "/q2name" do
  erb :q2name
end

post "/q2name" do
  session[:name]     =params[:trip_name]
  p session[:name]
  redirect :"/q3purpose"
end


get "/q3purpose" do
  erb :q3purpose
end

post "/q3purpose" do
  session[:purpose]     =params[:trip_purpose]
  p session[:purpose]
  redirect :"/q4where"
end


get "/q4where" do
  erb :q4where
end

post "/q4where" do
  session[:where]     =params[:trip_where]
  p session[:where]
  redirect :"/q5participent"
end


get "/q5participent" do
  erb :q5participent
end

post "/q5participent" do
  session[:participent1]     =params[:trip_participent1]
  session[:participent2]     =params[:trip_participent2]
  session[:participent3]     =params[:trip_participent3]
  session[:participent4]     =params[:trip_participent4]
  session[:participent5]     =params[:trip_participent5]
  p session[:participent1]
  redirect :"/q6activity"
end


get "/q6activity" do
  erb :q6activity
end

post "/q6activity" do
  session[:time1]     =params[:trip_act_time1]
  session[:time2]     =params[:trip_act_time2]
  session[:time3]     =params[:trip_act_time3]
  session[:time4]     =params[:trip_act_time4]
  session[:time5]     =params[:trip_act_time5]
  session[:activity1]     =params[:trip_activity1]
  session[:activity2]     =params[:trip_activity2]
  session[:activity3]     =params[:trip_activity3]
  session[:activity4]     =params[:trip_activity4]
  session[:activity5]     =params[:trip_activity5]
          
  p session[:time1]
  redirect :"/q7caution"
end


get "/q7caution" do
  erb :q7caution
end

post "/q7caution" do
  session[:caution]     =params[:trip_caution]
  p session[:caution]
  redirect :"/confirm"
end

get "/confirm" do
  @planner     =session[:planner]
  @name     =session[:name]
  @purpose     =session[:purpose]
  @where     =session[:where]
  @participent1 =session[:participent1] 
  @participent2 =session[:participent2] 
  @participent3 =session[:participent3] 
  @participent4 =session[:participent4] 
  @participent5 =session[:participent5] 
  @time1 =session[:time1] 
  @time2 =session[:time2] 
  @time3 =session[:time3] 
  @time4 =session[:time4]
  @time5 =session[:time5] 
  @activity1 =session[:activity1] 
  @activity2 =session[:activity2] 
  @activity3 =session[:activity3] 
  @activity4 =session[:activity4]
  @activity5 =session[:activity5] 
  @caution     =session[:caution]
  erb :confirm
end

post "/confirm" do
  trip = Trip.create({
    planner:    session[:planner],
    planname:     session[:name],
    purpose:     session[:purpose],
    meetplace:     session[:where],
    precaution:    session[:caution],
  })
  
   Participent.create({
      name: session[:participent1],
      trip_id: trip.id
    })
    
   Participent.create({
      name: session[:participent2],
      trip_id: trip.id
    })
    
   Participent.create({
      name: session[:participent3],
      trip_id: trip.id
    })
    
   Participent.create({
      name: session[:participent4],
      trip_id: trip.id
    })
    
   Participent.create({
      name: session[:participent5],
      trip_id: trip.id
    })
    
    
   Content.create({
       times: session[:time1],
       activity: session[:activity1],
       trip_id: trip.id
     })
     
   Content.create({
       times: session[:time2],
       activity: session[:activity2],
       trip_id: trip.id
     })
     
    Content.create({
       times: session[:time3],
       activity: session[:activity3],
       trip_id: trip.id
     })
     
    Content.create({
       times: session[:time4],
       activity: session[:activity4],
       trip_id: trip.id
     })
     
    Content.create({
       times: session[:time5],
       activity: session[:activity5],
       trip_id: trip.id
     })
   
  redirect "/share/#{trip.id}"
end

get "/share/:id" do
   @trip = Trip.find(params[:id])
   @participents = Trip.find(params[:id]).participents
   @contents = Trip.find(params[:id]).contents
   erb :share
end