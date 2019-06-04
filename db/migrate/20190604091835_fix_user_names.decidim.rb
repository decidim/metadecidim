# frozen_string_literal: true
# This migration comes from decidim (originally 20190412131728)

class FixUserNames < ActiveRecord::Migration[5.2]
  def change
    # Comes from Decidim::User specs
    weird_characters =
      ["<", ">", "?", "\\%", "&", "^", "*", "#", "@", "(", ")", "[", "]", "=", "+", ":", ";", "\"", "{", "}", "\\", "|", "/"]
    characters_to_remove = "<>?%&^*\#@()[]=+:;\"{}\\|/"

    weird_characters.each do |character|
      Decidim::UserBaseEntity.where("name like '%#{character}%' escape '\' OR nickname like '%#{character}%' escape '\'").find_each do |entity|
        entity.name = entity.name.delete(characters_to_remove).strip
        entity.nickname = entity.nickname.delete(characters_to_remove).strip
        entity.save!(validate: false)
      end
    end
  end
end
