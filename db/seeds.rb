# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# rails db:drop db:create db:migrate db:migrate:status
# User.delete_all
# User.destroy_all


start_time = Time.now
##################################################
unless User.first
  user_start = Time.now
  puts "create Users"
  User.create(email: "admin@gmx.de", password: "123123")
  User.create(email: "zwei@gmx.de", password: "123123")
  user_end = Time.now
  puts "#{user_end - user_start} seconds to create Users"
end

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
  pic_elapsed = pic_end - pic_start

  if pic_elapsed > 60
    puts "#{pic_elapsed / 60} minutes to create Pictures"
  else
    puts "#{pic_elapsed} seconds to create Pictures"
  end
end

##################################################
unless Hashtag.first
  hash_start = Time.now
  puts "\ncreate Hashtag"
  CSV.foreach(hashtag, headers: :first_row) do |row|
    Hashtag.create(id: row[0], name: row[1])
  end

  hash_end = Time.now
  hash_elapsed = hash_end - hash_start

  if hash_elapsed > 60
    puts "#{hash_elapsed / 60} minutes to create Hashtag"
  else
    puts "#{hash_elapsed} seconds to create Hashtag"
  end
end

##################################################
unless PicturesHashtag.first
  ph_start = Time.now
  puts "\ncreate PicturesHashtag"
  CSV.foreach(pic_hash, headers: :first_row) do |row|
    PicturesHashtag.create(id: row[0], hashtag_id: row[1], picture_id: row[2])
  end
  ph_end = Time.now
  ph_elapsed = ph_end - ph_start

  if ph_elapsed > 60
    puts "#{ph_elapsed / 60} minutes to create Pictures_Hashtag"
  else
    puts "#{ph_elapsed} seconds to create Pictures_Hashtag"
  end
end

##################################################
puts "create DONE"

ending = Time.now
elapsed = ending - start_time

if elapsed > 60
  puts "#{elapsed / 60} minutes to create all"
else
  puts "#{elapsed} seconds to create all"
end
