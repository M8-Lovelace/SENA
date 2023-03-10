<template>
    <div>
        <q-list class="iconsList">
            <q-item clickable v-ripple class="item">
                <q-item-section avatar>
                    <router-link to="/" class="row">
                        <img src="../assets/home.png" alt="" width="30" height="30">
                    </router-link>
                </q-item-section>
            </q-item>
            <q-item clickable v-ripple class="item">
                <q-item-section>
                    <router-link to="/login" class="row">
                        <img src="../assets/login.png" alt="" width="30" height="30">
                    </router-link>
                </q-item-section>
            </q-item>
            <q-item clickable v-ripple class="item">
                <q-item-section>
                    <router-link to="/about" class="row link">
                        <img src="../assets/icon.png" alt="" width="30" height="30">
                    </router-link>
                </q-item-section>
            </q-item>
        </q-list>
    </div>
</template>

<style scoped lang="sass">
.iconsList
    margin-top: 15px

.item
    padding-left: 25px
    padding-top: 15px
    padding-bottom: 15px
</style>