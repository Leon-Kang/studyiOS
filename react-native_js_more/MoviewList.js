'use strict'
var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  View,
  Text,
  Component,
} = React

class MoviewList extends Component {
  render() {
    return(
     <View style={styles.container}>
      <Text style={styles.description}>
      Moview List Tab
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

module.exports = MoviewList;

AppRegistry.registerComponent('MyProject', () => MoviewList);
