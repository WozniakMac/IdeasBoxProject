class AddAttachmentPhotoToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :ideas, :photo
  end
end
