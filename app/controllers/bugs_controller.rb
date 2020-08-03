class BugsController < ApplicationController
  respond_to :html, :xml

  before_action :configure_permitted_parameters, if: :devise_controller?
  

	def create
    	@project = Project.find(params[:project_id])
    	@bug = @project.bugs.create(bug_params)
    	redirect_to project_path(@project)
  end
 	def destroy
    	# @article = Article.find(params[:article_id])
    	@bug = Bug.find(params[:id])
    	@bug.destroy
    	redirect_to project_url(@bug.project_id)
  end


  def take_bug_developer
    byebug
    # @user= User.joins(:project).find(params[:id])
    # @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @users = User.where(user_type: :developer)
    @bug = Bug.find(params[:id])
    # @bug.project<< @user
    render 'index'
  end
 #  def assign_developer
 #  	  @bug.user= user
 #  	  render 'index'
 #  end

	# def assign_bug_to_developer
	# 	@users = User.where(user_type: :developer)
 #    render 'assign_bug_to_developer'
	# end

  private
    def bug_params
      params.require(:bug).permit(:title, :body,:image)
    end
end
