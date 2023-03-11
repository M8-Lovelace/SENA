import Home from "@/components/Home.vue";
import Form from "@/components/Form.vue";
import { createWebHistory, createRouter } from "vue-router";

const routes = [
  { path: "/", component: Home },
  { path: "/form", component: Form },
  // { path: "/about", component: About },
];

export const router = createRouter({
  history: createWebHistory(),
  routes,
});
