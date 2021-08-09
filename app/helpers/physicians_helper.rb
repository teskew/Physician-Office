module PhysiciansHelper

     def physician_exists_header 
          if @physician
             content_tag(:h1, "#{@physician.name} Appointments")
          else 
              content_tag(:h1, "Appointments!!")
          end 
      end
end