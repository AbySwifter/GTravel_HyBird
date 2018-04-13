/**
 * Created by aby.wang on 2018/4/12.
 */
import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {
    View,
    StyleSheet,
    Text,
    TextInput,
} from 'react-native';
import { observer, inject } from 'mobx-react/native';
import { observable, action, runInAction, toJS } from 'mobx';

const MineStyle = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
    },
    textStyle: {
        flex: 0,
        marginVertical: 10,
        fontSize: 16,
        color: '#333333',
    }
});

@inject('rootStore')
@observer
class Mine extends Component<> {
    @action firstNameChangeText = (value) => {
        const { rootStore }= this.props;
        rootStore.changeName(value, null);
    }
    @action lastNameChangeText = (value) => {
        const { rootStore }= this.props;
        rootStore.changeName(null, value);
    }
    render() {
        const { rootStore }= this.props;
        return (
            <View style={MineStyle.container}>
                <Text style={MineStyle.textStyle}>我的页面</Text>
                <Text style={MineStyle.textStyle}>修改名</Text>
                <TextInput
                    autoCapitalize={'none'}
                    autoCorrect={false}
                    onChangeText={this.firstNameChangeText}
                    value={rootStore.firstname}
                    placeholder={'请输入要修改的姓'}
                />
                <Text style={MineStyle.textStyle}>修改姓</Text>
                <TextInput
                    autoCapitalize={'none'}
                    autoCorrect={false}
                    onChangeText={this.lastNameChangeText}
                    value={rootStore.lastname}
                    placeholder={'请输入要修改的名'}
                />
            </View>
        );
    }
}

export default Mine;