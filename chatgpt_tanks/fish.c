#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

#define MAX_X 30
#define MAX_Y 30

int main() {
    // Initialize the fish positions
    int fish1x = 5, fish1y = 5;
    int fish2x = 10, fish2y = 10;
    int fish3x = 15, fish3y = 15;

    // Initialize random seed
    srand(time(NULL));

    while (1) {
        // Clear the console
        printf("\033[2J");

        // Draw the fish
        printf("\033[%d;%dH🐠", fish1y, fish1x);
        printf("\033[%d;%dH🐟", fish2y, fish2x);
        printf("\033[%d;%dH🦈", fish3y, fish3x);

        // Draw the waves
        printf("\033[%d;%dH🌊", 20, 20);
        printf("\033[%d;%dH🌊", 21, 21);
        printf("\033[%d;%dH🌊", 22, 22);

        // Move the fish
        fish1x += rand() % 3 - 1;
        fish1y += rand() % 3 - 1;
        if (fish1x < 0 || fish1x > MAX_X || fish1y < 0 || fish1y > MAX_Y) {
            fish1x = 5;
            fish1y = 5;
        }

        fish2x += rand() % 3 - 1;
        fish2y += rand() % 3 - 1;
        if (fish2x < 0 || fish2x > MAX_X || fish2y < 0 || fish2y > MAX_Y) {
            fish2x = 10;
            fish2y = 10;
        }

        fish3x += rand() % 3 - 1;
        fish3y += rand() % 3 - 1;
        if (fish3x < 0 || fish3x > MAX_X || fish3y < 0 || fish3y > MAX_Y) {
            fish3x = 15;
            fish3y = 15;
        }

        // Wait for 1 second
        sleep(1);
    }
    return 0;
}
