'use strict'
var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  View,
  Text,
  Component,
} = React

class Search extends Component {
  render() {
    return(
     <View style={styles.container}>
      <Text style={styles.description}>
      Search List Tab 搜索！
      </Text>

      <View style={styles.rightContainer}>
       <Text style={styles.description}>
       Search List Tab 搜索！
       </Text>
      </View>
      
     </View>


    );
  }
}

var styles = StyleSheet.create ({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'red',
  },
  description: {
    fontSize: 44,
    justifyContent: 'center',
    backgroundColor: 'green'
  },
  rightContainer: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: 'black',
  },
});

module.exports = Search;

AppRegistry.registerComponent('MyProject', () => Search);
