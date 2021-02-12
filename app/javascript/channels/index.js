// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

var flatpickr = require("flatpickr");
require("./node_modules/flatpickr/dist/flatpickr.min.css");
require("./node_modules/flatpickr/dist/flatpickr.dark.min.css");
flatpickr('#flatpickr-tryme');
