
[1mFrom:[0m /mnt/c/Users/Wasif Khan/Development/projects/CarWashApp/app/controllers/carwashes_controller.rb @ line 42 CarwashesController#update:

    [1;34m35[0m: [32mdef[0m [1;34mupdate[0m 
    [1;34m36[0m: 
    [1;34m37[0m:     @carwash = [1;34;4mCarwash[0m.find(params[[33m:id[0m])
    [1;34m38[0m:     [32mif[0m @carwash.user_rating && @carwash.user_comment
    [1;34m39[0m:         @carwash.update(feedback_params)
    [1;34m40[0m:         redirect_to user_carwash_path(params[[33m:user_id[0m], params[[33m:id[0m])   
    [1;34m41[0m:     [32melse[0m 
 => [1;34m42[0m:         binding.pry
    [1;34m43[0m:         @carwash = [1;34;4mCarwash[0m.find(params[[33m:id[0m])
    [1;34m44[0m:         render [33m:show[0m 
    [1;34m45[0m:     [32mend[0m 
    [1;34m46[0m: 
    [1;34m47[0m: 
    [1;34m48[0m: [32mend[0m 

