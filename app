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
