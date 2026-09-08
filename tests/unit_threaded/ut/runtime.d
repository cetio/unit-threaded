module unit_threaded.ut.runtime;

import unit_threaded.runtime.runtime;

@("issue 40")
unittest {
    import unit_threaded.should;
    import std.path;
    dubFilesToAbsPaths("", ["foo/bar/package.d"]).shouldEqual(
        [buildPath("foo", "bar")]);
}

@("removePackage")
unittest {
    import unit_threaded.should;
    import std.path;
    removePackage(buildPath("foo", "bar", "package.d")).shouldEqual(
        buildPath("foo", "bar"));
    dubFilesToAbsPaths("", [buildPath("foo", "bar", "package.d")]).shouldEqual(
        [buildPath("foo", "bar")]);
}

@("defaultUtMainPath")
unittest {
    import unit_threaded.should;
    import std.path: buildPath;

    version(Windows) {
        defaultUtMainPath(`C:\Temp`, `D:\projects\unit-threaded`).shouldEqual(buildPath(
            `C:\Temp`,
            "projects",
            "unit-threaded",
            "ut.d",
        ));
        defaultUtMainPath(`C:\Temp`, `\\server\share\unit-threaded`).shouldEqual(
            buildPath(`C:\Temp`, "unit-threaded", "ut.d"));
    } else {
        defaultUtMainPath("/tmp", "/projects/unit-threaded").shouldEqual(
            buildPath("/tmp", "projects", "unit-threaded", "ut.d"));
    }
}
