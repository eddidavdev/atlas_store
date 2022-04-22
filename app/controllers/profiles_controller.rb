class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update destroy]
  #   before_action :correct_user, only: %i[edit update destroy]

  def show; end

  def edit; end

  def update
    @profile.client_type = profile_params[:client_type]
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @profile.client_type = profile_params[:client_type]

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @profile = current_user.profile
    redirect_to root_path, notice: 'Not Authorized to edit this Profile' if @profile.nil?
  end

  private

  def set_profile
    @profile = current_user.profile
    redirect_to new_profile_path if @profile.nil?
  end

  def profile_params
    params.require(:profile).permit(:name, :lastname, :email, :phone, :address, :client_type, :user_id)
  end
end
