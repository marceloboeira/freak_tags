class Role < EnumerateIt::Base
  associate_values :guest, :regular, :contributor, :moderator, :developer, :root

  sort_by :translation
end
