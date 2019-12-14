class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    send_data(@image.file_contents, type: @image.content_type, filename: @image.filename)
  end
end
