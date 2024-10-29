# DigiBakery - Digital Bakery Management System

DigiBakery is a digital bakery management system that allows bakery owners to manage their orders, ovens, and cookies efficiently. With DigiBakery, you can bake cookies to order, one at a time, just like in an artisanal bakery.

## Backlog

The following backlog contains several bugs and features that have been addressed in this project:

### Bug: React console warning

When visiting the Order Listing page, the warning message "Warning: Each child in an array or iterator should have a unique 'key' prop." has been resolved. This ensures a smooth user experience without any console warnings.

### Feature: Place a batch of cookies into an oven

As a bakery owner, you can place a sheet with multiple cookies into an oven. You can visit the oven page and prepare a batch of cookies with the same filling. Once the batch of cookies is finished cooking, you can easily remove the cookies into your store inventory.

### Feature: Cook the cookies

The cookies are now cooked realistically. When a cookie is placed in the oven, a background cooking worker is triggered to cook the cookies for a couple of minutes. The cookies' state is updated accordingly after cooking is complete.

### Feature: Real-time updates on the oven page

As a bakery owner with unfinished cookies in an oven and on the oven page, you will see that the cookies are not yet ready. When the cookies finish cooking, the oven page automatically updates to display that the cookies are ready. The update can be non-instant, implemented through periodic polling, ensuring a seamless user experience.

### Feature: Loading indicator for Order Listing

When there are orders in the system, visiting the orders page will show a loading indicator while the order data is being fetched. Once the data has finished loading, the order listing will be displayed, improving user feedback during data retrieval.

### Feature: Sorting order listing table

The orders page now includes sortable columns for "Order #", "Customer Name," and "Pick up at". You can click on the column header to sort the table in ascending order based on that particular column.

### Feature: Marking orders fulfilled

For unfulfilled (in-progress) orders, the actions column now includes a button called "Fulfill order". Clicking on this button disables it for that row. Once the order has been fulfilled through an API call, the button for that row disappears, and the order status is updated. The order status remains visible even after refreshing the page.

## Technologies Used

This application is built using:

- Ruby 3.2.*
- Node
- NPM
- Pusher Gem: Used for real-time updates and notifications (environment variables used for creds)
- Background Jobs: Used for cooking cookies asynchronously

## Installation and Testing

To get started with DigiBakery, follow these steps:

1. Clone the repository to your local machine.
2. Install the required dependencies:

```bash
bundle install
npm install
```

3. Set up the database and seed data:

```bash
rails db:setup
```

4. Run the test suite to ensure everything is working correctly:

```bash
rspec spec
```
