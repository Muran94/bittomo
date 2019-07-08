module Seedbank
  class Runner
    def evaluate(seed_task, seed_file)
      @_seed_task = seed_task
      instance_eval(File.read(seed_file), seed_file)
      puts %(\e[36mCompleted seeding!\e[0m #{seed_file})
    rescue => e
      puts %(\n\e[31mError occured! #{e}\e[0m)
      puts %(Error occured in ... #{seed_file}\n)
      puts %(Showing backtrace ... \n)
      puts %(#{e.backtrace.join("\n")}\n\n)
    end
  end
end
