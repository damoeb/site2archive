var page = require('webpage').create(),
    system = require('system'),
    address, output, size;

if (system.args.length < 2) {
    console.log('Usage: render.js <URL>');
    phantom.exit(1);
} 

address = system.args[1];
output = system.args[2];
page.viewportSize = { width: 1024, height: 768 };

page.open(address, function (status) {
    if (status !== 'success') {
        console.log('Unable to load the address!');
        phantom.exit();
    } else {
        window.setTimeout(function () {
            var content = page.content;
            // adding base tag for relative to absolute link resolution done by wget
            content = content.replace(/<head>/ig,'<head><base href="'+address+'">');
	    console.log(content);
            phantom.exit();
        }, 2000);
    }
});
