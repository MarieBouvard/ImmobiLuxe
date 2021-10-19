class PublicsController < ApplicationController

    def main
        if account_signed_in?
          path = current_account.admin? ? accounts_path : dashboard_path
          redirect_to path, flash: { success: "Sucessfully signed in. Welcome to Real Estate" } and return
        end
        @houses = House.limit(12).latest
        @posts = Post.limit(4).latest
      end
    
      def index
        @houses = House.all.page(params[:page]).per(20)
      end
    
end
