# Slack Answer Bot

> This bot is used on the Slack platform to make questions and their respective answer more efficient.

## Video link
[Loom video](https://www.loom.com/share/aaa2207606d44ef5b6bb023ac9d26429)

## Description
This project was done for the `ruby` capstone
project. It is a Slack bot that searches the channels for a question of a given subject
and returns it to the person asking. Then the person can perform a command to reply to the
question and make a thread. All the information needed to operate the bot is on the Slack workspace
that you can join [here](https://join.slack.com/t/testingpurposesspace/shared_invite/zt-l44ce1o2-zUjLvWxnh_TgLB3JS8VUiQ). 

## Built with
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white)

## Features

### Feature 1:
- Gets the last question of a specific subject and returns to the main channel where you can reply to.

### Feature 2:
- You can reply to the message without leaving the main channel (#answers).

## Usage
- Clone the repo `git clone git@github.com:Leandro-Barretoo/ruby_cap_project.git`
- `cd` into the directory
- Run `git checkout -b feature/initial_proj`
- Run `bundle install`
- Make sure you get your `.env` files configured. The app will not work
  without it.
```json
SLACK_API_TOKEN= token is in the pull request description
```

After cloning the repo and setting up:
Run the bot using the step:
- Run `bin/main.rb`
After that go to the workspace and follow the instructions of pin messages.


## Author
👤 **Leandro-Barretoo**

- GitHub: [@Leandro-Barretoo](https://github.com/Leandro-Barretoo)
- Twitter: [@Leandro74972596](https://twitter.com/Leandro74972596)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/leandro-miguel-gon%C3%A7alves-barreto-7079b11ba/)

## Contributing
Contributions are welcome, and any new features should be built in a
separate branch.

## Acknowledgements
To all the awesome `ruby` gems out there that have made our lives
easier.

## License
Copyright 2021 Leandro Barreto. Licensed under [MIT](https://opensource.org/licenses/MIT)
