module AppointmentHelper
  

def index_header_physician 
    if @physician 
       content_tag(:h1, "A physician: '#{@physician.name} - #{@physician.email}'")
       
    else 
      content_tag(:h1, "All of the Appointments!! ") 
    end 
  end
  
   def form_header_physician
      if @physican
         content_tag(:h1, "Create: '#{@physican.name} - #{@physican.email}' ")
      else
         content_tag(:h1, "Create appointment!")
      end
  end

def physician_field_helper(f)
   
   if @physician 
      f.hidden_field :physician_id, value: @physician.id 
    else 
      render partial: "build_physician", locals: {f: f} 
    end 
end

end


