class State < EnumerateIt::Base
  associate_values :active, :inactive, :deleted

  sort_by :translation
end
