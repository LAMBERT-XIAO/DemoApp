<template>
  <h1>HAHA</h1>
</template>

<script>
import { getUserInfo } from '../services/user'

export default {
  mounted () {
    getUserInfo(this)
  }
}
</script>
