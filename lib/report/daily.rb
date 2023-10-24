module Report
  class Daily
    require "date"
    require "fileutils"

    MD_TITLE = "#### "

    def generate
      puts "enter the description of your tasks for #{yesterday_time}"
      @yesterday_description = gets

      puts "and on #{today_time}"
      @today_description = gets

      puts "report the impediment"
      @impediment = gets

      generate_file
    end

  private

  def today_time
    date = Date.today

    "#{date.day}/#{date.month}"
  end

  def yesterday_time
    date = Date.today - 1

    "#{date.day}/#{date.month}"
  end

  def hash
    {
      yesterday: yesterday_description.gsub(/\s+/, ' '),
      today_description: today_description.gsub(/\s+/, ' '),
      impediment: impediment.gsub(/\s+/, ' ')
    }
  end

  def today_file_name
    date = Date.today

    "#{date.day}_#{date.month}_#{date.year}.md"
  end

  def generate_file
    FileUtils.mkdir_p("dm")

    file_path = File.join("dm", today_file_name)

    File.open(file_path, "a") do |file|
      hash.each do |key, value|
        file.puts "#{MD_TITLE}#{key}"
        file.puts value
      end
    end
  end

  attr_reader :yesterday_description, :today_description, :impediment
  end
end
