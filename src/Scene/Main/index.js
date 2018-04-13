/**
 * Created by aby.wang on 2018/4/12.
 */

import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {
    View,
    StyleSheet,
    Text,
    TouchableOpacity,
    NativeModules,
} from 'react-native';
import { observer, inject } from 'mobx-react/native';
import { observable, action, runInAction, toJS } from 'mobx';

const MainScreenStyle = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    btnStyle: {
        flex: 0,
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 5,
        backgroundColor: '#0084bf',
        height: 40,
        width: 200,
        marginVertical: 20,
    },
    textStyle: {
        marginVertical: 10,
        fontSize: 18,
        color: '#333333',
    }
});

@inject('rootStore')
@observer
class MainScreen extends Component<> {
    pressAction = () => {
        // const BaseBridge = NativeModules.BaseBridge;
        // if (BaseBridge) {
        //     BaseBridge.changeTab(true);
        // }
        const { navigation } = this.props;
        navigation.navigate('Mine');
    }

    render() {
        return (
            <View style={MainScreenStyle.container}>
                <Text>我是主页内容</Text>
                <Text
                    style={MainScreenStyle.textStyle}
                >
                    {this.props.rootStore.allName}
                </Text>
                <TouchableOpacity
                    style={MainScreenStyle.btnStyle}
                    onPress={() => this.pressAction()}
                >
                    <Text style={{ color: '#fff', fontSize: 18 }}>点击跳转到下个页面</Text>
                </TouchableOpacity>
            </View>
        );
    }
}

export default MainScreen;
