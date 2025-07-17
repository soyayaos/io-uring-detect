const std = @import("std");
const linux = std.os.linux;

pub fn main() !void {
    var av: u1 = 0;

    var p = std.mem.zeroes(linux.io_uring_params);
    const result = linux.io_uring_setup(32, &p);
    if (result >= 0) {
        defer _ = linux.close(@intCast(result));
        av = 1;
    }

    std.debug.print("{}", .{av});
    std.process.exit(if (av == 1) 0 else 1);
}
