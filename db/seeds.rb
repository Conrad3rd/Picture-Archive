# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# rails db:drop db:create db:migrate db:seed db:migrate:status
# User.delete_all
# User.destroy_all
def elapsed_time(start_time, end_time, name)
  elapsed = end_time - start_time

  if elapsed > 60
    puts "#{(elapsed / 60).round(2)} minutes to create #{name}"
  else
    puts "#{elapsed.round(2)} seconds to create #{name}"
  end
end

all_start = Time.now
##################################################
unless User.first
  user_start = Time.now
  puts "create Users"
  User.create(email: "admin@gmx.de", password: "123123")
  User.create(email: "zwei@gmx.de", password: "123123")
  user_end = Time.now
  elapsed_time(user_start, user_end, "Users")
end

##################################################
pic_start = Time.now

User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000001.jpg"), filename: "u1 img_01")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000002.jpg"), filename: "u1 img_02")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000003.jpg"), filename: "u1 img_03")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000004.jpg"), filename: "u1 img_04")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000005.jpg"), filename: "u1 img_05")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000006.jpg"), filename: "u1 img_06")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000007.jpg"), filename: "u1 img_07")
User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000008.jpg"), filename: "u1 img_08")

User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000001.jpg"), filename: "u2 img_01")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000002.jpg"), filename: "u2 img_02")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000003.jpg"), filename: "u2 img_03")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000004.jpg"), filename: "u2 img_04")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000005.jpg"), filename: "u2 img_05")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000006.jpg"), filename: "u2 img_06")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000007.jpg"), filename: "u2 img_07")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000008.jpg"), filename: "u2 img_08")
User.last.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000009.jpg"), filename: "u2 img_09")



# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000001.jpg"), filename: "u1 img_01")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000002.jpg"), filename: "u1 img_02")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000003.jpg"), filename: "u1 img_03")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000004.jpg"), filename: "u1 img_04")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000005.jpg"), filename: "u1 img_05")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000006.jpg"), filename: "u1 img_06")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000007.jpg"), filename: "u1 img_07")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000008.jpg"), filename: "u1 img_08")
# User.first.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000009.jpg"), filename: "u1 img_09")

# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000001.jpg"), filename: "u2 img_01")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000002.jpg"), filename: "u2 img_02")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000003.jpg"), filename: "u2 img_03")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000004.jpg"), filename: "u2 img_04")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000005.jpg"), filename: "u2 img_05")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000006.jpg"), filename: "u2 img_06")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000007.jpg"), filename: "u2 img_07")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000008.jpg"), filename: "u2 img_08")
# User.last.uploads.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_05/00000009.jpg"), filename: "u2 img_09")

# User.first.pictures.attach(io: File.open("/home/conrad/Dropbox/Dokumente/Linux/howto/rails/img_import/files/SLGE/M/Slg.01/1-5.Kasten_02/00000009.jpg"), filename: "u1 img_09")
pic_end = Time.now
elapsed_time(pic_start, pic_end, "Pictures import to ActiveStorage")

##################################################
unless Picture.first
  pic_start = Time.now
  require "csv"
  picture = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_Bilder.csv"
  hashtag = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_hashs.csv"
  pic_hash = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_bilder_hashs.csv"

  ##################################################
  puts "\ncreate Pictures"

  CSV.foreach(picture, headers: :first_row) do |row|
    Picture.create(id: row[0], path: row[1], user_id: 1)
  end

  pic_end = Time.now
  elapsed_time(pic_start, pic_end, "Pictures")
end

##################################################
unless Hashtag.first
  hash_start = Time.now
  puts "\ncreate Hashtag"
  CSV.foreach(hashtag, headers: :first_row) do |row|
    Hashtag.create(id: row[0], name: row[1])
  end

  hash_end = Time.now
  elapsed_time(hash_start, hash_end, "Hashtags")
end

##################################################
unless PicturesHashtag.first
  ph_start = Time.now
  puts "\ncreate PicturesHashtag"
  CSV.foreach(pic_hash, headers: :first_row) do |row|
    PicturesHashtag.create(id: row[0], hashtag_id: row[1], picture_id: row[2])
  end
  ph_end = Time.now
  elapsed_time(ph_start, ph_end, "Pictures_Hashtag joins table")
end

##################################################
puts "\nAll seeds DONE"
all_ending = Time.now
elapsed_time(all_start, all_ending, "All seeds")
