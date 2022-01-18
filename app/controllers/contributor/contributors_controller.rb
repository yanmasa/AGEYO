class Contributor::ContributorsController < ApplicationController
  before_action :authenticate_contributor!
  
  def show
    @contributor = current_contributor
    @posts = @contributor.posts
  end

  def edit
    @contributor = current_contributor
  end

  def update
    @contributor = current_contributor
    if @contributor.update(contributor_params)
      redirect_to contributor_contributors_path
    else
      render :edit
    end
  end

  def quit
  end

  def out
    @contributor = current_contributor
    @contributor.update(is_active: false)
    reset_session
    redirect_to root_path
  end


  private

  def contributor_params
    params.require(:contributor).permit(:name, :nickname, :email, :organization_name, :organization_url, :profile_image, :introduction)
  end

end
