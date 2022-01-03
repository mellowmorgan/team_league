class GamesController < ApplicationController

  def index
    @games = Game.all
    render :index
  end

  def new
    @game = Game.new
    render :new
  end

  def create
    team1_name = game_params.fetch(team_1_id)
    team2_name = game_params.fetch(team_2_id)
    team1 = Team.where(name: team1_name).first.id
    team2 = Team.where(name: team2_name).first.id
    score1 = game_params.fetch(team_1_score)
    score2 = game_params.fetch(team_2_score)
    @game = Game.new(:team_1_id => team1, :team_2_id => team2, :team_1_score => score1, :team_2_score => score2)
    if @game.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    render :edit
  end

  def show
    @game = Game.find(params[:id])
    render :show
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to teams_path
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to teams_path
  end

  private
    def game_params
      params.require(:game).permit(:team_1_id, :team_2_id, :team_1_score, :team_2_score)
    end

end