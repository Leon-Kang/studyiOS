'use strict'
var React = require('react-native')

var {
  AppRegistry,
  TabbarIOS,
  Component,
} = React;

var MoviewList = require('./MoviewList');
var Search = require('./search');

class Moview extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedTab: 'MoviewList'
    };
  }

    render() {
      return(
        <TabbarIOS selectedTab={this.state.selectedTab}>
          <TabbarIOS.Item
            icon={{uri:'moviewList'}}
            title={'MoviewList'}>
          <Tabbars />
          </TabbarIOS.Item>

           <TabbarIOS.Item
             icon={{uri:'search'}}
             title={'Search'}>
           <Search />
           </TabbarIOS.Item>
        );

    }

}

AppRegistry.registerComponent('MyProject', () => Moview);
