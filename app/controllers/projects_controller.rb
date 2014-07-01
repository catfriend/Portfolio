class ProjectsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      respond_to do |format|
        format.html do
          if @project.save
            flash[:notice] = "Project has been created."
            redirect_to @project
          else
            flash[:alert] = "Project could not be created."
            render :action => "new"
          end
        end
        format.js do
          unless @project.save
            render text: @project.errors.full_messages.join,
              status: :unprocessable_entity
          end
        end
    end
  end

  def show
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was succesfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to @project, notice: 'Project was succesfully deleted.'
    else
      render :edit
    end
  end

  def errors
     @project = Project.find(params[:id])
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used, :image)
  end

  #def set_carrierwave_image
   # @carrierwave_image = CarrierwaveImage.find(params[:id])
  #end

  #def carrierwave_image_params
   # params.require(:carrierwave_image).permit(:image, :remove_image)
  #end
end
