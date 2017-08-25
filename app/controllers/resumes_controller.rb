class ResumesController < ApplicationController
  layout 'resume'
  before_action :check_permission, except: [:create, :saved]
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    @items = @resume.items.build
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)
    respond_to do |format|
      if @resume.save
        if !params[:items].blank?
          begin
            params[:items]['image'].each do |a|
              @items = @resume.items.create!(image: a, resume_id: @resume.id)
            end
          rescue ActiveRecord::RecordInvalid => e
            format.html {render 'resumes/error'}
          end
        end
        format.html {render 'resumes/saved'}
      else
        format.html {render :new}
        format.json {render json: @resume.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html {redirect_to @resume, notice: 'Resume was successfully updated.'}
        format.json {render :show, status: :ok, location: @resume}
      else
        format.html {render :edit}
        format.json {render json: @resume.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html {redirect_to resumes_url, notice: 'Resume was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resume
    @resume = Resume.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resume_params
    params.require(:resume).permit(:name, :mobile_number, :birthday, :college, :email, :location, :gender)
  end

  def check_permission
    action = request[:action]
    if action == 'new' || action == 'create'
      true
    else
      redirect_to '/resumes/new'
    end
  end
end
