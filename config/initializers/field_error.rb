ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  if html_tag =~ /<(input|textarea|select|label)[^>]+class=/
    class_attribute = html_tag =~ /class=['"]/
    html_tag.insert(class_attribute + 7, "has-error ")
  elsif html_tag =~ /<(input|textarea|select|label)/
    first_whitespace = html_tag =~ /\s/
    html_tag[first_whitespace] = " class='has-error' "
  end
  html_tag
end
