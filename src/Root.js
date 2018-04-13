/**
 * Created by aby.wang on 2018/4/12.
 */
import React, { Component } from 'react';
import {
    StyleSheet,
    Image,
    Text,
    View,
    NativeModules,
} from 'react-native';
import { StackNavigator } from 'react-navigation';
import CardStackStyleInterpolator from 'react-navigation/src/views/CardStack/CardStackStyleInterpolator';
import MainScreen from './Scene/Main';
import MineScreen from './Scene/Mine';

import { Provider } from 'mobx-react';
import store from './mobx/store';

const routes = {
        Main: {
            screen: MainScreen,
            navigationOptions: {
                title: '主页',
                headerTitleStyle: { fontSize: 18, color: '#fff' },
                headerStyle: { backgroundColor: '#0084bf' },
                headerTintColor: '#ffffff',
            },
        },
        Mine: {
            screen: MineScreen,
            navigationOptions: {
                title: '我的',
                headerTitleStyle: { fontSize: 18, color: '#fff' },
                headerStyle: { backgroundColor: '#0084bf' },
                headerTintColor: '#ffffff',
            },
        },
};

function getRouteConfig(name) {
    const BaseBridge = NativeModules.BaseBridge;
    return {
        initialRouteName: name,
        navigationOptions:{
            // 开启动画
            animationEnabled:true,
            // 开启边缘触摸返回
            gesturesEnabled:true,
            navigationOptions: {
                title: '主页',
                headerTitleStyle: { fontSize: 18, color: 'green' },
                headerStyle: { backgroundColor: '#0fb' },
                headerTintColor: '#0fb',
            }
        },
        mode:'card',
        transitionConfig:()=>({
            // 统一安卓和苹果页面跳转的动画
            screenInterpolator: CardStackStyleInterpolator.forHorizontal,
        }),
        onTransitionEnd: (info) => {
            // console.log('end',info.index);
            // if (info.index === 0) {
            //     BaseBridge.changeTab(false);
            // } else {
            //     BaseBridge.changeTab(true);
            // }
        },
        onTransitionStart: (info) => {
            console.log('end',info.index);
            if (info.index === 0) {
                BaseBridge.changeTab(false);
            } else {
                BaseBridge.changeTab(true);
            }
        }
    }
}


class APP extends Component {
    initRoute = (params) => {
        if (params.routeName === 'Main') {
            console.log('jslog',params);
            return StackNavigator(routes, getRouteConfig('Main'));
        } else {
            return StackNavigator(routes, getRouteConfig('Mine'));
        }
    }
    render() {
        const NavigatorAPP = this.initRoute(this.props);
        return (
            <Provider rootStore={store}>
                <NavigatorAPP />
            </Provider>
        );
    }
}

export default APP;
