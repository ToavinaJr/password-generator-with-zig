const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const args = try std.process.argsAlloc(std.heap.page_allocator);

    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 2) {
        try stdout.print("Usage: {s} <length> [--symbols] [--numbers]\n", .{args[0]});
        return;
    }

    const length = try std.fmt.parseInt(usize, args[1], 10);

    var use_symbols = false;
    var use_numbers = false;
    for (args) |arg| {
        const slice = std.mem.sliceTo(arg, 0);
        if (std.mem.eql(u8, slice, "--symbols")) {
            use_symbols = true;
        } else if (std.mem.eql(u8, slice, "--numbers")) {
            use_numbers = true;
        }
    }

    try stdout.print("Generating password of length {d}...\n", .{length});

    const password = try generatePassword(length, use_symbols, use_numbers);
    defer std.heap.page_allocator.free(password);

    try stdout.print("Your password is: {s}\n", .{password});
}

fn generatePassword(length: usize, use_symbols: bool, use_numbers: bool) ![]u8 {
    var allocator = std.heap.page_allocator;
    const password = try allocator.alloc(u8, length);

    const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const symbols = "!@#$%^&*()_-+=<>?/";
    const numbers = "0123456789";

    var list = std.ArrayList(u8).init(std.heap.page_allocator);
    defer list.deinit();

    try list.appendSlice(letters);
    if (use_numbers) try list.appendSlice(numbers);
    if (use_symbols) try list.appendSlice(symbols);

    const charset = list.items;

    for (password) |*c| {
        var rand_byte: [1]u8 = undefined;
        std.crypto.random.bytes(&rand_byte); // ✅ plus de `try`
        const index = @mod(rand_byte[0], charset.len);
        c.* = charset[index];
    }

    return password;
}
