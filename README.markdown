DontDeleteWithChildrens
=======================

This RoR plugin lets not delete a parent record if it has child records.


Install
=======

Rails 2.*
	$ rails script/plugin install git@github.com:manuelbg/Dont-Delete-With-Childrens.git

Rails 3.*
	$ rails plugin install git@github.com:manuelbg/Dont-Delete-With-Childrens.git


Use
=======
In app/models/car_brand.rb
	class CarBrand < ActiveRecord::Base
		has_many :car_types
		dont_delete_with_childrens, [:car_types]
	end

You can add all the associations needed for the parent model, like [:car_types, :autopart_types]

In app/controllers/car_brand_controller.rb
	def destroy
    @car_brand = CarBrand.find(params[:id])
    if @car_brand.destroy
    	redirect_to car_brands_url, :notice => "Successfully destroyed car brand."
    else
    	redirect_to car_brands_url, :alert => "Can't destroy this car brand because has car types."
    end
  end

Copyright (c) 2011 [Manuel Betancourt Garza], released under the MIT license
