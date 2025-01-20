const { XMLParser, XMLBuilder, XMLValidator} = require("fast-xml-parser");
const fs = require("node:fs");

const TESTSUITE_NAME_MAX_LENGTH = 40;
const TESTCASE_NAME_MAX_LENGTH = 60;
const EMOJI_FAILURE = '⛔';
const EMOJI_SUCCESS = '✅';

const dirIndex = process.argv.indexOf('-d');
var dirValue;
if (dirIndex > -1) {
    dirValue = (process.argv[dirIndex + 1] || __dirname);
}

var files = fs.readdirSync(dirValue).filter(fn => fn.endsWith('.xml')).filter(fn => fn.startsWith('TEST'));

const options = {
    ignoreAttributes: false,
    allowBooleanAttributes: true,
    suppressBooleanAttributes: false,
    format: true
}
const parser = new XMLParser(options);
const builder = new XMLBuilder(options);

var testsuite=[];
var result = '';
for(const file of files){
    var ts = parser.parse(fs.readFileSync(`${dirValue}/${file}`, 'utf8'));
    delete ts['?xml'];
    result += buildTestsuiteContent(ts.testsuite);
}

function buildTestsuiteContent(ts){
    // console.log(ts);

    var emoji = ts['@_failures'] > 0 ? EMOJI_FAILURE : EMOJI_SUCCESS;
    var name = ts['@_name'].length <= TESTSUITE_NAME_MAX_LENGTH ? 
    ts['@_name'] :
    ts['@_name'].substring(0, TESTSUITE_NAME_MAX_LENGTH - 3) + '...';

    var tcContent = '';
    ts['testcase'].forEach((tc) => tcContent += buildTestcaseContent(tc))
    
    return `<details>\n` +
    `\t<summary><h4>${emoji} ${name}</h4> <i>` + 
    `Tests: [ <b>${ts['@_tests']}</b> ], ` + 
    `Failures: [ <b>${ts['@_failures']}</b> ], ` + 
    `Errors: [ <b>${ts['@_errors']}</b> ], ` + 
    `Time: [ <b>${ts['@_time']}s</b> ]</i></summary>\n` +
    tcContent + 
    `</details>\n`;
}

function buildTestcaseContent(tc){
    console.log(tc);

    var emoji = tc['failure'] != undefined && tc.failure['#text'] != '' ? EMOJI_FAILURE : EMOJI_SUCCESS;
    var name = tc['@_name'].length <= TESTCASE_NAME_MAX_LENGTH ? 
    tc['@_name'] :
    tc['@_name'].substring(0, TESTSUITE_NAME_MAX_LENGTH - 3) + '...';
    var failureText = tc['failure'] != undefined && tc.failure['#text'] != '' ? tc.failure['#text'] : ''

    return `\t<details>\n` +
    `\t\t<summary>${emoji} ${name} <i>Time: [ <b>${tc['@_time']}s</b> ]</i></summary>\n` +
    `\t\t\t~~~html\n` + 
    `${failureText}` + 
    `\n~~~` +
    `\t</details>\n`;
}

const testsuites = builder.build(
    { "testsuites": { 
        "testsuite": testsuite
        }
    });


fs.writeFileSync(`${dirValue}/markdown.md`, result);
