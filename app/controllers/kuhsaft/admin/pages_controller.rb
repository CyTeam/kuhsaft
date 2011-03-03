require 'pp'
module Kuhsaft
  module Admin
    class PagesController < ApplicationController
      respond_to :html
    
      def index
        @pages = Kuhsaft::Page.root_pages
        respond_with @pages
      end
    
      def show
        @page = Kuhsaft::Page.find(params[:id])
        respond_with @page
      end
    
      def new
        @page = Kuhsaft::Page.new
        respond_with @page
      end
    
      def create
        @page = Kuhsaft::Page.create params[:kuhsaft_page]
        @page.save
        respond_with @page, :location => edit_admin_page_url(@page)
      end
    
      def edit
        @page = Kuhsaft::Page.find(params[:id])
        respond_with @page
      end
    
      def update
        @page = Kuhsaft::Page.find(params[:id])
        @page.update_attributes(params[:kuhsaft_page])
        respond_with @page, :location => edit_admin_page_url(@page)
      end
    
      def destroy
        @page = Kuhsaft::Page.find(params[:id])
        @page.destroy
        redirect_to admin_pages_path
      end
    end
  end
end