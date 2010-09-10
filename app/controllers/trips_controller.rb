class TripsController < ApplicationController
  # GET /trips
  # GET /trips.xml
  def index
    @trips = Trip.all
    if current_user
      @trips = recommend_for_current_user
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.xml
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.xml
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.xml
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to(@trip, :notice => 'Trip was successfully created.') }
        format.xml  { render :xml => @trip, :status => :created, :location => @trip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.xml
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to(@trip, :notice => 'Trip was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.xml
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to(trips_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def recommend_for_current_user
    points = {}
    @trips.each do |trip|
      trip_points = 0
      
      current_user.user_preferences.each do |pref|
        if pref.kind == "century"
          if (trip.start_date.to_s + "'s" == pref.name) 
            trip_points += 5
          end
          if (trip.end_date.to_s + "'s" == pref.name)
            trip_points += 5
          end
        end
        if (pref.name == "Other" && trip.location == "Outer Space")
          trip_points += 3
        end
        if pref.kind == "area"
          if (pref.name == trip.location)
            trip_points += 7
          end
        end
        if (pref.name == "Europe" && trip.location == "England")
          trip_points += 5
        end
        if (pref.name == "Mountain Climbing" && trip.activity == "Hiking")
          trip_points += 3
        end
        if (pref.name == "Europe" && trip.location == "France")
          trip_points += 5
        end
        if (pref.name == "Asia" && trip.location == "China")
          trip_points += 5
        end
        if (pref.name == "Concert Going" && trip.activity == "Theater")
          trip_points += 3
        end
        if pref.kind == "activity"
          if (pref.name == trip.activity)
            trip_points += 8
          end
        end
        if (pref.name == "Asia" && trip.location == "Himalayas")
          trip_points += 5
        end
        if (pref.name == "Europe" && trip.location == "UK")
          trip_points += 3
        end
        if (pref.name == "Other" && trip.location == "Atlantic Ocean")
          trip_points += 5
        end
      end
      points[trip] = trip_points
    end
    points.each_pair.sort_by { |key, value| value}.map { |key, value| key }.reverse
  end
end
