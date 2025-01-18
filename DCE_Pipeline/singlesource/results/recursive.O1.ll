; ModuleID = '../recursive.c'
source_filename = "../recursive.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [15 x i8] c"Ack(3,%d): %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Fib(%.1f): %.1f\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Tak(%d,%d,%d): %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Fib(3): %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Tak(3.0,2.0,1.0): %.1f\0A\00", align 1

; Function Attrs: nofree nosync nounwind ssp memory(none) uwtable(sync)
define range(i32 -2147483647, -2147483648) i32 @ack(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %15, %2
  %4 = phi i32 [ %0, %2 ], [ %10, %15 ]
  %5 = phi i32 [ %1, %2 ], [ %16, %15 ]
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = add nsw i32 %5, 1
  ret i32 %8

9:                                                ; preds = %3
  %10 = add nsw i32 %4, -1
  %11 = icmp eq i32 %5, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %9
  %13 = add nsw i32 %5, -1
  %14 = tail call i32 @ack(i32 noundef %4, i32 noundef %13)
  br label %15

15:                                               ; preds = %9, %12
  %16 = phi i32 [ %14, %12 ], [ 1, %9 ]
  br label %3
}

; Function Attrs: nofree nosync nounwind ssp memory(none) uwtable(sync)
define i32 @fib(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %6, %1
  %3 = phi i32 [ 0, %1 ], [ %10, %6 ]
  %4 = phi i32 [ %0, %1 ], [ %9, %6 ]
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %11, label %6

6:                                                ; preds = %2
  %7 = add nsw i32 %4, -2
  %8 = tail call i32 @fib(i32 noundef %7)
  %9 = add nsw i32 %4, -1
  %10 = add nsw i32 %3, %8
  br label %2

11:                                               ; preds = %2
  %12 = add nsw i32 %3, 1
  ret i32 %12
}

; Function Attrs: nofree nosync nounwind ssp memory(none) uwtable(sync)
define double @fibFP(double noundef %0) local_unnamed_addr #0 {
  %2 = fcmp olt double %0, 2.000000e+00
  br i1 %2, label %3, label %5

3:                                                ; preds = %1, %5
  %4 = phi double [ %10, %5 ], [ 1.000000e+00, %1 ]
  ret double %4

5:                                                ; preds = %1
  %6 = fadd double %0, -2.000000e+00
  %7 = tail call double @fibFP(double noundef %6)
  %8 = fadd double %0, -1.000000e+00
  %9 = tail call double @fibFP(double noundef %8)
  %10 = fadd double %7, %9
  br label %3
}

; Function Attrs: nofree nosync nounwind ssp memory(none) uwtable(sync)
define i32 @tak(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi i32 [ %0, %3 ], [ %11, %9 ]
  %6 = phi i32 [ %1, %3 ], [ %13, %9 ]
  %7 = phi i32 [ %2, %3 ], [ %15, %9 ]
  %8 = icmp slt i32 %6, %5
  br i1 %8, label %9, label %16

9:                                                ; preds = %4
  %10 = add nsw i32 %5, -1
  %11 = tail call i32 @tak(i32 noundef %10, i32 noundef %6, i32 noundef %7)
  %12 = add nsw i32 %6, -1
  %13 = tail call i32 @tak(i32 noundef %12, i32 noundef %7, i32 noundef %5)
  %14 = add nsw i32 %7, -1
  %15 = tail call i32 @tak(i32 noundef %14, i32 noundef %5, i32 noundef %6)
  br label %4

16:                                               ; preds = %4
  ret i32 %7
}

; Function Attrs: nofree nosync nounwind ssp memory(none) uwtable(sync)
define double @takFP(double noundef %0, double noundef %1, double noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %9, %3
  %5 = phi double [ %0, %3 ], [ %11, %9 ]
  %6 = phi double [ %1, %3 ], [ %13, %9 ]
  %7 = phi double [ %2, %3 ], [ %15, %9 ]
  %8 = fcmp olt double %6, %5
  br i1 %8, label %9, label %16

9:                                                ; preds = %4
  %10 = fadd double %5, -1.000000e+00
  %11 = tail call double @takFP(double noundef %10, double noundef %6, double noundef %7)
  %12 = fadd double %6, -1.000000e+00
  %13 = tail call double @takFP(double noundef %12, double noundef %7, double noundef %5)
  %14 = fadd double %7, -1.000000e+00
  %15 = tail call double @takFP(double noundef %14, double noundef %5, double noundef %6)
  br label %4

16:                                               ; preds = %4
  ret double %7
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
  %3 = tail call i32 @ack(i32 noundef 3, i32 noundef 11)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 11, i32 noundef %3)
  %5 = tail call double @fibFP(double noundef 3.800000e+01)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef 3.800000e+01, double noundef %5)
  %7 = tail call i32 @tak(i32 noundef 30, i32 noundef 20, i32 noundef 10)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef 30, i32 noundef 20, i32 noundef 10, i32 noundef %7)
  %9 = tail call i32 @fib(i32 noundef 3)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %9)
  %11 = tail call double @takFP(double noundef 3.000000e+00, double noundef 2.000000e+00, double noundef 1.000000e+00)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, double noundef %11)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { nofree nosync nounwind ssp memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.7"}
