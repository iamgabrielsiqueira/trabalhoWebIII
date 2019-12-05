class MyReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
    end

    def show
    end
end
