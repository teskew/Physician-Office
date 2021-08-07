module PhysiciansHelper

def brand_fields(f) 

    if @physician
         f.hidden_field :physician_id, value: @physician.id 
    else 
         render partial: "physician_fields", locals: { f: f } 
    end 
end
end