class CatsController < ApplicationController
  # Before Action
  before_action :set_cat, only: %i[ show edit update destroy ]

  # GET /cats
  def index
    @search = Cat.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @cats = @search.result.page(params[:page])
  end

  # GET /cats/1
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      flash.now.notice ="猫を登録しました"

      # Turbo_Streams
      # create.turbo_stream.erb をレンダリング
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1
  def update
    # turbo_stream
    if @cat.update(cat_params)
      flash.now.notice = "猫情報を更新しました！"
      
      # Turbo_Streams
      # update.turbo_stream.erb をレンダリング

    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1
  def destroy
    @cat.destroy
    flash.now.notice = "ねこを削除しました"

    # Turbo_Streams
      # destroy.turbo_stream.erb をレンダリング
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end

    def cat_params
      params.require(:cat).permit(:name, :age)
    end
end
