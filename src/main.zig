const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 177;
const risk_penalty: i32 = 7;
const latency_penalty: i32 = 3;
const weight_bonus: i32 = 5;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 86, .capacity = 70, .latency = 18, .risk = 15, .weight = 6 };
    try std.testing.expectEqual(@as(i32, 113), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "review"));
    const signal_case_2 = Signal{ .demand = 61, .capacity = 92, .latency = 17, .risk = 5, .weight = 12 };
    try std.testing.expectEqual(@as(i32, 188), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "accept"));
    const signal_case_3 = Signal{ .demand = 89, .capacity = 78, .latency = 27, .risk = 15, .weight = 7 };
    try std.testing.expectEqual(@as(i32, 105), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "review"));
}
