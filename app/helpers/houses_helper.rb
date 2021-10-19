module HousesHelper
 
    private 
    #Only login peoples can access to the edit/update/destroy methods. 
    def require_login
        unless current_account != nil 
            redirect_to new_account_session_path
        end
    end

    #Only correct user can perform edit/update/destroy on his own houses.
    def correct_account
        @house = House.find(params[:id])
        unless current_account == @house.account
            redirect_to(@house, notice: "You cannot perform this action")
        end
    end

end
