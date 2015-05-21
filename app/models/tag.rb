class Tag < ActsAsTaggableOn::Tag

  def count
    taggings_count
  end

  def contributors
    ActsAsTaggableOn::Tagging.all
      .where('tag_id = ?', id)
      .where('"taggings".tagger_id > 0')
  end
end
