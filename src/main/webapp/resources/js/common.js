const fe = async function(url, config) {
	const res = await fetch(url, config);
	if (!res.ok) {
		console.log(res);
	};
	return await res.json();
};

function searchUrl() {
	const searchObjs = document.querySelectorAll('#searchOption [id]')
	let url = '?';
	for (let searchObj of searchObjs) {
		url += searchObj.id + '=' + searchObj.value + '&';
	}
	return url;
}