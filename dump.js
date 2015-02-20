var page = require('webpage').create(),
    system = require('system'),
    address, output, size;

if (system.args.length < 2) {
    console.log('Usage: dump.js <URL>');
    phantom.exit(1);
} 

address = system.args[1];
output = system.args[2];
page.viewportSize = { width: 1024, height: 768 };

/*
if (system.args.length > 3 && system.args[2].substr(-4) === ".pdf") {
    size = system.args[3].split('*');
    page.paperSize = size.length === 2 ? { width: size[0], height: size[1], margin: '0px' }
        : { format: system.args[3], orientation: 'portrait', margin: '1cm' };
}

if (system.args.length > 4) {
    page.zoomFactor = system.args[4];
}
*/

page.open(address, function (status) {
    if (status !== 'success') {
        console.log('Unable to load the address!');
        phantom.exit();
    } else {
        window.setTimeout(function () {
            var content = page.content;
            console.log('Content: ' + content);
            phantom.exit();
        }, 2000);
    }
});
