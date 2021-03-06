// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s

lsl z18.b, z28.b, #-1
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 7]
// CHECK-NEXT: lsl z18.b, z28.b, #-1
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z1.b, z9.b, #8
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 7]
// CHECK-NEXT: lsl z1.b, z9.b, #8
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z21.h, z2.h, #-1
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 15]
// CHECK-NEXT: lsl z21.h, z2.h, #-1
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z14.h, z30.h, #16
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 15]
// CHECK-NEXT: lsl z14.h, z30.h, #16
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z6.s, z12.s, #-1
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 31]
// CHECK-NEXT: lsl z6.s, z12.s, #-1
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z23.s, z19.s, #32
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 31]
// CHECK-NEXT: lsl z23.s, z19.s, #32
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z3.d, z24.d, #-1
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 63]
// CHECK-NEXT: lsl z3.d, z24.d, #-1
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

lsl z25.d, z16.d, #64
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: immediate must be an integer in range [0, 63]
// CHECK-NEXT: lsl z25.d, z16.d, #64
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

// Source and Destination Registers must match
lsl z0.b, p0/m, z1.b, z2.b
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: operand must match destination register
// CHECK-NEXT: lsl z0.b, p0/m, z1.b, z2.b
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

// Element sizes must match
lsl z0.b, p0/m, z0.b, z1.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: lsl z0.b, p0/m, z0.b, z1.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

// Predicate not in restricted predicate range
lsl z0.b, p8/m, z0.b, z1.b
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: restricted predicate has range [0, 7].
// CHECK-NEXT: lsl z0.b, p8/m, z0.b, z1.b
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:
