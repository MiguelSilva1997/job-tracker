class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "You created #{@tag.title}"
      redirect_to tag_path(@tag)
    else
      binding.pry
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    if @tag.save
      flash[:success] = "You updated #{@tag.title}"
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    flash[:success] = "You deleted #{tag.title}"
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:title, job_ids: [])
  end
end
