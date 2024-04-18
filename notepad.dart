bool isPetsAllowed = true;
bool isVisitorsAllowed = true;
bool isVisible = true;
String name = "";
String description = "";
int pricing = 0;
const location = {
  "lat": int,
  "long": int,
  "zipcode": int,
  "city": String,
  "province": String,
};
const housePhotoUrl = [
  "insert URL here",
  "insert URL here",
];
const contact = {
	"number": int,
	"email": String,
};
const rooms = {
	0: {
		"isVacant": bool,
		"hasAirconditioning": bool,
		"hasOwnBathroom": bool,
		"maxCapacity": int,
		"pricing": int,
    "roomPhotoUrl": [
      String,
      String,
    ],
    "ammenities": [
      "Twin sized Bed",
      "Aircondition",
      "Mini-Fridge",
      "Free Wi-Fi",
      "Water Bill Provided",
      "Bathroom exists",
    ],
	},
	1: {
		"isVacant": bool,
		"hasAirconditioning": bool,
		"hasOwnBathroom": bool,
		"maxCapacity": int,
		"pricing": int,
    "roomPhotoUrl": [ 
      String, 
      String,
    ],
    "ammenities": [
      "Twin sized Bed",
      "Aircondition",
      "Mini-Fridge",
      "Free Wi-Fi",
      "Water Bill Provided",
      "Bathroom exists",
    ],
	},
};


//we can probably change descriptions to an array called ammenities, for example:


const ammenities = [
  "Twin sized Bed",
  "Aircondition",
  "Mini-Fridge",
  "Free Wi-Fi",
  "Water Bill Provided",
  "Bathroom exists",
];