<script context="module" lang="ts">
</script>

<script lang="ts">
	import '../css/app.scss';
	import '@fontsource/roboto';
	const bottomLinks = [
		[
			{
				href: '/docs/faq',
				a: 'Faq'
			},
			{
				href: '/docs/rules',
				a: 'Rules'
			},
			{
				href: '/docs/privacy',
				a: 'Privacy'
			}
		],
		[
			{
				href: 'https://github.com/Tricked-dev/ascella',
				a: 'Github'
			}
		],
		[
			{
				href: 'https://dash.ascella.host',
				a: 'Dashboard'
			}
		],
		[
			{
				href: 'https://discord.gg/mY8zTARu4g',
				a: 'Discord'
			},
			{
				a: 'Build by tricked#3777'
			}
		]
	];
	const otherLinks = [
		{
			href: '/docs/domain',
			a: 'Adding your own domain'
		},
		{
			href: '/docs/rules',
			a: 'Rules'
		},
		{
			href: '/docs/privacy',
			a: 'Privacy'
		},
		{
			href: '/docs/',
			a: 'Docs Index'
		},
		{
			href: '/docs/installing',
			a: 'Installing'
		},
		{
			href: '/docs/ascella-desktop',
			a: 'Desktop-App'
		},
		{
			href: '/domains',
			a: 'Domains'
		},
		{
			href: '/contributors',
			a: 'Contributors'
		}
	];
	const topLinks = [
		{
			href: 'https://discord.gg/mY8zTARu4g',
			a: 'Discord'
		},
		{ href: 'https://dash.ascella.host', a: 'Dashboard' },
		{ href: '/', a: 'Home' },
		{ href: '/docs/signup', a: 'Create an account' }
	];
	import { onMount } from 'svelte';
	import { fly, scale } from 'svelte/transition';
	import { quintOut } from 'svelte/easing';
	let meta: Record<string, string> = {
		type: 'website',
		description:
			'Ascella Uploader is an extremely fast image uploader built with the newest technologies.  ' +
			'Ascella is OpenSource you can find the source code at https://github.com/Tricked-dev/ascella',
		title: 'Ascella Uploader - The fastest image uploader',
		keywords: 'javascript typescript programming discord matrix',
		viewport: 'width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no',
		site_name: 'tricked#3777',
		locale: 'en_US'
	};
	let expended = false;
	function setExpended() {
		expended = !expended;
	}
</script>

<svelte:head>
	<title>Ascella Image Uploader</title>
	{#each ['type', 'site_name', 'description', 'title', 'locale'] as item}
		<meta property={`og:${item}`} content={meta[item]} />
		<meta property={`twitter:${item}`} content={meta[item]} />
		<meta property={`${item}`} content={meta[item]} />
	{/each}

	{#if meta.image}
		<meta property="og:image" content={meta.image} />
		<meta name="twitter:card" content="summary_large_image" />
	{/if}

	<meta property="theme-color" content="#1b8aeb" />
	<meta property="robots" content="index,follow" />
	<meta property="googlebot" content="index,follow" />
	<meta property="viewport" content="width=device-width" />

	<script
		async
		defer
		data-website-id="9d7a10ea-0ef7-4e4a-959f-bfe22fc26cfd"
		src="https://analytics.tricked.pro/umami.js"></script>
</svelte:head>

<template class="flex-1 flex">
	<nav class="bg-sky-700">
		<div class="flex flex-col">
			<div class="flex items-center">
				<div class="flex flex-col md:flex-row gap-4 p-2 align-middle">
					<a class="text-sky-200 text-xl" href="https://ascella.host">Ascella.host</a>
					{#each topLinks as link}
						<a class="hover:text-sky-100 text-sky-300 underline text-lg" href={link.href}
							>{link.a}</a
						>
					{/each}
				</div>
				<div class="p-2 items-center">
					<button on:click={setExpended}>
						<p class="flex text-slate-200 gap-2 hover:text-slate-300 underline items-center">
							<svg class="w-5 h-5 -mr-1" viewBox="0 0 20 20" fill="currentColor">
								<path
									fill-rule="evenodd"
									d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
									clip-rule="evenodd"
								/>
							</svg>Documentation
						</p>
					</button>
					<div class="md:hidden inline">
						{#if expended}
							<ul class="flex gap-2 flex-col md:flex-row px-2 pb-1">
								{#each otherLinks as link (link.a)}
									<li transition:scale={{ delay: 250, duration: 300, easing: quintOut }}>
										<a href={link.href} class="text-slate-300 underline hover:text-teal-500"
											>{link.a}</a
										>
									</li>
								{/each}
							</ul>
						{/if}
					</div>
				</div>
			</div>
			<div class="md:inline hidden">
				{#if expended}
					<ul class="flex gap-2 flex-col md:flex-row px-2 pb-1">
						{#each otherLinks as link (link.a)}
							<li transition:scale={{ delay: 250, duration: 300, easing: quintOut }}>
								<a href={link.href} class="text-slate-300 underline hover:text-teal-500">{link.a}</a
								>
							</li>
						{/each}
					</ul>
				{/if}
			</div>
		</div>
	</nav>
	<div class="pb-0.5 bg-sky-800" />
	<div class="pb-4" />
	<slot />

	<div class="pb-7" />
	<div
		class="transform no-underline text-gray-300 hover:text-white min-h-full border-t-2 border-gray-300 hover:border-white pt-6 footer bg-sky-700"
		transition:fly={{ x: 1500, y: 0, duration: 800 }}
	>
		<div class="flex-auto flex list-none">
			{#each bottomLinks as links}
				<div>
					<u>
						{#each links as link}
							<li>
								<a href={link.href} class="px-4 py-2 not-sr-only hover:text-blue-300 translate-x-"
									>{link.a}</a
								>
							</li>
						{/each}
					</u>
				</div>
			{/each}
		</div>
	</div>
</template>

<style lang="postcss">
	/* .a-btn {
		@apply duration-500 block border-b-4 border-blue-300 hover:border-teal-500 mt-4 lg:inline-block lg:mt-0 hover:text-white px-4 py-2 rounded hover:bg-teal-800 mr-2;
	}
	.dropdown:focus-within .dropdown-menu {
		opacity: 1;
		transform: translate(0) scale(1);
		visibility: visible;
	} */
</style>
