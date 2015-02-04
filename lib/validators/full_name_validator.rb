class FullNameValidator < ActiveModel::EachValidator
  # Based on -> http://stackoverflow.com/questions/2629422/rails-validating-full-name
  def validate_each(record, attribute, value)
    unless value =~ /\A[^0-9`!@#\$%\^&*+_=]+\z/
      record.errors[attribute] << (options[:message] || "is not an valid name")
    end
  end
end


