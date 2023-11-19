db.collectionName.update(
  { "uid": "1" }, // Match the document with the specified UID
  {
    $push: {
      "customer.ownTask": {
        "taskId": "2",
        "title": "New Task",
        "category": "New Category",
        "description": "New Description",
        "images": [
          "https://example.com/image1.jpg",
          "https://example.com/image2.jpg"
        ],
        "location": {
          "latitude": 38.4219983,
          "longitude": -123.084
        },
        "state": "available",
        "wages": 15000.00,
        "time": {
          "start": "2023-11-19T08:00:00.000Z",
          "end": "2023-11-19T09:30:00.000Z",
          "duration": "1h30m"
        },
        "verified": true,
        "worker": []
      }
    }
  }
)
