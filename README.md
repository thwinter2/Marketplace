# CSC_ECE_517_Program_2 Team 1000

# **Submission**

**Application URL:** [http://152.7.98.237:8080/](http://152.7.98.237:8080/)

**Admin Credentials:**

**Email**: market5172020@gmail.com
**Password:** password


<ins>Points to consider:</ins>
- Credit Cards is accessed in a link in the User's profile, which you can get to from the **Edit Profile** button in the top right header.

- While creating an item, please use image URL. Our application doesn't support uploading images. You can get the URL by right clicking an image on web browser, and then clicking on **Copy Image Address** as shown in screenshot below:

	![Image Link](images/image_link.png)


<ins>Edge-cases:</ins>
- What will happen if admin deletes an item which is purchased by several people or it exists in their cart?

	If an admin deletes an item, which is purchased by several people, then the purchase record related to that item will be removed from purchase history, and the application will function without any error. However, if the item exists in someone's cart, then the application throws an error while viewing the cart (`/views/carts/show.html.erb`) because the `item_id` is not available.
	If an admin edits the quantity of an item that has a user subscribed to its availability, and that user has been deleted, the application will throw an error when trying to update that quantity. Following the testing of this edge case, it is recommended that you test any other editing of quantity on an item that is either newly created, or does not have a subscribed user that has been deleted.
