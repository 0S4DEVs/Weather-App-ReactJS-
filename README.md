# Weather-App-ReactJS-
This is a simple weather app built using ReactJS that displays the current weather and temperature for a given city.

First, you'll need to set up your development environment. Here are the steps:

Install Node.js and npm (Node Package Manager) on your computer.
Open Notepad++ and create a new file.
Save the file as "index.html".
Copy and paste the following code into the index.html file:
html
Copy code
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Weather App</title>
  </head>
  <body>
    <div id="root"></div>
    <script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
    <script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="./app.js"></script>
  </body>
</html>
This code creates the basic structure of an HTML file and includes the React, ReactDOM, and Axios libraries.

Create a new file in Notepad++ and save it as "app.js".
Copy and paste the following code into the app.js file:
jsx
Copy code
const API_KEY = "your_api_key_here"; // You can get an API key from OpenWeatherMap

class WeatherApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      temperature: "",
      description: "",
      city: "",
      country: "",
    };
  }

  getWeatherData = (city) => {
    axios
      .get(
        `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric`
      )
      .then((response) => {
        this.setState({
          temperature: response.data.main.temp,
          description: response.data.weather[0].description,
          city: response.data.name,
          country: response.data.sys.country,
        });
      })
      .catch((error) => {
        console.log(error);
      });
  };

  render() {
    return (
      <div>
        <h1>Weather App</h1>
        <input type="text" placeholder="Enter city name" ref={this.inputRef} />
        <button onClick={() => this.getWeatherData(this.inputRef.current.value)}>Get Weather</button>
        <div>
          <p>Temperature: {this.state.temperature}°C</p>
          <p>Description: {this.state.description}</p>
          <p>City: {this.state.city}</p>
          <p>Country: {this.state.country}</p>
        </div>
      </div>
    );
  }
}

ReactDOM.render(<WeatherApp />, document.getElementById("root"));
This code defines a WeatherApp class that fetches weather data from the OpenWeatherMap API and displays it in the browser. You'll need to replace "your_api_key_here" with your own API key from OpenWeatherMap.

Open a command prompt or terminal window and navigate to the directory where your files are saved.
Type the following command to install the necessary packages:
Copy code
npm install axios
Type the following command to start the development server:
sql
Copy code
npm start
This will open the app in your default browser.

That's it! You should now have a simple weather app using ReactJS that you can put into your GitHub profile portfolio. Remember to replace "your_api_key_here" with your own API 

Installation
To install and run the app locally, follow these steps:

Clone the repository to your local machine.
Install the required dependencies by running npm install in the project directory.
Run the app by running npm start.
Usage
To use the app, simply enter the name of a city in the search bar and press the "Get Weather" button. The app will display the current weather and temperature for that city.

API
The app uses the OpenWeatherMap API to fetch weather data. To use the app, you will need to obtain an API key from OpenWeatherMap and add it to the api_key variable in the src/App.js file.

Credits
This app was created by [Your Name] as a sample project using ReactJS.

License
This project is licensed under the MIT License - see the LICENSE file for details.
