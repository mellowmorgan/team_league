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
    @wins = 0
    @losses = 0
    @team = Team.find(params[:id])
    Game.all.each do |game|
      if (game.team_1_id == @team.id)
        if game.team_1_score > game.team_2_score
          @wins += 1
        else
          @losses += 1
        end
      end
      if (game.team_2_id == @team.id)
        if game.team_2_score > game.team_1_score
          @wins += 1
        else
          @losses += 1
        end
      end
    end
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