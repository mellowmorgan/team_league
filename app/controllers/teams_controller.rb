class TeamsController < ApplicationController

  def index
    @teams = Team.all
    render :index
  end

  def new
    @team = Team.new
    render :new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    render :edit
  end

  def show
    @team = Team.find(params[:id])
    render :show
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    games_with_team_1 = Game.where(team_1_id: @team.id)
    games_with_team_2 = Game.where(team_2_id: @team.id)
    games_with_team_1.each do |game|
      game.destroy
    end
    games_with_team_2.each do |game|
      game.destroy
    end
    @team.destroy
    redirect_to teams_path
  end

  private
    def team_params
      params.require(:team).permit(:team_coordinator, :name)
    end

end