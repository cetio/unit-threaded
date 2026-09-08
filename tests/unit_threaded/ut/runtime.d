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
