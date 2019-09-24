require 'date'
def get_date(name)
  begin
    date = Date.parse(name)
  rescue ArgumentError => exception
    date = DateTime.now
  end
  date
end

class LoadNotesFromHost < ActiveRecord::Migration[6.0]
  def up
    # TODO make this load from a config...
    notes = Dir["/home/ersin/Code/ersin/notes/*"]
    owner_id = "auth0|5d659fdc4015a90dc4040f52" # ersinbuckley@gmail.com user
    notes.each do |path|
      name = path.split('/').last
      File.open(path) do |f|
        Article.create(owner_id: owner_id, title: name, text:f.read, updated_at: get_date(name))
      end
    end
  end
  def down
    raise "No down migration supported at this stage...!"
  end
end
