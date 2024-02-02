const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimise = b.standardOptimizeOptions(.{});
    const exe = b.addExecutable(.{ .name = "game", .target = target, .optimise = optimise });
    exe.addCSourceFile(.{ .file = .{ .path = "src/main.cpp" }, .flags = &.{"-std=c++14"} });
    exe.linkSystemLibrary("raylib");
    exe.linkLibCpp();
    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
