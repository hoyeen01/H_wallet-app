Create User

Request Url - /api/users

Method - POST Request body

{
  "first_name": "string",
  "last_name": "string",
  "email": "string",
  "password": "string"
}
Response

Status - 201 - created

body

{
  "message": "User created successfully"
}
Update user

Request Url - /api/users

Method - PATCH Headers - {Authorization: 'Bearer <token>'}

Request body

{
  "first_name": "string",
  "last_name": "string",
  "email": "string",
  "password": "string",
  "dob": "string",
  "address": "string"
}
Response

Status - 200 - OK

body

{
  "message": "User updated successfully",
  "data": {
    "first_name": "string",
    "last_name": "string",
    "email": "string",
    "password": "string",
    "dob": "string",
    "address": "string",
    "created_at": "timestamp",
    "updated_at": "timestamp"
  }
}
Login

Request Url - /api/sessions

Method - POST

Request body

{
  "email": "string",
  "password": "string"
}
Response

Status - 200 - OK

body

{
  "message": "login successful",
  "data": {
    "first_name": "string",
    "last_name": "string",
    "email": "string",
    "password": "string",
    "dob": "string",
    "address": "string",
    "created_at": "timestamp",
    "updated_at": "timestamp",
    "auth_token": "string"
  }
}
Wallet Details

Request Url - /api/wallets

Method - GET

Headers - {Authorization: 'Bearer <token>'}

Response

Status - 200 - OK

body

{
  "data": {
    "user_id": "string",
    "settled_balance": "string",
    "status": "string",
    "recent_transactions": [],
    "debit_cards": []
  }
}
Create Debit Cards

Request Url - /api/debit_cards

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "cvv": "string",
  "number": "string",
  "expiry_month": "string",
  "expiry_year": "string"
}
Response

Status - 200 - OK

body

// When charged
{
  "message": "debit card added successfully",
  "data": {
    "id": "string", 		
    "last4": "string", 
    "exp_month": "string", 
    "exp_year": "string", 
    "card_type": "string", 
    "bank": "string", 
    "user_id": "string", 
    "created_at": "string", 
    "updated_at": "string"
  }
}

// When Pin is required
{
    "reference": "guiajjfxvpx9vwd",
    "status": "send_pin"
}

// When Otp is required
{
    "reference": "guiajjfxvpx9vwd",
    "status": "send_otp"
}
Send Pin

Request Url - /api/debit_cards/send_pin

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "reference": "string",
   "pin": "string"
}
Response

Status - 200 - OK

body

// When charged
{
  "message": "debit card added successfully",
  "data": {
    "id": "string", 		
    "last4": "string", 
    "exp_month": "string", 
    "exp_year": "string", 
    "card_type": "string", 
    "bank": "string", 
    "user_id": "string", 
    "created_at": "string", 
    "updated_at": "string"
  }
}

// When Otp is required
{
    "reference": "guiajjfxvpx9vwd",
    "status": "send_otp"
}
Send OTP

Request Url - /api/debit_cards/send_pin

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "reference": "string",
  "otp": "string"
}
Response

Status - 200 - OK

body

// When charged
{
  "message": "debit card added successfully",
  "data": {
    "id": "string", 		
    "last4": "string", 
    "exp_month": "string", 
    "exp_year": "string", 
    "card_type": "string", 
    "bank": "string", 
    "user_id": "string", 
    "created_at": "string", 
    "updated_at": "string"
  }
}
Delete debit card

Request Url - /api/debit_cards

Method - DELETE

Headers - {Authorization: 'Bearer <token>'}

body

{
  "debit_card_id": "string",
}
Response

Status - 200 - OK

body

{
  "message": "debit card deleted successfully"
}
Credit Wallet

Request Url - /api/wallet/credit

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "amount": "string",
  "debit_card_id": "string"
}
Response

Status - 200 - OK

body

{
  "message": "funding is successful",
  "data": {    
  	"user_id": "string",    
  	"settled_balance": "string",    
  	"status": "string",    
  	"recent_transactions": [],    
		"debit_cards": [],
	}
}

