Person.create!(person_id:             1,
               username:              'admin',
               name:                  'admin',
               email:                 'admin@pivotal-board.com',
               password:              'password',
               password_confirmation: 'password',
               image_path:            'http://0.gravatar.com/avatar/3e19295dccfa74209884cf0801dbc9ee',
               admin:                 true)

Setting.create!(unstarted_color: '#fea3aa',
                started_color:   '#f8b88b',
                finished_color:  '#faf884',
                delivered_color: '#baed91',
                impeded_color:   '#b2cefe',
                accepted_color:  '#f2a2e8',
                feature_color:   '#dff0d8',
                chore_color:     '#ffe082',
                bug_color:       '#ffc0cb',
                retro_color:     '#87cefa',
                interval:        5)

Account.create(name: 'Reach', path: 'reach', project_name: 'BGP-Phase-2', project_id: 1_963_535, project_ids: '1963535')
Account.create(name: 'Meteor', path: 'meteor', project_name: 'BGP-Dev-WOG-Productivity', project_id: 1_784_989, project_ids: '1784989')
Account.create(name: 'Constellation', path: 'constellation', project_name: 'BGP-General', project_id: 1_592_917, project_ids: '1592917')
