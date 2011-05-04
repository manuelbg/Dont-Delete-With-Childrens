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
		has&#95;many :car&#95;types
		dont&#95;delete&#95;with&#95;childrens, [:car&#95;types]
	end

You can add all the associations needed for the parent model, like [:car&#95;types, :autopart&#95;types]

In app/controllers/car&#95;brand_controller.rb
	def destroy
    @car&#95;brand = CarBrand.find(params[:id])
    if @car&#95;brand.destroy
    	redirect&#95;to car&#95;brands&#95;url, :notice => "Successfully destroyed car brand."
    else
    	redirect&#95;to car&#95;brands&#95;url, :alert => "Can't destroy this car brand because has car types."
    end
  end

Copyright (c) 2011 [Manuel Betancourt Garza], released under the MIT license
