<template>
  <h1>This is a post vue</h1>
</template>

<script>
import { getUserInfo } from '../services/user'

export default {
  mounted () {
    getUserInfo(this)
  }
}
</script>
