fish = []
sea_creatures = ["🐠", "🐟", "🐬", "🦈", "🦑", "🐙"]
14.times do |i|
    fish[i] = {x: rand(1..30), y: rand(1..30), type: sea_creatures.sample}
end

loop do
    # system "clear" # clear the console
    # wasn't clearing?
    system("clear") || system("cls")
    fish.each do |f|
        print "\e[#{f[:y]};#{f[:x]}H#{f[:type]}"
    end
    print "\e[20;20H🌊\n" * 3 #draw waves
    fish.each do |f|
        f[:x] += rand(-1..1)
        f[:y] += rand(-1..1)
    end
    sleep 1 # wait for 1 second
end
