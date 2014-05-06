var cheerio = require('cheerio'),
fs = require('fs'),
pg = require('pg'),
opath = __dirname + '/output/';

fs.readdir(opath, function(e, files) {
	if (e) {
		throw e;
	}
	files.forEach(function(item, idx) {
		if (item.match(/html$/)) {
			fs.readFile(opath + item, {encoding: 'utf8'}, function(er, data) {
				if (er && ! data) {
					console.log(er);
				} else {
					var $ = cheerio.load(data),
					title = $('font').children()[0];
					if (title) {
						console.log("TITLE: ", title.children[0].data.replace(/\n/g, ''));
					}
				}
			});
		}
	});
});
