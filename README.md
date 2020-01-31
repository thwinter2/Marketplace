# CSC_ECE_517_Program_2
CSC/ECE 517 (OO Design and Development)

Spring 2020

Program 2: Ruby on Rails

Teams may consist of 2 or 3 members

Submission Due Date - February 21, 2020 (Friday) 11:59 PM 

Resubmission Due Date - February 29, 2020 (Friday) 11:59 PM 

# Store Management System

You are tasked with creating a Store Management System

There will be 4 main components in the system:

- [ ] Admin

- [ ] User (Registered Customer)

- [ ] Visitor

- [ ] Item

## Admin

The system should have a preconfigured admin with at least the following attributes: 

* Name

* Email

* Password

* Phone number

* Date of birth

* Address

* Credit card information (Fake ones!)

    * Name on card

    * 16 digit card number

    * Expiration date (mm/yy)

    * 3 digit cvv (security code)

Admin should be able to:

* Log in with an email and password.

* Edit her/his own profile - should not be able to update email and password

* Admin accounts cannot be deleted.

* Create registered customer accounts (users).

* Create/view/edit/delete users.

* Create/view/edit/delete items.

* View the purchase history by items.

* View the purchase history by users.

* View return requests and approve/disapprove them. 

* Approve special item purchases.

* View feedback given by users and visitors.

* An admin should be capable of performing all operations performed by Visitor or Users. 

## User

The system should have user(s) who register themselves or are created by the admin with at least the following attributes: 

* Name

* Email

* Password

* Phone number

* Date of birth

* Address

* Credit card information (Fake ones!) 

    * Name on card

    * 16 digit card number

    * Expiration date (mm/yy)

    * 3 digit cvv (security code)

User should be able to:

* Log in with an email and password.

* Edit her/his own profile

* View items and sort (popularity, cost) / filter (category, brand, availability)

* Add items to cart.

* Add items to wishlist.

* **If **an item is currently unavailable, users should be able to subscribe to mailing alerts for when the item is available. (You need to actually implement a mailer that sends out email notifications for this)

* Clear cart.

* Buy an item immediately - this will directly take user to the payment page - bypassing the add-to-cart flow, a buy-now button. 

* Checkout cart

* Should receive an email listing the purchases made.

* Users below the age of 18 years should not be able to buy age-restricted items.

* Users of and above the age of 65 should get an automatic discount on all their purchases (10%).

* Give feedback via the feedback page.

* View history of purchases (should also be able to see returned items with a return status)

* Return an item (will require admin approval) - send out a mail when admin approves return. The history of purchases should reflect ‘Return Requested’ before admin approval and ‘Returned’ after admin approval. 

## Visitor

The application can be used by non-registered users called ‘visitors’ and they can do the following:

* View items and sort (popularity, cost) / filter (category, brand, availability)

* Give feedback via feedback page

* Should see a button for registering with the system. Optionally, in place of the buy now button that registered users will see, a register to buy now button can be placed. 

## Item

The store should have items and each item should have the following attributes: 

* Unique ID

* Brand

* Name

* Category

* Image of the item (PNG or JPEG files only)

* Restricted item? 

* Age restricted item? 

* Quantity

* Cost

* Tax Slab (You can define your own tax slabs. Make 2-3 slabs and each item should fall under one of these slabs) 

## Check-out/buy now payment

The checkout/buy now payment needs to be validated using a One Time Password (OTP) - you need to use an email based OTP. Payment should fail if OTP doesn’t match and the transaction should not proceed.

## Special Item approval

The admin should receive request for any items in the cart that are marked special items. The total amount to be paid during checkout should include the cost of the special item but the purchase history should have status as pending admin approval and once it is approved - status should change to ‘Purchased’, if rejected status should change to ‘Request rejected - Refunded’

## Popularity of items

You are free to use your own metric for popularity. One could use number of views on items or number of purchases or any other metric. You just need to explain this metric in your documentation. 

## Subscribe for availability

Once a user subscribes for an unavailable item, she/he should be sent a mail whenever that item becomes available.

# **Notes**

* There will be only one admin in the system, and this account will be preconfigured. 

* The total price shown for an item should include the cost of the item and the tax incurred. 

# **Frequently Asked Questions (FAQs)**

* Can we use any 3rd party gems?

    * Yes, you can.

* If the admin account is predefined, how does the admin know how to log in?  Do we just give the admin a predefined login and password?

    * Yes.

* Would a bare minimum UI consists of a page of links and simple HTML?

    * As long as the functionalities work, it is ok.

* Is the admin able to edit the existing information for users and/or visitors?

    * Yes. As mentioned above, an admin should be capable of performing all operations performed by users or visitors.

* Admin has the right to create user and visitor accounts. When the admin creates an account for a user, the admin creates it with the user’s email address.

* Is the extra credit included in 70 points for the program, or can we score more than 70?

    * You can score more than 70 if you finish all extra credit tasks.

# **Miscellaneous**

## **Testing**

* Thoroughly test one model and one controller (prefer [RSpec](http://rspec.info) testing framework).

## **Deployment**

**Please ensure that your deployment is always accessible for grading.** You can deploy your app to any of the following: (Try to perform continuous deployment)

* Heroku or any similar PaaS (OpenShift, etc.) with free plans

* Amazon AWS

* NCSU VCL

## **Bonus (Extra Credit)**

You can do any or all of the below for extra credit (each item below is worth 5 points).

* No user/visitor should access any private content associated with other user/admin's account.

* All users can use their LinkedIn/Google/Facebook account (implementing any one of them is enough) to log into the system.

# **Submission**

Your submission in Expertiza should consist of the following-

* A link to your deployed application

* A link to your repository

    * Credentials for the preconfigured admin and any other information that reviewers would find useful should be in the README.md file in this repository

    * Please also include in README file:

        * how to test various features (e.g., how to access certain pages, what details to enter in the form etc.)

        * How your program handles edge-case scenarios(e.g., what will happen if  admin deletes an item which is purchased by several people or it exists in their cart? )
