# City Travel Management

A City Travel Management application designed to help users plan city trips efficiently by connecting travelers with agencies. The application provides a seamless experience for location search, booking travel packages, and managing itineraries.

![Main Interface](./images/home.png)
![Agency Packages](./images/packages.png)
![View Package](./images/package.png)
![Add Passenger](./images/add_passanger.png)
![Confirm Booking](./images/confirmticket.png)
![RazorPay Payment](./images/razorpay.png)
![View Bookings](./images/bookings.png)
![View Ticket](./images/ticket.png)

## Features

- **Location Search**: Discover and explore destinations and points of interest.
- **User Authentication**: Separate login for travelers and agencies, ensuring personalized experiences.
- **Agency Access**: Agencies can manage travel packages and featured locations.
- **Travel Package Booking**: Travelers can book tickets and explore curated travel packages.

## Installation

To set up this project locally, follow these steps:

### Prerequisites

- Python 3.x
- Git

### Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Dharmik090/city-travel-management.git
   cd city-travel-management

2. **Install required packages**
Install Dependencies Navigate to the project directory and install the required Python packages:
pip install -r requirements.txt

3. **Create local database**
Run city_travel_management.sql in MySQL

4. **Run Application**
Run the Application Start the application by running:
python manage.py runserver
Access the Application Open your web browser and go to:
http://localhost:5000
