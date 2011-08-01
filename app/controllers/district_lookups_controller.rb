class DistrictLookupsController < ApplicationController
  def new
    @district_lookup = DistrictLookup.new
  end

  def create
    @district_lookup = DistrictLookup.new params[:district_lookup]
    if @district_lookup.valid?
      @district  = Sunlight::District.get(:address => "#{@district_lookup.street} #{@district_lookup.postal_code}" )
      @legislators = Sunlight::Legislator.all_in_district @district

      @capability = Twilio::Util::Capability.new(ACCOUNT_SID, AUTH_TOKEN)
      @capability.allow_client_outgoing(TWILIO_APPLICATION_ID)
      

      render :action => 'show'
    else
      render :action => 'new'
    end
  end

  def index
    redirect_to '/'
  end
end
