class UserController < ApplicationController
  before_action :set_checklist, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  @@citySearch = true
  @@cityCat = true


  # GET /users
  # GET /users.json
  def index
    @users = User.all

  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user = User.find_by(params[:id])
    @weather = OpenWeatherApi.new("dae8d10e4ffe898434f2932fc31d48d2").get_weather(current_user.checklists.last.destination)

    @description = @weather['weather'][0]['description']
    @icon = @weather['weather'][0]['icon']
    @temp = @weather['main']['temp']

    # @temp = @weather.get_weather('miami')['weather'][0]['description']


















    @date = @user.checklists.last.date

    # @weather = OpenWeatherApi.new('dae8d10e4ffe898434f2932fc31d48d2').get_weather(@user.checklists.last.destination)['main']
      # Start of destination scrape
      destUrl = "http://www.10best.com/destinations/all/"

      destResponse = HTTParty.get(destUrl)
      # p response.headers['Content-Type']

      #String => Nokgiri::HTML => DocumentObjectModel (DOM)
      destDom = Nokogiri::HTML(destResponse.body)
      # p dom.css('html') #gives everything wthin the html tag

      destinations = destDom.css('a.rss')

      @cities = []
      destinations.each do |city|
        @cities << city.text
      end

      @links = []
      destinations.each do |link|
        @links << 'http://www.10best.com' + link['href']
      end
      # End of destination scrape

      @cityQuery = @cities.sample
      cat = "Miami"

      if @cities.include? @@citySearch
        @cityQuery = @@citySearch
        cat = @@cityCat
        @tryit = @@cityCat
      else
        @tryit = "NOpe!"
      end




      @citySelect = @cityQuery.split(",")[0]

      @cityIndex = @cities.index(@cityQuery)

      # Start of attractions scrape
      @attrUrl = @links[@cityIndex] + "attractions/best-attractions-activities/"
      attrResponse = HTTParty.get(@attrUrl)

      #String => Nokgiri::HTML => DocumentObjectModel (DOM)
      attrDom = Nokogiri::HTML(attrResponse.body)
      # p dom.css('html') #gives everything wthin the html tag

      attractions = attrDom.css('.list-headline h2')

      @venue = []
      attractions.each do |place|
        @venue << place.text
      end

      # Get two random attractions and give them their own variables
      @venues = @venue.sample(3)
      @venue_one = @venues[0]
      @venue_two = @venues[1]
      @venue_three = @venues[2]


      # Index of random photo to grab correct picture
      @index_one = @venue.index(@venue_one)
      @index_two = @venue.index(@venue_two)
      @index_two = @venue.index(@venue_two)
      @index_three = @venue.index(@venue_three)


      images = attrDom.css('img.lazy')

      @image = []
      images.each do |picture|
        @image << 'https:' + picture['data-src']
      end

      # Select image link based on index of random photo
      @image_one = @image[@index_one]
      @image_two = @image[@index_two]
      @image_three = @image[@index_three]

      # End of attractions scrape

      # # Start of Flickr API
      FlickRaw.api_key="3d403357fbd5a290f43a9b6cd0216a4a"
      FlickRaw.shared_secret="7ea1e588cac6c790"

      args = {:tags => "#{@citySelect} #{cat}"}

      @flickrsearch = []

      discovered_pictures = flickr.photos.search args
      discovered_pictures.each{|p| url = FlickRaw.url p; @flickrsearch << url}

      # @flickrpics = @flickrsearch.map {|f| "<img src='#{f}'>"}

      # End of Flickraw API




  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
  @user.user_id = current_user.id


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def set_checklist
    @checklist = Checklist.where(user_id: params[:id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :avatar )
    end
  end
