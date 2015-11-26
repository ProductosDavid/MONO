=begin
    MONO
    Copyright (C) 2015  Universidad de los Andes
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end
 class ApplicationController < ActionController::Base
  protect_from_forgery
 # config.filter_parameters(:password)
   before_filter :set_i18n_locale_from_params
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  before_filter :authenticate_user!
  # ...
  protected


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

# For all responses in this controller, return the CORS access control headers.

   def cors_set_access_control_headers
    # headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Max-Age'] = "1728000"
   end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

   def cors_preflight_check
     if request.method == :options
       headers['Access-Control-Allow-Origin'] = '*'
       headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
       headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
       headers['Access-Control-Max-Age'] = '1728000'
       render :text => '', :content_type => 'text/plain'
     end
   end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end
end

