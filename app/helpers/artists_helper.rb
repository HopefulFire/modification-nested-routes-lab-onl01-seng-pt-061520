module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, path)
    if song.object.artist && path == 'nested'
      song.hidden :artist_id, value: song.object.artist_id
    else
      song.select :artist_id, Artist.all, id: :name
    end
  end

  def display_name(song, path)
    song.object.artist.name if song.object.artist && path == 'nested'
  end
end
