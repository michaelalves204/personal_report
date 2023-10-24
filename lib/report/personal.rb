module Report
  class Personal
    require "date"
    require "json"
    require "fileutils"

    def generate
      puts "enter the name of the project you are working on"
      @project = gets

      puts "enter the task related to the project you are working on"
      @task = gets

      puts "how long did you estimate to do the task ?"
      @estimate = gets

      puts "how long did you spend to deliver the task ?"
      @time_spent = gets

      puts "do you want to describe something about the task?"
      @description = gets

      generate_file
    end

    private

    def hash
      {
        task: task.gsub(/\s+/, ''),
        estimate: estimate.gsub(/\s+/, ''),
        time_spent: time_spent.gsub(/\s+/, ''),
        description: description.gsub(/\s+/, '')
      }
    end
  
    def generate_file
      directory = "personal/#{project.gsub(/\s+/, '')}"

      FileUtils.mkdir_p(directory)
  
      file_path = File.join(directory, "#{task.gsub(/\s+/, '')}.json")
  
      File.open(file_path, "w") do |file|
        file.write(JSON.generate(hash))
      end
    end

    attr_reader :project, :task, :estimate, :time_spent, :description

  end
end