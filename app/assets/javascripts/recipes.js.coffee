# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# On document ready
$ -> 
  # Attach submit handler to recipe submit button
  # since we moved the button out of the form
  # for added sickness
  $('#recipe-submit').click ->
    $('form.edit_recipe, form.new_recipe').submit()

  # Attach remove handlers
  $('a.remove-link').each ->
    $(this).live('click', window.AddAnother.removeFields)

# Create an object to store all of our sweet javascripting
window.AddAnother =

  # Format output string
  Display:
    # Initialized output string
    str: ''
    # Concat the values of slug onto our output string
    # unless the value of slug is nothing
    build: (slug) ->
      unless slug.val() == ''
        # Don't add a space before the unit of measurement slug
        this.str += ' ' unless slug.attr('id') == 'unit'
        this.str += slug.val()

        switch(slug.attr('id'))
          # When we are on numerator than add a slash
          when 'numerator' then this.str += ' /'
    slugs: {}
    reset: ->
      this.slugs.each ->
          if $(this).val() != ''
            $(this).val('') 
            
        $(this).find('option:first').attr('selected', 'selected').parent('select')
        
      this.str = ''

  # Remove an item
  # Does so by looking at the id of the clicked link.  
  # Its id is a combination of recipe property type and unique indexing #
  removeFields: (e) ->
    e.preventDefault()
    pieces = $(this).attr('id').split('-')

    # Left side is the recipe property type
    property = pieces[0]

    # Right side is the recipe property unique index
    index = '_' + pieces[1]

    # Set the corresponding destroy hidden field to a value of 1
    # We do this by finding the containing fieldset, finding the
    # div with a class of .fields which contains the hidden inputs
    $('fieldset.' + property + 's' + ' .fields input').each ->
      # Search for the hidden field used for destruction
      # that also has the correct unique index
      reg1 = new RegExp(/destroy/)
      reg2 = new RegExp(index)
      id = $(this).attr('id')
      # If we find it, set its value to 1 for destruction 
      if id.match(reg1) && id.match(reg2)
        $(this).val("1")

    # Remove the data field form the list
    $(this).closest('li').fadeOut ->
      $(this).remove()

  # Add a recipe property to a recipe
  addFields: (link, association, content) ->
    # Use time to generate a unique index id
    new_id = new Date().getTime()
    regexp = new RegExp("new_" + association, "g")

    # Take replace the html passed into content with
    # the unique index generated previously and insert it
    # before the clicked link
    $(link).before(content.replace(regexp, new_id))

    # Gather hidden inputs added in previous step into a collection
    $hidden = $(link).prev().children("input")

    # Get the slugs as a collection
    this.Display.slugs = $slugs = $(link).siblings('div.slug-fields').children('div').children(':text, select, textarea')

    str = ''

    # Iterate slugs
    $slugs.each () ->
      slug_id = $(this).attr('id')

      # Look for a match between the slug id
      # and the hidden fields id
      reg = new RegExp(slug_id)
      slug = $(this)
      $hidden.each ->
        h_id = $(this).attr('id')

        # If we find a match, set the hidden fields
        # value to that of the slug
        if h_id.match(reg)
          $('#' + h_id).val(slug.val())

          # Add the value of the slugs to what
          # will be output in our recipe display
          window.AddAnother.Display.build(slug)
          
    id_section_singular = $(link).siblings('div.slug-fields').attr('id').replace('-slugs', '')
    id_section = $(link).siblings('div.slug-fields').attr('id').replace('-slugs', 's')
    remove_link = '<a class="remove-link" id=' + id_section_singular + '-' + new_id + '>Remove</a>'
    $list = $('.' + id_section + ' > ul, .' + id_section + ' > ol')
    $list_item = $('<li>' + window.AddAnother.Display.str + ' ' + remove_link + '</li>').hide()
    $list.append($list_item)
    $li = $list.children('li').last().fadeIn()
    $li.children('a').each ->
      $(this).live('click', window.AddAnother.removeFields)

    this.Display.reset()
