# Pivotal-Board

## Features

Automatically generate the following from your Pivotal Tracker Project:
* Scrum Sprint Board
* Scrum Sprint Burndown Chart

## Configuration

```
bundle
cp config/application.example.yml config/application.yml
rake db:setup
rails s
```

Put PIVOTAL_API_ACCOUNT_ID and PIVOTAL_API_PROJECT_ID in quotes as they are numbers.
**application.yml**
```
PIVOTAL_API_URL:        https://www.pivotaltracker.com/services/v5
PIVOTAL_API_TOKEN:      your_pivotal_tracker_token
PIVOTAL_API_ACCOUNT_ID: your_pivotal_tracker_account_id
PIVOTAL_API_PROJECT_ID: your_pivotal_tracker_project_id
PEOPLE_IMAGES_DIR_URL:  your_team_member_images_directory_url
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

## Scrum Sprint Burndown

Displays the progress of the current Iteration in Pivotal Tracker project for the working team 
as a Scrum Sprint Burndown, so that the working team know the progress and make any changes
if necessary.

1. DEV To Do       -> Aqua
2. DEV In Progress -> Red
3. QE Testing      -> Green
4. PO Acceptance   -> Dark blue
5. Done            -> Blue

## Additional Information

* Pivotal API v5 Help: https://www.pivotaltracker.com/help/api/rest/v5