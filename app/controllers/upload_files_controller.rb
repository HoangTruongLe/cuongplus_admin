class UploadFilesController < ApplicationController
  before_action :authenticate_user!, except: [:add_photo, :get_photos, :upload_editor]
  before_action :set_upload_file, only: [:show, :edit, :update, :destroy]

  def add_photo
    @upload_file = UploadFile.new(upload_file_params)
    if @upload_file.save!
      render json: { message: 'success', uploadId: @upload_file.id }
    else
      render json: { message: @upload_file.errors.full_message, status: :unprocessable_entity }
    end
  end

  def get_photos
    @upload_files = UploadFile.where(fileable_id: params[:file_id])
    if @upload_files.count > 0
      render json: { photos: @upload_files.map { |e| {id: e.id,
        photo_file_name: e.file_file_name,
        photo_content_type: e.file_content_type,
        photo_file_size: e.file_file_size,
        image_url: e.s3_path(:thumb)}  }}
    else
      render json: 'no upload_file'
    end
  end

  def upload_editor
    @upload_file = UploadFile.new(file: params[:file])
    if @upload_file.save!
      render json: { link: @upload_file.file.url }
    else
      render json: { message: @upload_file.errors.full_message, status: :unprocessable_entity }
    end
  end

  def create

  end

  def destroy
    @upload_file = UploadFile.find(params[:id])
    if @upload_file.destroy
      render json: { message: "the file has been deleted from server" }
    else
      render json: { message: @upload_file.errors.full_message }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_file
      @upload_file = UploadFile.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_file_params
      params.require(:upload_file).
        merge({fileable_id: params[:file_id], fileable_type: params[:file_type]}).
        permit(:file, :fileable_id, :fileable_type)
    end
end
