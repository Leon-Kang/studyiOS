'use strict'
var React = require('react-native');

var {
  AppRegistry,
  StyleSheet,
  View,
  Text,
  Component,
} = React

class KLText extends Component {
  render() {
    return(
      <View style = {styles.container}>
      <Text style = {styles.description}>
      Hello world!
      </Text>
      </View>
    );
  }
}

var styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',

  },
  description: {
    fontSize: 44,
    justifyContent: 'center',

  },
});

module.exports = KLText;

AppRegistry.registerComponent('MyProject', () => KLText);
