import random

def play_rock_paper_scissors():
    answer = input('What is your guess? ').lower()
    item = ['rock', 'paper', 'scissors']
    a = random.choice(item)

    if answer == a:
        print("It's a tie!")
    elif answer == "rock":
        if a == 'scissors':
            print("Rock smashes scissors.")
            print('You win!')
        else:
            print('Paper swallows rock.')
            print('You lose!')
    elif answer == "scissors":
        if a == "paper":
            print("You win! Scissors cuts paper.")
        else:
            print('You lose! Rock breaks scissors.')
    elif answer == "paper":
        if a == "rock":
            print("You win! Paper swallows rock.")
        else:
            print('You lose! Scissors cuts paper.')
    else:
        print("I have no idea.")

# Call the function to play the game
play_rock_paper_scissors()
