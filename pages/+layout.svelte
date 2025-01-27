<script>
	import '@evidence-dev/tailwind/fonts.css';
	import '../app.css';
	/* import Fa from 'svelte-fa/dist/fa.svelte' */
	/* import { faCaretDown, faCaretUp } from '@fortawesome/free-solid-svg-icons/index.es' */
	import { EvidenceDefaultLayout } from '@evidence-dev/core-components';
	export let data;
</script>

<EvidenceDefaultLayout {data} title="Human Transport" builtWithEvidence="true">
	<p>TEST</p>
	<slot slot="content" />
</EvidenceDefaultLayout>
