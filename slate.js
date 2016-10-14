// Configs
S.cfga({
    "defaultToCurrentScreen" : true,
    "secondsBetweenRepeat" : 0.1,
    "checkDefaultsOnLoad" : true,
    "focusCheckWidthMax" : 3000,
    "orderScreensLeftToRight" : true
});


// Monitors
var monTbolt  = "2560x1440";
var monLaptop = "1920x1200";

// Operations

var lapFull = S.op("move", {
    "screen" : monLaptop,
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

var lapChat = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-left",
  "width" : "screenSizeX/3",
  "height" : "screenSizeY"
});

var lapMain = lapChat.dup({ "direction" : "top-right", "width" : "2*screenSizeX/3" });

var tboltFull = S.op("move", {
    "screen" : monTbolt,
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

var tboltBig = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX+screenSizeX/3",
  "y" : "screenOriginY",
  "width" : "screenSizeX*2/3",
  "height" : "screenSizeY",
});


var tboltLeft = tboltFull.dup({ "width" : "screenSizeX/3" });
var tboltLeftHalf = tboltFull.dup({ "width" : "screenSizeX/2" });
var tboltRightHalf = tboltLeftHalf.dup({ "x" : "screenSizeX/2" });
var tboltMid = tboltLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
var tboltRight = tboltLeft.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" });
var tboltLeftTop = tboltLeft.dup({ "height" : "screenSizeY/2" });
var tboltLeftBot = tboltLeftTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltMidTop = tboltMid.dup({ "height" : "screenSizeY/2" });
var tboltMidBot = tboltMidTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltRightTop = tboltRight.dup({ "height" : "screenSizeY/2" });
var tboltRightBot = tboltRightTop.dup({ "y" : "screenOriginY+screenSizeY/2" });

// common layout hashes
var lapMainHash = {
    "operations" : [lapMain],
    "ignore-fail" : true,
    "repeat" : true
};
var lapFullHash = {
    "operations" : [lapFull],
    "ignore-fail" : true,
    "repeat" : true
};
var adiumHash = {
    "operations" : [lapChat, lapMain],
    "ignore-fail" : true,
    "title-order" : ["Contacts"],
    "repeat-last" : true
};
var mvimHash = {
    "operations" : [tboltMid, tboltRightTop],
    "repeat" : true
};
var tboltBigHash = {
    "operations" : [tboltBig],
    "sort-title" : true,
    "repeat" : true
};
var tboltFullHash = {
    "operations" : [tboltFull],
    "sort-title" : true,
    "repeat" : true
};

var genBrowserHash = function(regex) {
    return {
        "operations" : [function(windowObject) {
            var title = windowObject.title();
            if (title !== undefined && title.match(regex)) {
                windowObject.doOperation(tboltLeftBot);
            } else {
                windowObject.doOperation(lapFull);
            }
        }],
        "ignore-fail" : true,
        "repeat" : true
    };
}

// 2 monitor layout
var twoMonitorLayout = S.lay("twoMonitor", {
    "iTerm" : tboltFullHash,
    "Google Chrome" : genBrowserHash(/^Developer\sTools\s-\s.+$/),
    "Firefox" : genBrowserHash(/^Firebug\s-\s.+$/),
    "Safari" : lapFullHash,
    "Spotify" : {
      "operations" : [lapFull],
      "repeat" : true
    },
    "TextEdit" : {
      "operations" : [lapFull],
      "repeat" : true
  }
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
    "iTerm2" : lapFullHash,
    "Google Chrome" : lapFullHash,
    "Firefox" : lapFullHash,
    "Safari" : lapFullHash,
    "Pycharm" : lapFullHash,
    "Spotify" : lapFullHash
});

// Defaults
S.def(2, twoMonitorLayout);
S.def(1, oneMonitorLayout);

// Layout Operations
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });

var universalLayout = function() {
    // Should probably make sure the resolutions match but w/e
    S.log("SCREEN COUNT: "+S.screenCount());
    if (S.screenCount() === 2) {
        twoMonitor.run();
    } else if (S.screenCount() === 1) {
        oneMonitor.run();
    }
};


// Batch bind everything. Less typing.
S.bnda({

    // Basic Location Bindings

    "[:ctrl;cmd;alt" : lapChat,
    "pad-:ctrl;cmd;alt" : lapChat,
    "pad+:ctrl;cmd;alt" : lapMain,
    "]:ctrl;cmd;alt" : lapMain,

    // Thirds keyPad

    "pad1:ctrl;cmd;alt" : tboltLeftBot,
    "pad2:ctrl;cmd;alt" : tboltMidBot,
    "pad3:ctrl;cmd;alt" : tboltRightBot,
    "pad4:ctrl;cmd;alt" : tboltLeftTop,
    "pad5:ctrl;cmd;alt" : tboltMidTop,
    "pad6:ctrl;cmd;alt" : tboltRightTop,
    "pad7:ctrl;cmd;alt" : tboltLeft,
    "pad8:ctrl;cmd;alt" : tboltMid,
    "pad9:ctrl;cmd;alt" : tboltRight,
    "padEnter:ctrl;cmd;alt" : lapFull,

    // Thirds Keys

    "m:ctrl;cmd;alt" : tboltLeftBot,
    ",:ctrl;cmd;alt" : tboltMidBot,
    ".:ctrl;cmd;alt" : tboltRightBot,
    "j:ctrl;cmd;alt" : tboltLeftTop,
    "k:ctrl;cmd;alt" : tboltMidTop,
    "l:ctrl;cmd;alt" : tboltRightTop,
    "u:ctrl;cmd;alt" : tboltLeft,
    "i:ctrl;cmd;alt" : tboltMid,
    "o:ctrl;cmd;alt" : tboltRight,
    "return:ctrl;cmd;alt" : lapFull,


    // Resize Bindings
    "right:ctrl;cmd" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
    "left:ctrl;cmd" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
    "up:ctrl;cmd" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
    "down:ctrl;cmd" : S.op("resize", { "width" : "+0", "height" : "+10%" }),

    // Push Bindings
    "right:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
    "left:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }) ,
    "up:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
    "down:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

    // Nudge Bindings
    // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
    "right:ctrl;cmd;alt" : S.op("nudge", { "x" : "+screenSizeX/9", "y" : "+0" }),
    "left:ctrl;cmd;alt" : S.op("nudge", { "x" : "-screenSizeX/9", "y" : "+0" }),
    "up:ctrl;cmd;alt" : S.op("nudge", { "x" : "+0", "y" : "-screenSizeX/9" }),
    "down:ctrl;cmd;alt" : S.op("nudge", { "x" : "+0", "y" : "+screenSizeX/9" }),

    // Window Hints
    "esc:cmd" : S.op("hint"),

    // Grid
    "esc:alt" : S.op("grid")

});


// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
