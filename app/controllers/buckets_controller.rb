class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all
  end

  def show
    @bucket = Bucket.find(params[:id])
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)
    if @bucket.save
      flash[:info] = "Bucket Created!"
      redirect_to @bucket
    else
      render 'new'
    end
  end

  def edit
    @bucket = Bucket.find(params[:id])
  end

  def update
    @bucket = Bucket.find(params[:id])
    if @bucket.update_attributes(bucket_params)
      flash[:success] = "Bucket Updated!"
      redirect_to @bucket
    else
      render 'edit'
    end
  end

  def destroy
    Bucket.find(params[:id]).destroy
    flash[:success] = "Bucket deleted!"
    redirect_to buckets_url
  end


    private

      def bucket_params
        params.require(:bucket).permit(:name, :image_url)
      end


end
