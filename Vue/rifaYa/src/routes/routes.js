import Home from "@/components/Home.vue";
import Form from "@/components/Form.vue";
import TicketBook from "@/components/TicketBook.vue";
import { createWebHistory, createRouter } from "vue-router";

const routes = [
  { path: "/", component: Home },
  { path: "/form", component: Form },
  { name: "tickets", path: "/ticket-book", component: TicketBook },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
