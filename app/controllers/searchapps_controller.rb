class SearchappsController < ApplicationController
  require 'yomu'

  def index
    @searchapps = Searchapp.search params[:search]

   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searchapps }
    end
  end

  # GET /searchapps/1
  # GET /searchapps/1.json
  def show
    @searchapp = Searchapp.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @searchapp }
    end
  end

  # GET /searchapps/new
  # GET /searchapps/new.json
  def new
    @searchapp = Searchapp.new
   # 5.times { @searchapp.assets.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @searchapp }
    end
  end

  # GET /searchapps/1/edit
  def edit
    @searchapp = Searchapp.find(params[:id])
    #5.times { @searchapp.assets.build }
  end

  # POST /searchapps
  # POST /searchapps.json
  def create
    @searchapp = Searchapp.new(params[:searchapp])

    respond_to do |format|
      if @searchapp.save
#TODO this for loop should be moved to model
    @searchapp.assets.each do |asset|
     yomu = Yomu.new  "#{asset.asset.path}"
     text = yomu.text
     asset.content = text
     asset.save
     flash[:notice] = "Files are uploaded successfully"
    end


        format.html { redirect_to @searchapp, notice: 'Searchapp was successfully created.' }
        format.json { render json: @searchapp, status: :created, location: @searchapp }
      else
        format.html { render action: "new" }
        format.json { render json: @searchapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searchapps/1
  # PUT /searchapps/1.json
  def update
    @searchapp = Searchapp.find(params[:id])

    respond_to do |format|
      if @searchapp.update_attributes(params[:searchapp])
        format.html { redirect_to @searchapp, notice: 'Searchapp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @searchapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searchapps/1
  # DELETE /searchapps/1.json
  def destroy
    @searchapp = Searchapp.find(params[:id])
    @searchapp.destroy

    respond_to do |format|
      format.html { redirect_to searchapps_url }
      format.json { head :no_content }
    end
  end


end

