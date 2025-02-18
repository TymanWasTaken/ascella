<script lang="ts">
	import { getReviews } from '$lib/api';
	import { media } from '$lib/media';
	import { onMount } from 'svelte';

	let Carousel;
	let carousel;

	const handleNextClick = () => {
		carousel.goToNext();
	};

	const features: any[] = [
		{
			title: 'Easily change your settings',
			description:
				"You can change everything via Discord,\nmaking it the perfect image uploader for people who don't want to visit a confusing or cluttered site to just change some settings.",
			image: '/embeds.png'
		},
		{
			title: 'Changing domains',
			description:
				'You can easily change your domain from inside Discord with a single slash command.',
			image: '/domains.png'
		},
		{
			title: 'Dashboard',
			description: 'A simple dashboard to change your domain and other settings.',
			image: '/dashboard.png'
		},
		{
			title: 'Open Source',
			description: "Ascella's code is fully opensource, and you can view the code on github.",
			image: '/github.png'
		},
		{
			title: 'Desktop App',
			description:
				'Ascella has a open source desktop app for both Linux and MacOS, allowing you to make screenshots on all major operating systems.',
			image: '/desktop.png'
		},
		{
			title: 'What are you waiting for?',
			description:
				"Start now by joining the Discord, asking for a code, and redeeming it! It's that simple.",
			image: '/redeem.png'
		}
	];
	import '../css/index.scss';

	$: reviews = [];
	onMount(async () => {
		const [module, revs] = await Promise.all([import('svelte-carousel'), getReviews()]);
		Carousel = module.default;
		reviews = revs;
	});
</script>

<div class="mx-auto md:p-4 p-2">
	<div class="">
		<div class="text-center">
			<h1 class="text-7xl text-sky-100 p-1">Welcome to the Ascella uploader</h1>
			<h2 class="text-sky-100 text-3xl pb-6">
				Looking to score an invite? Join the <a
					class="underline text-green-500"
					href="https://discord.gg/mY8zTARu4g">Discord.</a
				>
			</h2>
		</div>
		<div>
			{#each features as feature, index}
				<div
					class="duration-75 md md:flex-row flex-col flex bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-400 hover:to-blue-400 md:duration-200 md:p-10 p-5 md:m-10 m-5 md:h-96"
				>
					<div class="w-2/3">
						<h1 class="md:text-6xl text-2xl underline decoration-red-500 text-slate-50 pb-6">
							{feature.title}
						</h1>
						<h3 class="md:text-3xl text-xl text-sky-200">{feature.description}</h3>
					</div>
					<div class="md:w-1/3 md:pl-6 md:h-auto h-52 flex justify-center overflow-hidden">
						<img
							alt={feature.description}
							src={feature.image}
							class="w-max object-cover object-left"
						/>
					</div>
				</div>
			{/each}
		</div>
		{#if reviews.length !== 0}
			<div class="p-4">
				<svelte:component
					this={Carousel}
					bind:this={carousel}
					class="w-auto"
					particlesToShow={$media.laptop ? 3 : $media.tablet ? 2 : 1}
					particlesToScroll={$media.laptop || $media.tablet ? 2 : 1}
					autoplay
					autoplayDuration={3500}
					autoplayProgressVisible
					pauseOnFocus
				>
					{#each reviews as review}
						<div>
							<div class="flex text-white text-lg gap-2 bg-[#36393F] p-2 h-full">
								<img class="rounded-[50%] p-2" src={`${review.avatar}`} alt={review.name} />
								<div>
									<p class="text-2xl font-bold text-amber-400">{review.name}</p>
									<p class="text-white">{review.comment}</p>
								</div>
							</div>
						</div>
					{/each}
				</svelte:component>
			</div>
		{/if}

		<!-- {#if reviews.length !== 0}
			<div class="grid justify-center gap-2 w-full">
				<div class="bg-[#36393F] p-4 max-h-48">
					<div class="h-auto">
						{#each reviews as _, index}
							{#if index == image}
								<div in:fly={{ x: 200, duration: 400 }} out:fly={{ x: -200, duration: 400 }}>
									<div class="flex text-white text-lg gap-2 absolute">
										<img
											class="rounded-[50%] p-2"
											src={`${reviews[image].avatar}`}
											alt={reviews[image].name}
											on:error={(e) => {
												//@ts-ignore -
												if (e.target.src == reviews[image + 1].avatar) return;
												//@ts-ignore -
												e.target.src = reviews[image + 1].avatar;
											}}
										/>
										<div>
											<p class="text-2xl font-bold text-amber-400">{reviews[image].name}</p>
											<p class="text-white">{reviews[image].comment}</p>
										</div>
									</div>
								</div>
							{/if}
						{/each}
					</div>

					<div class="md:flex gap-2 justify-center md:w-full hidden ">
						{#each reviews as _, index}
							{#if index == image}
								<button
									on:click={() => (image = index)}
									class="py-1 px-4 bg-slate-400 rounded-lg"
								/>
							{:else}
								<button
									on:click={() => (image = index)}
									class="py-1 px-4 bg-slate-200 rounded-lg"
								/>
							{/if}
						{/each}
					</div>
				</div>
			</div>
		{/if} -->
	</div>
</div>
