/*
 * Jakefile
 * CPArrayController excersice
 *
 * Created by You on July 14, 2012.
 * Copyright 2012, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("CPArrayControllerExcersice", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "CPArrayControllerExcersice.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("CPArrayController excersice");
    task.setIdentifier("com.yourcompany.CPArrayControllerExcersice");
    task.setVersion("1.0");
    task.setAuthor("Your Company");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("CPArrayController excersice");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["CPArrayControllerExcersice"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "CPArrayControllerExcersice", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "CPArrayControllerExcersice", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "CPArrayControllerExcersice"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "CPArrayControllerExcersice"), FILE.join("Build", "Deployment", "CPArrayControllerExcersice")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "CPArrayControllerExcersice"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "CPArrayControllerExcersice"), FILE.join("Build", "Desktop", "CPArrayControllerExcersice", "CPArrayControllerExcersice.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "CPArrayControllerExcersice", "CPArrayControllerExcersice.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "CPArrayControllerExcersice"));
    print("----------------------------");
}
