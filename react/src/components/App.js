import React, { Component } from 'react';

class User extends Component {
  constructor(props) {
    super(props);
    this.state = { pokemon: '' };
  }

  componentDidMount() {

    $.ajax({
      url: '/pokemons',
      contentType: 'application/json'
    })
    .done(data => {
      this.setState({ fortune: data.fortune });
    });
  }

  render() {
    return (
      <h1>Your Fortune: {this.state.fortune}</h1>
    );
  }
}

export default App;
