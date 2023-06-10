import random

answer = input('what is your guess? ').lower()
item = ['rock', 'paper', 'scissors']
a = random.choice(item)

if answer == item:
    print("it is a tie")
elif answer == "rock":
    if a == 'scissors':
        print("rock smashes scissors")
        print('you win')
    else:
        print('paper swallows rock')
        print('you loose')
elif answer == "scissors":
    if a == "paper":
        print("you win, scissors cuts paper")
    else:
        print('you loose, rock breaks scissors')
elif answer == "paper":
    if a == "rock":
        print("you win, paper swallows rock")
    else:
        print('you loose, scissors cuts paper')
else:
    print("i have no idea")
