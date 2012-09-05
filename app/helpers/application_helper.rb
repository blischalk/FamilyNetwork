module ApplicationHelper
  def link_to_remove(property)
    link_to('Remove', "#", class: "remove-link", id: "#{property}") unless params[:action] == 'show'
  end

  # This method has been written to be abstract in that
  # It creates fields of a type that belongs to an association by a similar name
  # Ex. creates a Tool object for a ToolAssociation or a Ingredient for a IngredientAssociation
  # @param name Name to use for the link to add a field
  # @param f the form
  # @param association symbol of the association fields will be created for
  def link_to_add_fields(name, f, association)
    # Create an association object from the passed in association symbol and form
    association_object = f.object.class.reflect_on_association(association).klass.new

    # Create a new object of type that is associated
    # to the association object and has a name that is found within the association objects name
    # i.e create a Tool object for a ToolAssociation object

    # First get an array of all the belongs_to associations of the assocation object
    associated_objects = association_object.class.reflect_on_all_associations(:belongs_to)

    # Get the association_object's name as a string
    association_name = association_object.class.name

    # Iterate over the associated objects that are associated with this association object
    associated_objects.each do |object|

      # If our associated object name is a substring of the association name (e.g Ingredient is substring of IngredientAssociation)
      # Then we want to create an instance of that object to send back to the client
      if association_name.downcase.include? object.name.to_s
        #dyn_obj = eval(object.name.to_s.capitalize + ".new") if str.downcase.include? object.name.to_s
        dyn_name = object.name.to_s.capitalize
        dyn_obj = dyn_name.constantize.new
        association_object.send("#{object.name.to_s}=", dyn_obj)
      end
    end

    # Create a string of fields that will be passed to our javascript
    fields = f.fields_for(association, association_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    link_to_function(name, "window.AddAnother.addFields(this, '#{association}', '#{escape_javascript(fields)}')", class: 'btn')
  end
end
