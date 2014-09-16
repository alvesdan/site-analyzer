module ApplicationHelper

  def field_error(form, resource, field)
    if resource.errors[field] && resource.errors[field].size > 0
      content_tag 'p', resource.errors[field].first, class: 'help-block'
    end
  end
end
