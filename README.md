# Pivotal-Board
[![Build Status](https://travis-ci.org/strengthandwill/pivotal-board.svg?branch=master)](https://travis-ci.org/strengthandwill/pivotal-board)

Automatically generate the following from your Pivotal Tracker Project:
* Scrum Sprint Board
* Scrum Sprint Burndown Chart

## Configuration

Put pivotal_api_account_id and pivotal_api_project_id in quotes as they are numbers.

**application.yml**
```
pivotal_api_url:        https://www.pivotaltracker.com/services/v5
pivotal_api_token:      your_pivotal_tracker_token
pivotal_api_account_id: your_pivotal_tracker_account_id
pivotal_api_project_id: your_pivotal_tracker_project_id
people_images_dir_url:  your_team_member_images_directory_url
```

When deploying to Heroku, run the following command to set the settings in production.

```
$ figaro heroku:set -e production
```

## Scrum Sprint Board

Displays user stories, chores and bugs of the current Iteration in Pivotal Tracker project 
as a Scrum Sprint Board to improve the visualisation of the work of the current Sprint to 
the working team. 

Following columns to represent the various stages in Pivotal Tracker

1. DEV To Do       -> Unstarted or Rejected in Pivotal Tracker
2. DEV In Progress -> Started in Pivotal Tracker
3. QE Testing      -> Finished in Pivotal Tracker
4. PO Acceptance   -> Delivered in Pivotal Tracker
5. Done            -> Accepted in Pivotal Tracker

Following colors to represent the various type of stories in Pivotal Tracker

1. Green          -> User Story
2. Yellow         -> Chore
3. Red            -> Bug
4. Flashing Green -> Rejected User Story

![Sprint Scrum Board][scrum-board]

## Scrum Sprint Burndown

Displays the progress of the current Iteration in Pivotal Tracker project for the working team 
as a Scrum Sprint Burndown, so that the working team know the progress and make any changes
if necessary.

1. DEV To Do       -> Aqua
2. DEV In Progress -> Red
3. QE Testing      -> Green
4. PO Acceptance   -> Dark blue
5. Done            -> Blue

![Sprint Burndown Chart][sprint-burndown]

## Additional Information

* Pivotal API v5 Help: https://www.pivotaltracker.com/help/api/rest/v5

## Contact Us

* Email us @ <poh_kah_kong@ida.gov.sg>

[scrum-board]: ./app/assets/images/scrum-board.png
[sprint-burndown]: ./app/assets/images/sprint-burndown.png