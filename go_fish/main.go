package main

import (
	"fmt"
	"math/rand"
	"time"
)

const (
	screenWidth  = 80
	screenHeight = 20
)

var fishEmojis = []string{"🐠", "🐟", "🐬", "🦈", "🐋", "🐡", "🐙", "🦑"}

func main() {
	rand.Seed(time.Now().UTC().UnixNano())

	// Create an array to store the positions of each creature
	creatures := make([][2]int, 14)

	// initialize creatures array with random positions
	for i := range creatures {
		creatures[i][0] = rand.Intn(screenWidth)
		creatures[i][1] = rand.Intn(screenHeight)
	}

	for {
		// Clear the screen
		fmt.Print("\033[2J")

		// Draw the creatures
		for i := 0; i < 14; i++ {
			// Move the creatures one space at a time
			move := rand.Intn(4)
			switch move {
			case 0: // move up
				creatures[i][1]--
			case 1: // move down
				creatures[i][1]++
			case 2: // move left
				creatures[i][0]--
			case 3: // move right
				creatures[i][0]++
			}
			// make sure creatures stay in screen
			if creatures[i][0] < 0 {
				creatures[i][0] = 0
			}
			if creatures[i][0] >= screenWidth {
				creatures[i][0] = screenWidth - 1
			}
			if creatures[i][1] < 0 {
				creatures[i][1] = 0
			}
			if creatures[i][1] >= screenHeight {
				creatures[i][1] = screenHeight - 1
			}

			// randomly select a fish emoji from the array
			// What?
			// fish := fishEmojis[rand.Intn(len(fishEmojis))]
			fish := fishEmojis[i%len(fishEmojis)]
			fmt.Print("\033[", creatures[i][1], ";", creatures[i][0], "H", fish)
		}
		// time.Sleep(time.Second / 30)
		time.Sleep(time.Second)
	}
}
