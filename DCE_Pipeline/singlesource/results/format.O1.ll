; ModuleID = '../format.c'
source_filename = "../format.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: nofree nosync nounwind ssp memory(argmem: read) uwtable(sync)
define void @veryHugeFunction(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, ptr nocapture noundef %9, i8 noundef signext %10) local_unnamed_addr #0 {
  br label %12

12:                                               ; preds = %31, %11
  %13 = phi i32 [ %4, %11 ], [ %33, %31 ]
  %14 = icmp eq i32 %0, 0
  %15 = icmp eq i32 %3, 10
  %16 = or i1 %14, %15
  br i1 %16, label %34, label %17

17:                                               ; preds = %12
  %18 = add i32 %2, %1
  %19 = add i32 %18, %0
  %20 = add nsw i32 %19, %3
  %21 = add nsw i32 %20, %13
  %22 = add nsw i32 %21, %5
  %23 = add nsw i32 %22, %6
  %24 = add nsw i32 %23, %7
  %25 = add nsw i32 %24, %8
  %26 = getelementptr inbounds i8, ptr %9, i64 4
  %27 = load i32, ptr %26, align 4, !tbaa !5
  %28 = icmp ne i32 %25, %27
  %29 = icmp ne i8 %10, 115
  %30 = or i1 %29, %28
  br i1 %30, label %34, label %31

31:                                               ; preds = %17
  %32 = add nsw i32 %2, %1
  %33 = add nsw i32 %32, %13
  br label %12

34:                                               ; preds = %12, %17
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync)
define noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
  ret i32 0
}

attributes #0 = { nofree nosync nounwind ssp memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
