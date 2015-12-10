class ProjectsController < ApplicationController
  before_action :current_user
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to user_projects_path(current_user), flash: { success: 'Project was created successfully!' }
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @project.update(project_params)
      redirect_to user_projects_path(current_user), flash: { success: 'Project was updated successfully!' }
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to user_projects_path(current_user)
  end

  private

  def find_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
