class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_resume, only: [:detail]
  def index
    @resumes = Resume.all.order(id: :desc).page(params[:page])
  end

  def detail
     @pics = @resume.items
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end

end
