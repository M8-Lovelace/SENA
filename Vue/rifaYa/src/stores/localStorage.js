// Importamos la función de Pinia para definir el store
import { defineStore } from "pinia";

export const useStorage = defineStore("storage", {
  // Estado inicial
  state: () => ({
    data: JSON.parse(localStorage.getItem("myTickets")) ?? [],
    activeId: 0,
  }),
  getters: {
    getStorage(state) {
      return state.data;
    },
    getActiveId(state) {
      return state.activeId;
    },
  },
  actions: {
    addStorage(ticket) {
      this.data.push(ticket);
      localStorage.setItem("myTickets", JSON.stringify(this.data));
    },
    setActiveId(value) {
      this.activeId = value;
    },
    modifyData(id, data) {
      this.data[id] = data;
      localStorage.setItem("myTickets", JSON.stringify(this.data));
    }
  },
});
