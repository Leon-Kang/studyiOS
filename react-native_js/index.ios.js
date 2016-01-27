import React, {
  AppRegistry,
  Component,
  Image,
  ListView,
  StyleSheet,
  Text,
  View,
} from 'react-native';

var MOCKED_MOVIES_DATA = [
{title:'title',year:'2015',posters:{thumbnail:
  'http://i.imgur.com/UePbdph.jpg'
}}];

//First App
class MyProject extends Component 
{
render() 
 {
  var movie = MOCKED_MOVIES_DATA[0];
	return (
		<View style={styles.container}>
			<Text>{movie.title} </Text>
			<Text>{movie.year} </Text>
			<Image 
      source={{uri:movie.posters.thumbnail}} 
      style={styles.thumbnail}
      />
		</View>
    );
 }
}
 
const styles = StyleSheet.create({
  container:{
    flex:1,
  	justifyContent:'center',
  	alignItems:'center',
  	backgroundColor:'#F5FCFF',
  },
    rightContainer, {
    flex:1,
    backgroundColor:'FFFFFF',
},
  thumbnail: {
    width: 53,
    height: 81,
  },
   });

AppRegistry.registerComponent('MyProject', () => MyProject);



