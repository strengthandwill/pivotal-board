require 'rails_helper'
require_relative '../../app/models/backlog.rb'

RSpec.describe Backlog, type: :model do
  describe 'backlog' do
    project_id = '19970712'
    project_name = 'Princess Mononoke'
    team = ''
    requester_id = '1140911'
    owner_id = '1163193'
    owners = []
    owners << Person.create(person_id: owner_id)

    stories = [
      {
        'kind': 'story',
        'id': 111,
        'project_id': project_id,
        'name': 'The attack of the demon',
        'description': 'In Muromachi Japan, an Emishi village is attacked by a demon...',
        'story_type': 'bug',
        'current_state': 'delivered',
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [],
        'created_at': '2018-05-07T02:53:54Z',
        'updated_at': '2018-05-23T10:01:36Z',
        'url': 'https://www.pivotaltracker.com/story/show/111'
      },
      {
        'kind': 'story',
        'id': 222,
        'project_id': project_id,
        'name': 'Friend and foe',
        'description': 'Heading west, Ashitaka meets Jigo, a wandering monk...',
        'story_type': 'chore',
        'current_state': 'started',
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [],
        'created_at': '2018-05-10T09:07:24Z',
        'updated_at': '2018-05-23T09:40:05Z',
        'url': 'https://www.pivotaltracker.com/story/show/222'
      },
      {
        'kind': 'story',
        'id': 2222,
        'project_id': project_id,
        'name': 'Conflicts',
        'description': 'Ashitaka learns that Eboshi built the town by clearcutting forests...',
        'story_type': 'chore',
        'current_state': 'started',
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [
          {
            'kind': 'label',
            'id': 1852,
            'project_id': project_id,
            'name': 'mr',
            'created_at': '2017-05-29T01:54:26Z',
            'updated_at': '2017-05-29T01:54:26Z'
          }
        ],
        'created_at': '2018-05-10T09:07:24Z',
        'updated_at': '2018-05-23T09:40:05Z',
        'url': 'https://www.pivotaltracker.com/story/show/2222'
      },
      {
        'kind': 'story',
        'id': 333,
        'project_id': project_id,
        'name': 'Knock knock',
        'description': 'San infiltrates Irontown to kill Eboshi, but Ashitaka intervenes, knocking them both unconscious...',
        'story_type': 'feature',
        'current_state': 'unstarted',
        'estimate': 2,
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [
          {
            'kind': 'label',
            'id': 1852,
            'project_id': project_id,
            'name': 'apply job',
            'created_at': '2017-05-29T01:54:26Z',
            'updated_at': '2017-05-29T01:54:26Z'
          }
        ],
        'created_at': '2018-04-11T05:18:17Z',
        'updated_at': '2018-05-17T04:01:29Z',
        'url': 'https://www.pivotaltracker.com/story/show/333'
      },
      {
        'kind': 'story',
        'id': 444,
        'project_id': project_id,
        'name': 'The cure and curse',
        'description': 'Ashitaka recovers from his wound but remains cursed...',
        'story_type': 'feature',
        'current_state': 'finished',
        'estimate': 2,
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id],
        'labels': [
          {
            'kind': 'label',
            'id': 1811,
            'project_id': project_id,
            'name': 'mr',
            'created_at': '2017-05-29T01:54:26Z',
            'updated_at': '2017-05-29T01:54:26Z'
          }
        ],
        'created_at': '2018-05-16T08:11:23Z',
        'updated_at': '2018-05-25T07:47:00Z',
        'url': 'https://www.pivotaltracker.com/story/show/444'
      },
      {
        'kind': 'story',
        'id': 555,
        'project_id': project_id,
        'name': 'The return of the Jigo',
        'description': 'Ashitaka and San pursue Jigo and retrieve the head, returning it to the Forest Spirit...',
        'story_type': 'feature',
        'current_state': 'accepted',
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [],
        'created_at': '2018-05-10T09:01:41Z',
        'updated_at': '2018-05-16T00:40:17Z',
        'url': 'https://www.pivotaltracker.com/story/show/555'
      },
      {
        'kind': 'story',
        'id': 666,
        'project_id': project_id,
        'name': 'The End',
        'description': 'And they live happily ever after...',
        'story_type': 'feature',
        'current_state': 'accepted',
        'estimate': 13,
        'requested_by_id': requester_id,
        'owned_by_id': owner_id,
        'owner_ids': [
          owner_id
        ],
        'labels': [
          {
            'kind': 'label',
            'id': 6661,
            'project_id': project_id,
            'name': 'perpetual',
            'created_at': '2017-05-29T01:54:26Z',
            'updated_at': '2017-05-29T01:54:26Z'
          }
        ],
        'created_at': '2018-04-11T05:18:17Z',
        'updated_at': '2018-05-17T04:01:29Z',
        'url': 'https://www.pivotaltracker.com/story/show/666'
      }
    ]

    backlog_params = JSON.parse({ 'start': '2018-01-01', 'finish': '2018-06-01', stories: stories }.to_json)
    stories_with_analytics = []

    subject = Backlog.new(backlog_params, project_id, project_name, team, owners, stories_with_analytics)

    it 'should be valid' do
      expect(subject).to be_valid
    end

    it 'should contain different states of stories' do
      expect(subject.unstarted_stories.count).to eq(1)
      expect(subject.started_stories.count).to eq(1)
      expect(subject.finished_stories.count).to eq(1)
      expect(subject.delivered_stories.count).to eq(1)
    end

    it 'should contain 1 merge_request story, #mr label should be applicable to started stories only' do
      expect(subject.merge_request_stories.count).to eq(1)
    end

    it 'should have total of 7 stories, the 7th is labeled as perpetual' do
      expect(subject.stories.count).to eq(7)
      expect(subject.accepted_stories.count).to eq(1)
    end
  end
end
