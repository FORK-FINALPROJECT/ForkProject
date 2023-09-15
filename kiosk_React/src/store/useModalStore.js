import {create} from 'zustand';

const useModalStore = create((set ,get) => ({
  standeByTimer : null , 
  setStandeByTimer : (standeByTimer) =>  set({ standeByTimer }),

}));

export default useModalStore;