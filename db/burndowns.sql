INSERT INTO burndowns (team, date, unstarted, started, finished, delivered, accepted, created_at, updated_at) VALUES ('bahamut', '2015-07-02', 3, 12, 19, 0, 0, '2015-07-05 04:32:15.970363', '2015-07-05 04:32:15.970363');
INSERT INTO burndowns (team, date, unstarted, started, finished, delivered, accepted, created_at, updated_at) VALUES ('bahamut', '2015-07-03', 0, 13, 21, 0, 0, '2015-07-04 14:16:14.366286', '2015-07-04 14:16:14.366286');
INSERT INTO burndowns (team, date, unstarted, started, finished, delivered, accepted, created_at, updated_at) VALUES ('omega', '2015-07-02', 25, 11, 3, 0, 0, '2015-07-05 03:46:40.847483', '2015-07-05 03:46:40.847483');
INSERT INTO burndowns (team, date, unstarted, started, finished, delivered, accepted, created_at, updated_at) VALUES ('omega', '2015-07-03', 12, 24, 3, 0, 0, '2015-07-05 03:46:40.847483', '2015-07-05 03:46:40.847483');

Burndown.create(team: 'bahamut', date: '2015-07-02', unstarted: 3, started: 12, finished: 19, delivered: 0, accepted: 0)
Burndown.create(team: 'bahamut', date: '2015-07-03', unstarted: 0, started: 13, finished: 21, delivered: 0, accepted: 0)
Burndown.create(team: 'omega', date: '2015-07-02', unstarted: 25, started: 11, finished: 3, delivered: 0, accepted: 0)
Burndown.create(team: 'omega', date: '2015-07-03', unstarted: 12, started: 24, finished: 3, delivered: 0, accepted: 0)
