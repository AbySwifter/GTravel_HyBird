/**
 * Created by aby.wang on 2018/4/12.
 */
import { observable, computed, action } from 'mobx';
import { create, persist } from 'mobx-persist';
import { AsyncStorage } from 'react-native';

const hydrate = create({ storage: AsyncStorage });

class RootStore {
    @persist @observable firstname = 'aby';
    @persist @observable lastname = 'Swift';
    @action changeName = (name1, name2) => {
        this.firstname = name1 || this.firstname;
        this.lastname = name2 || this.lastname;
    }
    @computed get allName() {
        return this.firstname + this.lastname;
    }
}

const rootStore = new RootStore();

hydrate('rootStore', rootStore);

export default rootStore;