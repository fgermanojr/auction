class SubmissionsController < ApplicationController
  def upload
    render 'upload'
  end

  private

  def submissions_params
    params.require(:submission).permit(:csv_file)
  end
end
