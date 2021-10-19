class DashboardsController < ApplicationController
    before_action :set_sidebar
  
    def index
      @account = Account.all
    end
  
    def profile
      @account = Account.find(params[:id])
      @house = House.where(account_id: @account.id).latest.first
      @houses = House.where(account_id: @account.id)
      
      @houses_sold = House.where(account_id: @account.id).sold.count
      @houses_for_sale = House.where(account_id: @account.id).for_sale.count
      @houses_leased = House.where(account_id: @account.id).leased.count
      @houses_for_rent = House.where(account_id: @account.id).for_rent.count
  
      @agent = @admin_account
  
      
    end
  
    private 
  
    def set_sidebar
      @show_sidebar = true if account_signed_in?
    end
  
  
  end
  