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

all_start = Time.now

def clear_storage
  require "fileutils"
  FileUtils.rm_rf("storage/.")
end

def elapsed_time(start_time, end_time, name)
  elapsed = end_time - start_time

  if elapsed > 60
    puts "#{(elapsed / 60).round(2)} minutes to #{name}"
  else
    puts "#{elapsed.round(2)} seconds to #{name}"
  end
end

##################################################
# read CSV
unless defined?(picture)
  puts "\nread CSV"
  require "csv"
  picture = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_Bilder.csv"
  hashtag = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_hashs.csv"
  pic_hash = "/home/conrad/workbench/temp/Sammlung.csv/Sammlung_table_bilder_hashs.csv"
end
##################################################
unless User.first
  user_start = Time.now
  puts "\ncreate Users"
  User.create(email: "admin@gmx.de", password: "123123")
  User.create(email: "zwei@gmx.de", password: "123123")
  user_end = Time.now
  elapsed_time(user_start, user_end, "create Users")
end
##################################################
# import jpg (17009)
unless ActiveStorage::Blob.first
  import_start = Time.now
  clear_storage
  puts "\nimport jpg"

  path = Dir["/home/conrad/workbench/Datenbank.Esche.Sammlung/docker-compose-lamp/www/sl_Esche/L/**/*.jpg"]

  @user = User.first
  path.take(2000).each_with_index do |row, idx|
    File.open(row) do |file|
      @user.pictures.attach(io: file, filename: "%05d" % (idx + 1) + ".jpg")
    end
  end

  # counter = 1
  # path.take(50).each do |row|
  #   User.first.pictures.attach(io: File.open(row), filename: "%05d" % counter + ".jpg")
  #   counter += 1
  #   # puts counter
  #   # if steps.include?(counter)
  #   #   sleep 5
  #   #   puts ActiveStorage::Blob.count
  #   #   sleep 10
  #   # end
  # end

  import_end = Time.now
  elapsed_time(import_start, import_end, "import jpg to ActiveStorage")
end

##################################################
# add Picture (17009) to table
unless Picture.first
  pic_start = Time.now
  puts "\ncreate Pictures DB"

  CSV.foreach(picture, headers: :first_row) do |row|
    Picture.create(id: row[0], path: row[1], user_id: 1)
  end

  pic_end = Time.now
  elapsed_time(pic_start, pic_end, "feed Pictures to DB")
end
##################################################
# add Hashtag to table
unless Hashtag.first
  hash_start = Time.now
  puts "\ncreate Hashtag"
  CSV.foreach(hashtag, headers: :first_row) do |row|
    Hashtag.create(id: row[0], name: row[1])
  end

  hash_end = Time.now
  elapsed_time(hash_start, hash_end, "feed Hashtags to DB")
end
##################################################
# add PicturesHashtag (41568) to table
unless PicturesHashtag.first
  ph_start = Time.now
  puts "\ncreate PicturesHashtag"
  CSV.foreach(pic_hash, headers: :first_row) do |row|
    PicturesHashtag.create(hashtag_id: row[1], picture_id: row[2])
    # PicturesHashtag.create(id: row[0], hashtag_id: row[1], picture_id: row[2])
  end
  ph_end = Time.now
  elapsed_time(ph_start, ph_end, "feed Pictures_Hashtag joins table to DB")
end
##################################################

##################################################
##################################################
##################################################
puts "\nAll seeds DONE"
all_ending = Time.now
elapsed_time(all_start, all_ending, "create all seeds")
