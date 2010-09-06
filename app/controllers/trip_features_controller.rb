class TripFeaturesController < ApplicationController
  # GET /trip_features
  # GET /trip_features.xml
  def index
    @trip_features = TripFeature.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trip_features }
    end
  end

  # GET /trip_features/1
  # GET /trip_features/1.xml
  def show
    @trip_feature = TripFeature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip_feature }
    end
  end

  # GET /trip_features/new
  # GET /trip_features/new.xml
  def new
    @trip_feature = TripFeature.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trip_feature }
    end
  end

  # GET /trip_features/1/edit
  def edit
    @trip_feature = TripFeature.find(params[:id])
  end

  # POST /trip_features
  # POST /trip_features.xml
  def create
    @trip_feature = TripFeature.new(params[:trip_feature])

    respond_to do |format|
      if @trip_feature.save
        format.html { redirect_to(@trip_feature, :notice => 'TripFeature was successfully created.') }
        format.xml  { render :xml => @trip_feature, :status => :created, :location => @trip_feature }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trip_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trip_features/1
  # PUT /trip_features/1.xml
  def update
    @trip_feature = TripFeature.find(params[:id])

    respond_to do |format|
      if @trip_feature.update_attributes(params[:trip_feature])
        format.html { redirect_to(@trip_feature, :notice => 'TripFeature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip_feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_features/1
  # DELETE /trip_features/1.xml
  def destroy
    @trip_feature = TripFeature.find(params[:id])
    @trip_feature.destroy

    respond_to do |format|
      format.html { redirect_to(trip_features_url) }
      format.xml  { head :ok }
    end
  end
end
