class FriendshipStatus < EnumerateIt::Base
  associate_values :pending, :accepted, :rejected

  sort_by :translation
end
