// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

import Elm from './main';

const elmDiv = document.querySelector('#elm_target');

if (elmDiv) {
  Elm.Main.embed(elmDiv);
}

// $('.node-bubble button').on('click', function() {
//   $('.node-bubble button').each(function () {
//     $(this).removeClass('accent bg-accent white');
//     $(this).addClass('black-40');
//   });
//   $(this).addClass('white bg-accent');
// });


$('#conversation_place').on('click', '.node-bubble button', function() {
  $(this).siblings('button').removeClass('accent bg-accent white').addClass('black-40');
  $(this).siblings('button').prop('disabled', true);
  $(this).prop('disabled', true);
  $(this).removeClass('accent').addClass('white bg-accent').css('border', '1px solid #4A72FF');
});

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
