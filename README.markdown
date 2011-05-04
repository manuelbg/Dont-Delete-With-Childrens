DontDeleteWithChildrens
=======================

This RoR plugin lets not delete a parent record if it has child records.


Install
=======

Rails 2.*

	$ rails script/plugin install https://manuelbg@github.com/manuelbg/Dont-Delete-With-Childrens.git

Rails 3.*

	$ rails plugin install https://manuelbg@github.com/manuelbg/Dont-Delete-With-Childrens.git


Use
=======

	class CarBrand < ActiveRecord::Base
	  has_many :car_types
	  dont_delete_with_childrens
	end


Copyright (c) 2011 [Manuel Betancourt Garza], released under the MIT license
