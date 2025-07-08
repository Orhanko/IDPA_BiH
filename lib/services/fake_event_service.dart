import 'package:idpa_bih/models/models.dart';

class FakeEventService {
  Future<List<EventModel>> fetchEvents() async {
    final Map<String, dynamic> fakeJson = {
      "-B9aWggh7wM7Fvu1XAkP": {
        "agenda": [
          {
            "infoList": [
              "Walkthrough of stages",
              "Arrival of SO/STAFF team: until 10:00",
              "Registration: 10:00-10:30",
              "First shot: 11:00",
              "End of pre match 16:00",
            ],
            "name": "Friday - Pre Match for SO and STAFF Team",
            "title": "Pre-match",
          },
          {
            "infoList": [
              "12 squads, each squad with 10 slots",
              "Registration: 08:00-09:00",
              "First shot: 09:30",
              "End of match 16:00",
            ],
            "name": "Saturday - Main match",
            "title": "Main match",
          },
          {
            "infoList": [
              "12 squads, each squad with 10 slots",
              "Arrival of competitors: 08:00",
              "Registration: 08:00-09:00",
              "First shot: 09:30",
              "End of shooting: 16:00",
              "Award ceremony: 17:00",
            ],
            "name": "Sunday - Main match",
            "title": "Main match",
          },
        ],
        "details": {
          "endTime": "5:00 PM",
          "level": "International",
          "matchFee": "100.00",
          "minRounds": "xxx",
          "stages": "12",
          "startTime": "11:30 PM",
          "tier": "III",
        },
        "endDate": "21.09.2025",
        "hotel": {
          "name": "Hotel Grad",
          "placeId": "ChIJba11lQ3JWEcRWJsT2akasKw",
        },
        "imgUrl":
            "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/img11.jpg?alt=media&token=292c8886-8dac-4a97-8b92-df04ac0f57bb",
        "name": "Balkan Cup 2025 by SK4 Tactic",
        "phone": "+387 61 900 554",
        "practiscoreUrl":
            "https://practiscore.com/balkan-cup-2025-tier-iii/register",
        "shootingRange": {
          "address": "Vladimira Preloga, Sarajevo",
          "location": {"lat": "43.87727765616045", "lng": "18.356617061364112"},
          "name": "Sportsko strelište Zuč",
          "placeId": "ChIJG32mj3XLWEcRVvs-iOyyLCQ",
        },
        "startDate": "19.09.2025",
        "tier": "III",
        "visitSuggestion": {
          "imageUrl":
              "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/sarajevo.jpg?alt=media&token=6b750c58-1b5a-45a3-9282-953a1c76b7ee",
          "name": "Sarajevo",
          "visitUrl":
              "https://www.tripadvisor.com/Tourism-g294450-Sarajevo_Sarajevo_Canton_Federation_of_Bosnia_and_Herzegovina-Vacations.html",
        },
      },
      "-B9aWggh7wM7Fvu1XAkPe": {
        "agenda": [
          {
            "infoList": [
              "Walkthrough of stages",
              "Arrival of STAFF team: until 07:30",
              "Registration: 07:30-08:30",
              "Match day start: 09:00",
              "Match day end: 16:00",
            ],
            "name": "Friday - Pre Match for SO and STAFF Team",
            "title": "Pre-match",
          },
          {
            "infoList": [
              "Arrival of competitors: until 07:30",
              "Registration: 07:30-08:30",
              "Match day start: 09:00",
              "Match day end: 18:00",
            ],
            "name": "Saturday",
            "title": "Main match",
          },
          {
            "infoList": [
              "Arrival of competitors: until 07:30",
              "Registration: 07:30-08:30",
              "Match day start: 09:00",
              "Match day end: 18:00",
              "Award ceremony: 19:00",
            ],
            "name": "Sunday",
            "title": "Main match",
          },
        ],
        "details": {
          "endTime": "5:00 PM",
          "level": "National",
          "matchFee": "90 EUR",
          "minRounds": "xxx",
          "stages": "12 + warm up",
          "startTime": "08:00 AM",
          "tier": "III",
        },
        "endDate": "11.05.2025",
        "hotel": {"name": "--", "placeId": "--"},
        "imgUrl":
            "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/473060651_959609452265068_8259358266021607421_n.jpg?alt=media&token=7e6dca54-d853-4635-a3f0-65fa744cb805",
        "name": "SERBIAN NATIONAL IDPA CHAMPIONSHIP 2025 - TIER 3",
        "phone": "+381621589177",
        "practiscoreUrl":
            "https://practiscore.com/serbian-national-idpa-championship-2025-level-3/register",
        "shootingRange": {
          "address":
              "Ive Andrića bb, Gun Range Begluk, Indjija, Novi Slankamen, Serbia 22323",
          "location": {
            "lat": "45.120323539951166",
            "lng": "20.226727980950745",
          },
          "name": "Gun Range Begluk",
          "placeId": "ChIJ-5w__YD6WkcRcolipahamIQ",
        },
        "startDate": "09.05.2025",
        "tier": "III",
        "visitSuggestion": {
          "imageUrl":
              "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/turski-hamam-u-sklopu.jpg?alt=media&token=99a14912-fab8-4e3a-a788-befe4e6e8d28",
          "name": "Stari Slankamen, Serbia",
          "visitUrl":
              "https://www.tripadvisor.com/Tourism-g12552592-Stari_Slankamen_Central_Serbia-Vacations.html",
        },
      },
      "-O5eWjGghk9Hfov3IfPf": {
        "agenda": [
          {
            "infoList": [
              "Walkthrough of stages",
              "Arrival of STAFF team: until 07:00",
              "Registration: 08:00-09:00",
              "Match day start: 10:00",
              "Match day end: 17:00",
            ],
            "name": "Saturday - Pre Match for SO and STAFF Team",
            "title": "Pre-match",
          },
          {
            "infoList": [
              "10 stages + Warm up - Cool down",
              "Registration: 08:00-09:00",
              "Match day start: 09:30",
              "Match day end: 16:00",
            ],
            "name": "Sunday",
            "title": "Main match",
          },
        ],
        "details": {
          "endTime": "5:00 PM",
          "level": "National",
          "matchFee": "50 Euro",
          "minRounds": "xxx",
          "stages": "10",
          "startTime": "09:30 PM",
          "tier": "I",
        },
        "endDate": "06.04.2025",
        "hotel": {"name": "--", "placeId": "--"},
        "imgUrl":
            "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/croatia-open-cup.jpeg?alt=media&token=d660c566-2057-499f-87e4-340dee913e9d",
        "name": "CROATIA OPEN CUP 2025",
        "phone": "+385914400555",
        "practiscoreUrl":
            "https://practiscore.com/croatia-open-cup-2025/register",
        "shootingRange": {
          "address": "Shooting range “Pavlovo Brdo”, Cerić, Croatia 32221",
          "location": {"lat": "45.320807", "lng": "18.854706"},
          "name": "Shooting range “Pavlovo Brdo”",
          "placeId": "ChIJt6lSIoyLXEcR6K7nSGwHBJo",
        },
        "startDate": "05.04.2025",
        "tier": "I",
        "visitSuggestion": {
          "imageUrl":
              "https://firebasestorage.googleapis.com/v0/b/idpabih-8cf32.appspot.com/o/Vinkovici.jpg?alt=media&token=f6afedc3-d3b7-448a-bec4-269e2e59fa74",
          "name": "Vinkovci",
          "visitUrl":
              "https://www.tripadvisor.com/Tourism-g1026898-Vinkovci_Vukovar_Syrmia_County_Slavonia-Vacations.html",
        },
      },
    };

    return fakeJson.entries
        .map((entry) => EventModel.fromJson(entry.value))
        .toList();
  }
}
