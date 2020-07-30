class BugsController < ApplicationController
	def create
    	@project = Project.find(params[:project_id])
    	@bug = @project.bugs.create(bug_params)
    	redirect_to project_path(@project)
  end
 	def destroy
    	# @article = Article.find(params[:article_id])
    	# @bug = Bug.find(params[:id])
    	# @bug.destroy
    	# redirect_to book_url(@bug.book_id)
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
      params.require(:bug).permit(:title, :body, :status)
    end
end
