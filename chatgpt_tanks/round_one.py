"""
As ChatGPT generated it. Works in Windows Terminal.
"""
import os
import time
import random

# Function to clear the console
def clear():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')

# Fish characters
fish = ["🐟", "🐠", "🦈", "🐙", "🐋"]

# Infinite loop to display the animation
while True:
    clear()
    # Prints the ocean
    print(" ".join(["🌊" for x in range(40)]))
    # Prints the fish at random positions
    for i in range(5):
        x = random.randint(0, 39)
        print(" " * x + fish[i])
    time.sleep(0.2)
