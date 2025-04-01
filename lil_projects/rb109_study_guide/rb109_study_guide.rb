require 'json'

VALID_MEN_CHOICES = %w(1 2 3 q)

RB109_TOPICS = {
               :variables => [
                 "Variables as pointers",
                 "Variable shadowing",
                 "Local variable scope in relation to method definitions",
                 "Local variable scope in relation to blocks, including nested blocks and peer blocks",
                 "Scope of constants",
                 "Mutating values vs. reassigning variables"
                 ],
               :methods => [
                 "Method definition vs. method invocation",
                 "Passing and using blocks with methods",
                 "Parameters vs. arguments",
                 "Default parameters",
                 "Implicit vs. explicit return values",
                 "Mutating vs. non-mutating methods",
                 "Using method return values as arguments to other methods"
                 ],
               :general => [
                 "Mutable vs. immutable data types",
                 "Output vs. return",
                 "Pass-by-reference vs. pass-by-value",
                 "Truthiness"
               ]
             }

LOG_BOOK = 'logbook.json'

def print_newline
  puts "\n"
end

def random_topic_selector
    puts "Choose a section:"
    puts "    1 - Variables"
    puts "    2 - Methods"
    puts "    3 - General"
    puts "    4 - I'm feeling lucky"
    puts "    Q - Go back"
    section_choice = gets.chomp

    case section_choice
    when '1'
      RB109_TOPICS[:variables].sample
    when '2'
      RB109_TOPICS[:methods].sample
    when '3'
      RB109_TOPICS[:general].sample
    when '4'
      rb109_topics_all = RB109_TOPICS[:variables] + RB109_TOPICS[:methods] + RB109_TOPICS[:general]
      rb109_topics_all.sample
    end
end

def create_a_log(topic)
  answer = ''
  loop do
    if !topic.nil?
      puts "The current topic is: #{topic}" 
      puts "Do you want to log this topic? (y/n)"
      answer = gets.chomp.downcase

      break if answer == 'y' || answer == 'n'
    else
      puts "No topic allocated for this session; log cannot be created!"
      return
    end
  end

  if answer == 'y' && topic.empty?
    puts "Oops! No topic allocated."
  elsif answer == 'n'
    puts "Okay... request cancelled!"
    print_newline
  else
    new_log = {Time.now => topic}
    append_logbook(new_log)
    puts "Log created successfully!"
    print_newline
  end
end

def view_logbook
  file = File.foreach(LOG_BOOK) { |line| puts line }
end

def append_logbook(log)
  File.write(LOG_BOOK, "#{log.to_json}\n", mode: 'a')
end

session_topic = nil

puts "Study Guide for RB109 Exam"

# main menu loop
loop do
  print_newline
  puts "Currently studying: #{session_topic}" if !session_topic.nil? # || !session_topic.empty?
  print_newline
  puts "Hi! What would you like to do today?"
  print_newline
  puts "    1 - View study guide list"
  puts "    2 - Choose random topic"
  puts "    3 - Create a log"
  puts "    4 - View logbook"
  puts "    Q - Quit"
  menu_choice = gets.chomp.downcase

  case menu_choice
  when '1'
    puts "Variables:"
    RB109_TOPICS[:variables].each { |val| puts "- #{val}" }
    print_newline
    puts "Methods:"
    RB109_TOPICS[:methods].each { |val| puts "- #{val}" }
    print_newline
    puts "General:"
    RB109_TOPICS[:general].each { |val| puts "- #{val}" }
  when '2'
    session_topic = random_topic_selector
    puts session_topic
    print_newline
  when '3'
    create_a_log(session_topic)
  when '4'
    view_logbook
    print_newline
  when 'q'
    break
  end
end

puts "Wahoo! Goodbye!"