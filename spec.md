# Election Night

## Data Entities
### Candidate
```json
{
  "id": 1,
  "name": "Trump",
  "image_url": "http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg",
  "intelligence":0,
  "charisma":5,
  "willpower":9
}
```

### Campaign
```json
{
  "id": 23,
  "start_at":"datetime",
  "winning_candidate": 2,
  "candidate_one_id":1,
  "candidate_two_id":2,
}
```

## Endpoints

### GET /api/candidates
  Return a collection of candidate objects
#### Request

#### Response
```json
[
  {candidate},
  {candidate}
]
```
### GET /api/campaigns
  Return a collection of campaign objects
#### Request

#### Response
```json
[
  {campaign},
  {campaign}
]
```

### POST /api/campaigns
  Create a new campaign object
#### Request
```json
{
  "candidate_ids": [3,23]
}
```

#### Response
```json
{campaign}
```

### POST /api/candidates
  Create a new candidate object
#### Request
```json
{
  "name": "Trump",
  "image_url": "http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg",
  "intelligence":0,
  "charisma":5,
  "willpower":9
}
```
#### Response
```json
{candidate}
```

### GET /api/candidates/:candidate_id
  Get a specific candidate object, with campaign history
#### Request
In Path
candidate_id: integer

#### Response
```json
{
  candidate,
  "number_of_won_campaigns": 12
  "campaigns": [
    {campaign},
    {campaign}
  ]
}
```

### PATCH /api/candidates/:candidate_id
Update a specific candidate object
#### Request
In Path
candidate_id: integer

```json
{
  "willpower":100
}
```
#### Response
```json
{candidate}
```

### DELETE /api/candidates/:candidate_id
  Return a collection of candidate objects
#### Request
In Path
candidate_id: integer

#### Response
status code for deletion? 204
```json
  {candidate}
```
### GET /api/candidates/:candidate_id/campaigns
  Return a collection of campaign objects for a candidate
#### Request
In Path
candidate_id: integer

#### Response
```json
[
  {campaign},
  {campaign}
]
```

