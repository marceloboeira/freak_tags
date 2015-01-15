class Sex < EnumerateIt::Base
  associate_values :male, :female

  sort_by :translation
end
