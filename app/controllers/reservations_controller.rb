class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.start_date > @reservation.end_date
      render :action => :new
      return
    end

    @reservations = Reservation.all

    check = true

    for reserv in @reservations do
      if reserv.room == @reservation.room
        if @reservation.start_date <= reserv.end_date && reserv.start_date <= @reservation.end_date
          check = false
        else
          check = true
        end
      end
    end

    if check == false
      render :action => :new
      return
    end

    qntd = (@reservation.end_date-@reservation.start_date).to_i
    @reservation.price = @reservation.room.room_type.price * qntd

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update

    if @reservation.start_date > @reservation.end_date
      render :action => :new
      return
    end

    @reservations = Reservation.all

    check = true

    for reserv in @reservations do
      if reserv.room == @reservation.room and reserv != @reservation
        if @reservation.start_date <= reserv.end_date && reserv.start_date <= @reservation.end_date
          check = false
        else
          check = true
        end
      end
    end

    if check == false
      render :action => :edit
      return
    end

    qntd = (@reservation.end_date-@reservation.start_date).to_i

    @reservation.price = @reservation.room.room_type.price * qntd

    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :price, :description, :room_id, :user_id)
    end
end
