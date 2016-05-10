class RepositoriesController < ApplicationController
  def index
    git = GithubService.new('access_token' => session[:token])
    @user = git.get_username
    @repos_array = git.get_repos
  end

  def create
    github = GithubService.new('access_token' => session[:token])
    github.create_repo(params[:name])
    redirect_to root_path
  end
end
