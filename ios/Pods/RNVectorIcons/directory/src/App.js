import React, { PureComponent } from 'react';
import PropTypes from 'prop-types';

import './App.css';

import Entypo from '../../glyphmaps/Entypo.json';
import EvilIcons from '../../glyphmaps/EvilIcons.json';
import Feather from '../../glyphmaps/Feather.json';
import FontAwesome from '../../glyphmaps/FontAwesome.json';
import Foundation from '../../glyphmaps/Foundation.json';
import Ionicons from '../../glyphmaps/Ionicons.json';
import MaterialCommunityIcons from '../../glyphmaps/MaterialCommunityIcons.json';
import MaterialIcons from '../../glyphmaps/MaterialIcons.json';
import Octicons from '../../glyphmaps/Octicons.json';
import SimpleLineIcons from '../../glyphmaps/SimpleLineIcons.json';
import Zocial from '../../glyphmaps/Zocial.json';

const IconFamilies = {
  Entypo,
  EvilIcons,
  Feather,
  FontAwesome,
  Foundation,
  Ionicons,
  MaterialCommunityIcons,
  MaterialIcons,
  SimpleLineIcons,
  Octicons,
  Zocial,
};

const WAITING_INTERVAL = 300;

class Icon extends PureComponent {
  static propTypes = {
    family: PropTypes.string.isRequired,
    name: PropTypes.string.isRequired,
  };

  render() {
    return (
      <span style={{ fontFamily: this.props.family }} {...this.props}>
        {String.fromCharCode(IconFamilies[this.props.family][this.props.name])}
      </span>
    );
  }
}

const HeaderBar = (props) => {
  return (
    <div className="Header-Container">
      <div className="Header-Content">
        <h1 className="Header-Title">
          react-native-vector-icons directory
        </h1>
      </div>
    </div>
  );
};

class SearchBar extends PureComponent {
  timer = null;

  state = {
    keyword: ''
  };
  
  handleSubmit = (e) => {
    e.preventDefault();
    this.props.onSubmit(this.inputRef.value);
  };

  handleChange = (e) => {
    e.preventDefault();
    clearInterval(this.timer);
    
    this.setState({ keyword: this.inputRef.value });

    this.timer = setTimeout(
      () => this.props.onSubmit(this.state.keyword),
      WAITING_INTERVAL
    );
  };

  render() {
    return (
      <div className="Search-Container">
        <div className="Search-Content">
          <form onSubmit={this.handleSubmit}>
            <Icon family="FontAwesome" name="search" className="Search-Icon" />
            <input
              ref={ref => this.inputRef = ref}
              onChange={this.handleChange}
              placeholder="Search for an icon"
              type="text"
              className="Search-Input"
            />
          </form>
        </div>
      </div>
    );
  }
}

class App extends PureComponent {
  constructor() {
    super();
    this.state = {
      matches: [],
    };
  }

  componentDidMount() {
    this.handleSubmit('');
  }

  handleSubmit = (text) => {
    let matches = [];
    Object.keys(IconFamilies).forEach((family) => {
      const icons = IconFamilies[family];
      const names = Object.keys(icons);
      const results = names.filter(name => name.indexOf(text) >= 0);
      if (results.length) {
        matches = [...matches, { family, names: results }];
      }
    });

    this.setState({ matches });
  };

  renderFamily(familyName) {
    return (
      <div>
        {Object.keys(IconFamilies[familyName]).map(iconName => (
          <Icon key={iconName + familyName} family={familyName} name={iconName} />
        ))}
      </div>
    );
  }

  renderMatch = (match) => {
    const { family, names } = match;
    return (
      <div className="Result-Row" key={family}>
        <h2 className="Result-Title">{family}</h2>

        <div className="Result-List">
          {names.map(name => this.renderIcon(family, name))}
        </div>
      </div>
    );
  };

  renderIcon(family, name) {
    return (
      <div className="Result-Icon-Container" key={name}>
        <Icon
          family={family}
          name={name}
          className="Result-Icon"
        />
        <h4 className="Result-Icon-Name">
          {name}
        </h4>
      </div>
    );
  }

  renderNotFound () {
    return (
      <div className="Result-Row">
        <h2 className="Result-Title">Icon not found.</h2>
      </div>
    );
  }

  render() {
    return (
      <div className="App">
        <HeaderBar />
        <SearchBar onSubmit={this.handleSubmit} />
        <div className="Container">
          {this.state.matches.map(this.renderMatch)}
          {this.state.matches.length === 0 && this.renderNotFound()}
        </div>
      </div>
    );
  }
}

export default App;