// When Pin is required
{
    "reference": "guiajjfxvpx9vwd",
    "status": "send_pin"
}

// When Otp is required
{
    "reference": "guiajjfxvpx9vwd",
    "status": "send_otp"
}
Credit Wallet [Pin is required]

Request Url - /api/wallet/credit/send_pin

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
"reference": "string",
"pin": "string"
}
Response

Status - 200 - OK

body

{
"message": "funding is successful",
"data": {    
 "user_id": "string",    
 "settled_balance": "string",    
 "status": "string",    
 "recent_transactions": [],    
 	"debit_cards": [],
 }
}

// When Otp is required
{
 "reference": "guiajjfxvpx9vwd",
 "status": "send_otp"
}
Credit Wallet [OTP is required]

Request Url - /api/wallet/credit/send_otp

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "reference": "string",
   "otp": "string"
}
Response

Status - 200 - OK

body

{
  "message": "funding is successful",
  "data": {    
  	"user_id": "string",    
  	"settled_balance": "string",    
  	"status": "string",    
  	"recent_transactions": [],    
		"debit_cards": [],
	}
}
Get list of banks (Bank name and bank code) for Nigeria banks with NUBAN

Request Url - /api/banks

Method - GET

Headers - {Authorization: 'Bearer <token>'}

Response

Status - 200 - OK

body

{
  "data": [
    {"name": "string", "slug": "string", "code": "string"},
    // ...
  ]
}
Resolve account number (check first in our db if it exist if not call paysatck endpoints [resolve bank account and create recipient])

Request Url - /api/bank_account/verify

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "account_number": "string",
   "bank_code": "string"
}
Response

Status - 200 - OK

body

{
  "message": "bank account successfully verified",
  "data": {
    "id": "string",
    "account_number": "string",
    "bank_name": "string",
    "account_name": "string",
    "recipeint_code": "string"
  }
}
Initiate transaction

Request Url - /api/wallet/transfer

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
   "amount": "string",
   "account_id": "string",
   "account_type": "string", // one of [wallet, bank_account]
}
Response

Status - 200 - OK

body

{
  "message": "transfer is successful",
  "data": {    
  	"user_id": "string",    
  	"settled_balance": "string",    
  	"status": "string",    
  	"recent_transactions": [],    
		"debit_cards": [],
	}
}
Implement Webhook URL

Request Url - /api/callback/paystack

Method - POST

Headers - {Authorization: 'Bearer <token>'}

body

{
  "event": "transfer.success", // [transfer.failed, transfer.reversed]
  "data": {
    "amount": 30000,
    "currency": "NGN",
    "domain": "test",
    "failures": null,
    "id": 37272792,
    "integration": {
      "id": 463433,
      "is_live": true,
      "business_name": "Boom Boom Industries NG"
    },
    "reason": "Have fun...",
    "reference": "1jhbs3ozmen0k7y5efmw",
    "source": "balance",
    "source_details": null,
    "status": "success",
    "titan_code": null,
    "transfer_code": "TRF_wpl1dem4967avzm",
    "transferred_at": null,
    "recipient": {
      "active": true,
      "currency": "NGN",
      "description": "",
      "domain": "test",
      "email": null,
      "id": 8690817,
      "integration": 463433,
      "metadata": null,
      "name": "Jack Sparrow",
      "recipient_code": "RCP_a8wkxiychzdzfgs",
      "type": "nuban",
      "is_deleted": false,
      "details": {
        "account_number": "0000000000",
        "account_name": null,
        "bank_code": "011",
        "bank_name": "First Bank of Nigeria"
      },
      "created_at": "2020-09-03T12:11:25.000Z",
      "updated_at": "2020-09-03T12:11:25.000Z"
    },
    "session": { "provider": null, "id": null },
    "created_at": "2020-10-26T12:28:57.000Z",
    "updated_at": "2020-10-26T12:28:57.000Z"
  }
}
