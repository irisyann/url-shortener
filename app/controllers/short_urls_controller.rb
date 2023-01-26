class ShortUrlsController < ApplicationController
  def index
    @short_url = ShortUrl.all
    @short_url = @short_url.sort_by { |url| url.created_at }
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    @target_url = params[:short_url][:target_url]

    begin
      doc = Nokogiri.HTML(URI.open(@target_url))
      @title = doc.at_css("title").text
    rescue => e
      @title = "(no title found for this webpage)"
    end

    @short_url = ShortUrl.new do |url|
      url.target_url = @target_url
      url.short_path = SecureRandom.uuid[0..5]
      url.title = @title
    end

    if @short_url.save
      # redirect_to short_urls_path
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def redirect
    @short_url = ShortUrl.find_by(short_path: params[:short_path])

    if @short_url

        ### USING GEOCODER GEM
        @location = request.location.city

        # redirect to target url
        redirect_to @short_url.target_url, status: :moved_permanently, allow_other_host: true

        # create a new geolocation for the short url visit
        @geolocation = @short_url.geolocations.create(:location => @location)

        # increment number of clicks to the short url
        @short_url.update_attribute(:num_clicks, @short_url.num_clicks + 1)

    else
        redirect_to root_path, notice: "Invalid short URL" if @short_url.nil?
        # render 'errors/404', status: 404 if @short_url.nil?
    end
  end
end
