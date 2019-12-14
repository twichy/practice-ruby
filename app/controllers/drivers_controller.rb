class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.new(driver_params)

    # Check if an image was attached:
    image_file = params[:driver][:image]
    if image_file
      filename = sanitize_filename(image_file.original_filename)
      file_contents = image_file.read
      content_type = image_file.content_type
      unless content_type == "image/png"
        redirect_to new_driver_path, notice: 'Image has to be of type PNG.'
        return
      end
    end

    driver_saved = @driver.save

    if driver_saved && image_file
      image = Image.create(:filename => filename, :content_type => content_type, :file_contents => file_contents, :imageable => @driver)
      image_saved = image.save
      unless image_saved
        redirect_to new_driver_path, :notice => "bad image format"
        return
      end
    end

    respond_to do |format|
      if driver_saved
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { redirect_to new_driver_path, notice: @driver.errors.full_messages[0] }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:name, :email, :birth)
    end

    def sanitize_filename(filename)
      return File.basename(filename)
    end
end
