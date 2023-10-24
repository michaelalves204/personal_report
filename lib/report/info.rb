module Report
  class Info
    require_relative './daily.rb'
    require_relative './personal.rb'

    def generate
      puts "hello, press 1 to generate the dm or 2 for personal report"

      option = gets

      case option.gsub(/\s+/, '')
      when "1"
        daily
      when "2"
        personal
      else
        puts "Error: choose a valid option"
      end
    end

    private

    def daily
      ::Report::Daily.new.generate
    end

    def personal
      ::Report::Personal.new.generate
    end
  end
end

Report::Info.new.generate
