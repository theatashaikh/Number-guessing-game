# Number Guessing Game

## Project Description

This project is the fifth and final task in the Relational Database Certification provided by freeCodeCamp.org. It involves creating a Bash script that implements a number guessing game, integrated with a PostgreSQL database to store user information and game statistics.

## Project Tasks

To complete this project, the following tasks were accomplished:

1. Created a `number_guessing_game` folder in the project directory.
2. Created `number_guess.sh` in the `number_guessing_game` folder and gave it executable permissions.
3. Added a shebang (`#!/bin/bash`) at the top of the script file.
4. Initialized the `number_guessing_game` folder as a git repository.
5. Made at least five commits to the git repository.
6. Implemented a script that randomly generates a number for users to guess.
7. Created a `number_guess` database to store user information and game statistics.
8. Established a connection to the database using a PSQL variable in the script.
9. Implemented user input prompts for username and guesses.
10. Created logic to handle new and returning users differently.
11. Implemented the game loop with appropriate feedback for each guess.
12. Added input validation to ensure only integer guesses are accepted.
13. Updated the database with games played and best game statistics after each game.
14. Ensured the script output matches exactly what is described in the user stories.

## Features

- Generates a random number between 1 and 1000 for users to guess
- Stores user information and game statistics in a PostgreSQL database
- Welcomes returning users with their game history (games played and best game)
- Provides feedback on each guess (higher/lower)
- Validates user input to ensure only integer guesses are accepted
- Tracks the number of guesses for each game
- Updates the user's best game (least number of guesses) in the database
- Supports usernames up to 22 characters long

## Requirements

- Bash
- PostgreSQL
- psql (PostgreSQL interactive terminal)

## Installation

1. Clone the repository:

```
git clone https://github.com/your-username/number-guessing-game.git
cd number-guessing-game
```

2. Set up the PostgreSQL database:

```
psql -U postgres < number_guess.sql
```

3. Make the script executable:

```
chmod +x number_guess.sh
```

## Usage

Run the script with:

```
./number_guess.sh
```

Follow the prompts to:

1. Enter your username
2. Start guessing the secret number between 1 and 1000
3. Receive feedback on each guess
4. Continue guessing until you find the correct number

## Database Schema

The `number_guess` database contains a `users` table with the following columns:

- `username` (varchar): The user's username (up to 22 characters)
- `games_played` (integer): The total number of games played by the user
- `best_game` (integer): The least number of guesses taken to win a game

## Script Structure

The `number_guess.sh` script follows this general structure:

1. Establishes a connection to the PostgreSQL database
2. Prompts the user for a username
3. Checks if the user exists in the database
   - If new user: Welcomes them and inserts a new record
   - If returning user: Welcomes them back with their game history
4. Generates a random number between 1 and 1000
5. Implements the guessing game logic:
   - Prompts for guesses
   - Provides feedback (higher/lower)
   - Validates input for integer guesses
   - Counts the number of tries
6. When the correct number is guessed, congratulates the user
7. Updates the database with the game results:
   - Increments the games_played count
   - Updates the best_game if applicable

## Development Process

The project was developed incrementally, with at least five git commits marking significant stages of progress. The development process focused on meeting all the specified user stories while ensuring clean and efficient code.

## Testing

The script was thoroughly tested to ensure it meets all the specified requirements, including edge cases such as:

- New vs. returning users
- Input validation for non-integer guesses
- Correct updating of game statistics in the database

## Contributing

This project is part of a certification course, however if someone want's to make a contribution it is open for contributions. You're welcome to fork the repository and modify it for your own learning purposes.

## License

This project is released under the MIT License. See the LICENSE file for details.

## Acknowledgements

`freeCodeCamp.org` for providing the project requirements and learning resources

## Additional Notes

- If you need to save your database for portability or submission, you can use the following command to create a SQL dump:

```
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
```
