// email : admin@zookeeper.com
// password : Lg9CyyP75
var fs = require("fs");
var admin = require("firebase-admin");

// replace the require by your GOOGLE_APPLICATION_CREDENTIALS => https://firebase.google.com/docs/admin/setup#linux-or-macos
var serviceAccount = require("./zoo-keeper-c97d8-firebase-adminsdk-oin1c-ef22373680.json");

// replace database url by your database url
var config = {
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://zoo-keeper-c97d8-default-rtdb.europe-west1.firebasedatabase.app"
}

const defaultApp = admin.initializeApp(config);

// Create admin user
let auth = defaultApp.auth();
let db = defaultApp.firestore();

auth.createUser({
	email: "admin5@zookeeper.com",
	password: "Lg9CyyP75",
	uid: "5ldadxAj3APYrn2s5lC7VwyYbbF2"
}).then(
    function(user) { 
		userRef = db.collection('users').doc("5ldadxAj3APYrn2s5lC7VwyYbbF2");
		userRef.set({
			email: user.email,
			name: "admin"
		})
	},
    function(error) { console.error(error);}
);

// Create group

let groupsRef = db.collection('groups').doc("87uq48goyVrRtXZ1xbHl");
groupsRef.set({
	store: "aubagne"
});

// Create roles

var rolesList = [
	{type: "admin", id: "f1c93yXH0JFwHPcVbcdW"},
	{type: "manager", id: "8FxDRBZEw6Y8H3ApNVtl"},
	{type: "employee", id: "EPl2ABTEs2aoZzRth1MC"}
];

rolesList.map((value) => {
	let rolesRef =  db.collection('roles').doc(value.id);
	rolesRef.set({
		type: value.type
	})
})

// Create Right

var rightsList = [
	{type: "USER_CREATE", id: "0D9OuALyNJejUvt06aAp"},
	{type: "USER_UPDATE", id: "0UtNqmZCYB1MH3GslPXl"},
	{type: "USER_READ", id: "hR35ZILf9Rwt3wnDrrsh"},
	{type: "USER_DELETE", id: "oqpO554eXaeJBRnvnQi2"},
	{type: "TASKS_CREATE", id: "0yb2dtGNHIUyRUCzoD0K"},
	{type: "TASKS_READ", id: "NlXL9KyWGL5vXTxx0rQd"},
	{type: "TASKS_UPDATE", id: "tzLuwsi95t0yqnLj9M4F"},
	{type: "TASKS_DELETE", id: "Y5DACk8XZH3zy5my5m98"},
	{type: "ANIMALS_CREATE", id: "uwtIOVhR4gbF5wwyI2V4"},
	{type: "ANIMALS_UPDATE", id: "z1TkyZi3OvhhsmeEICBB"},
	{type: "ANIMALS_READ", id: "QBCAwvDeqSVKsSOp5tD5"},
	{type: "ANIMALS_DELETE", id: "hFu7CNyxUbSb9AEfnb9y"},
	{type: "GROUPS_CREATE", id: "1Y97aDvEmKwcb8RFkIsG"},
	{type: "GROUPS_READ", id: "uzXS953nO21bSFiSkjyP"},
	{type: "GROUPS_UPDATE", id: "4Kx1pQg8LeSlOnfs3OoG"},
	{type: "GROUPS_DELETE", id: "QoT8RlBL7WvEYRZWsgae"},
	{type: "RIGHT_CREATE", id: "ig4qIQPZNqapwsQsiBhK"},
	{type: "RIGHT_READ", id: "zHjz9qRptivlZ8rHEPAC"},
	{type: "RIGHT_UPDATE", id: "Kdw9mAJsSomzzH3FIqdx"},
	{type: "RIGHT_DELETE", id: "IohmxcUKUOPtNZ5MruhQ"},
	{type: "ROLE_CREATE", id: "gpGr95ADMMTJKvFQ7Xb5"},
	{type: "ROLE_READ", id: "KRToONX7Z6j0DmDlJpjP"},
	{type: "ROLE_UPDATE", id: "jMrmj2MHeqQdi6qWAxNf"},
	{type: "ROLE_DELETE", id: "pFsu6nUWvkndIqeGEs6d"},
	{type: "USERS_ROLES_CREATE", id: "RpFoB6Rj1kstcXQUmCBn"},
	{type: "USERS_ROLES_READ", id: "4XnFCLp5WADadFZCADNC"},
	{type: "USERS_ROLES_UPDATE", id: "SWpQx1CIJe1q1kr8Uhvc"},
	{type: "USERS_ROLES_DELETE", id: "1FjwAGwMyVrJ4VckaoJg"},
	{type: "USERS_RIGHT_CREATE", id: "CKe4dq776g9g2VGPDvKi"},
	{type: "USERS_RIGHT_READ", id: "WCBibB1q5779FVz2kaDI"},
	{type: "USERS_RIGHT_UPDATE", id: "4fz8DFimdlAoFL6Sgtas"},
	{type: "USERS_RIGHT_DELETE", id: "lqW1YQHkweghU7iLOoxD"},
	{type: "USERS_GROUPS_CREATE", id: "G1NWGxN3UF5FeT5hrYYi"},
	{type: "USERS_GROUPS_READ", id: "eQRJnIM763T1W7RUhYQ0"},
	{type: "USERS_GROUPS_UPDATE", id: "EP185rtjJO4okDf66RNQ"},
	{type: "USERS_RIGHT_DELETE", id: "FPyjHwdCFSiX5ZfcW5la"},
];

rightsList.map((value) => {
	let rightsRef =  db.collection('rights').doc(value.id);
	rightsRef.set({
		type: value.type
	})
})

// users_roles admin

let userRoles = db.collection('users_roles').doc("5ldadxAj3APYrn2s5lC7VwyYbbF2" + "_" + "f1c93yXH0JFwHPcVbcdW");
userRoles.set({
	user_id: "5ldadxAj3APYrn2s5lC7VwyYbbF2",
	role_id: "f1c93yXH0JFwHPcVbcdW"
});

// users_groups admin

let usersGroups = db.collection('users_groups').doc("5ldadxAj3APYrn2s5lC7VwyYbbF2" + "_" + "87uq48goyVrRtXZ1xbHl");
usersGroups.set({
	user_id: "5ldadxAj3APYrn2s5lC7VwyYbbF2",
	group_id: "87uq48goyVrRtXZ1xbHl"
})

// users_right 

rightsList.map((value) => {
	let users_right = db.collection("users_right").doc("5ldadxAj3APYrn2s5lC7VwyYbbF2" + "_" + value.id);
	users_right.set({
		right_id: value.id,
		user_id: "5ldadxAj3APYrn2s5lC7VwyYbbF2"
	})
})

// Security instance
let securityRules = defaultApp.securityRules();

var buffer = fs.readFileSync("firestore.rules");
securityRules.releaseFirestoreRulesetFromSource(buffer);