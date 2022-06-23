/* Copyright (C) 1998-2018 by Northwoods Software Corporation. All Rights Reserved. */

// When adding samples or extensions, modify this file, samples/all.html, and samples/indexList.js
// along with adding a 400x400 screenshot in assets/images/screenshots.

// Load necessary scripts:
if (window.require) {
    // declare required libraries and ensure Bootstrap's dependency on jQuery
    require.config({
        paths: {
            "highlight": "../assets/js/highlight",
            "jquery": "../assets/js/jquery.min", // 1.11.3
            "bootstrap": "../assets/js/bootstrap.min"
        },
        shim: {
            "bootstrap": ["jquery"]
        }
    });
    require(["highlight", "jquery", "bootstrap"], function () { });
} else {
    function goLoadSrc(filenames) {
        var scripts = document.getElementsByTagName("script");
        var script = null;
        for (var i = 0; i < scripts.length; i++) {
            if (scripts[i].src.indexOf("goSamples") > 0) {
                script = scripts[i];
                break;
            }
        }
        for (var i = 0; i < arguments.length; i++) {
            var filename = arguments[i];
            if (!filename) continue;
            var selt = document.createElement("script");
            selt.async = false;
            selt.defer = false;
            selt.src = "../assets/js/" + filename;
            script.parentNode.insertBefore(selt, script.nextSibling);
            script = selt;
        }
    }

}

var head = document.getElementsByTagName("head")[0];



function goSamples() {
    // determine if it's an extension
    var isExtension = (location.pathname.split('/').slice(-2)[0].indexOf("extensions") >= 0);
    var isTS = (location.pathname.split('/').slice(-2)[0].indexOf("TS") > 0);

    // save the body for goViewSource() before we modify it
    window.bodyHTML = document.body.innerHTML;
    window.bodyHTML = window.bodyHTML.replace(/</g, "&lt;");
    window.bodyHTML = window.bodyHTML.replace(/>/g, "&gt;");

    // look for links to API documentation and convert them
    _traverseDOM(document);

    // wrap the sample div and sidebar in a fluid container
    var container = document.createElement('div');
    container.className = "container-fluid";
    document.body.appendChild(container);

    // sample content
    var samplediv = document.getElementById('sample') || document.body.firstChild;
    samplediv.className = "col-md-10";
    container.appendChild(samplediv);

    // side navigation
    var navindex = document.createElement('div');
    navindex.id = "navindex";
    navindex.className = "col-md-2";
    navindex.innerHTML = isExtension ? myExtensionMenu : mySampleMenu;
    container.insertBefore(navindex, samplediv);

    // top navbar
    var navbar = document.createElement('div');
    navbar.id = "navtop";
    navbar.innerHTML = myNavbar;
    document.body.insertBefore(navbar, container);



    // when the page loads, change the class of navigation LI's
    var url = window.location.href;
    var lindex = url.lastIndexOf('/');
    url = url.slice(lindex + 1).toLowerCase();  // include "/" to avoid matching prefixes
    var lis = document.getElementById("sections").getElementsByTagName("li");
    var l = lis.length;
    var listed = false;
    for (var i = 0; i < l; i++) {
        var anchor = lis[i].childNodes[0];
        // ....../samples/X.html becomes X.html becomes X
        var split = anchor.href.split('/').pop().split('.');
        var imgname = split[0];
        if (imgname === "index" || imgname === "all") continue;
        var imgtype = split[1];
        if (imgtype === "js") continue;
        var span = document.createElement('span');
        span.className = "samplespan";
        var img = document.createElement('img');
        img.height = "200";
        img.src = "../assets/images/screenshots/" + imgname + ".png";
        span.appendChild(img);
        anchor.appendChild(span);
        if (!anchor.href) continue;
        var lowerhref = anchor.href.toLowerCase();
        if (!listed && lowerhref.indexOf('/' + url) !== -1) {
            anchor.className = "selected";
            listed = true;
        }
    }
    if (!listed) {
        lis[lis.length - 1].childNodes[0].className = "selected";
    }

}

// Traverse the whole document and replace <a>TYPENAME</a> with:
//    <a href="../api/symbols/TYPENAME.html">TYPENAME</a>
// and <a>TYPENAME.MEMBERNAME</a> with:
//    <a href="../api/symbols/TYPENAME.html#MEMBERNAME">TYPENAME.MEMBERNAME</a>
function _traverseDOM(node) {
    if (node.nodeType === 1 && node.nodeName === "A" && !node.getAttribute("href")) {
        var text = node.innerHTML.split(".");
        if (text.length === 1) {
            node.setAttribute("href", "../api/symbols/" + text[0] + ".html");
            node.setAttribute("target", "api");
        } else if (text.length === 2) {
            node.setAttribute("href", "../api/symbols/" + text[0] + ".html" + "#" + text[1]);
            node.setAttribute("target", "api");
        } else {
            alert("Unknown API reference: " + node.innerHTML);
        }
    }
    for (var i = 0; i < node.childNodes.length; i++) {
        _traverseDOM(node.childNodes[i]);
    }
}

function goViewSource() {
    // show the code:
    var script = document.getElementById("code");
    if (!script) {
        var scripts = document.getElementsByTagName("script");
        script = scripts[scripts.length - 1];
    }
    var sp1 = document.createElement("pre");
    sp1.setAttribute("class", "javascript");
    sp1.innerHTML = script.innerHTML;
    var samplediv = document.getElementById("sample") || document.body;
    samplediv.appendChild(sp1);

    // show the body:
    var sp2 = document.createElement("pre");
    sp2.innerHTML = window.bodyHTML;
    samplediv.appendChild(sp2);

    window.hdr.children[0].style.display = "none"; // hide the "View Source" link

    // apply formatting
    hljs.highlightBlock(sp1);
    hljs.highlightBlock(sp2);
    window.scrollBy(0, 100);
}

(function (i, s, o, g, r, a, m) {
i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
    (i[r].q = i[r].q || []).push(arguments)
}, i[r].l = 1 * new Date(); a = s.createElement(o),
    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

ga('create', 'UA-1506307-5', 'auto');
ga('send', 'pageview');

var mySampleMenu = '\
  <div class="sidebar-nav">\
    <div class="navbar navbar-default" role="navigation">\
      <div id="DiagramNavbar" class="navbar-collapse collapse sidebar-navbar-collapse">\
        <ul id="sections" class="classList nav navbar-nav">\
          <hr>\
          <li><a href="canvases.html">Canvases</a></li>\
          </ul>\
      </div>\
    </div>\
  </div>';


var myNavbar = '\
  <!-- non-fixed navbar -->\
  <nav id="non-fixed-nav" class="navbar navbar-inverse navbar-top">\
      <div id="navbar" class="navbar-collapse collapse">\
        <ul class="nav navbar-nav navbar-right">\
          <li><a href="../samples/index.html">Samples</a></li>\
            </ul>\
      </div><!--/.nav-collapse -->\
    </div>\
  </nav>';