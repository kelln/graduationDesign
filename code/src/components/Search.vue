<template>
	<div id="app">
		<div class="search">
			<el-input placeholder="你想去哪?"  v-model="search">
				<el-button slot="append" icon="search"></el-button>
			</el-input>
		</div>
		<div class="card">
			<card :cardInfo = "areaInfo"></card>
		</div>
	</div>
</template>

<script>
	import Card from './Card.vue'

	export default {
		props: [
			'areaInfo'
		],
		data() {
			return {
				search: '',
				selectResult: '',
			}
		},
		created() {
			
				
			
		},
		components: {
			'card': Card,
		}
	}
</script>

<style scoped>
	.search {
		margin-top: 50px;
	}
	.el-input {
		width: 60%;
	}
</style>