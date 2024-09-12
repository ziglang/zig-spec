const std = @import("std");

const test_targets = [_]std.Target.Query{
    .{},
};

pub fn build(b: *std.Build) !void {
    const test_step = b.step("test", "Test the tests");

    var files = std.ArrayList([]const u8).init(b.allocator);
    defer files.deinit();

    var dir = try std.fs.cwd().openDir("tests", .{ .iterate = true });
    var it = dir.iterate();
    while (try it.next()) |file| {
        if (file.kind != .file) {
            continue;
        }
        try files.append(b.dupe(file.name));
    }

    for (test_targets) |target| {
        for (files.items) |file| {
            const unit_test = b.addTest(.{
                .root_source_file = .{ .path = file },
                .target = b.resolveTargetQuery(target),
            });

            const run_unit_test = b.addRunArtifact(unit_test);
            test_step.dependOn(&run_unit_test.step);
        }
    }

    b.default_step.dependOn(test_step);
}
