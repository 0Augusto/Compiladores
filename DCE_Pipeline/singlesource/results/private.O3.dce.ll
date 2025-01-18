; ModuleID = 'private.O3.ll'
source_filename = "../private.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define noundef i32 @sum_range(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, ptr nocapture noundef writeonly %4) local_unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %7, label %93

7:                                                ; preds = %5
  %8 = sext i32 %2 to i64
  %9 = zext nneg i32 %1 to i64
  %10 = shl nuw nsw i64 %9, 2
  %11 = getelementptr i8, ptr %4, i64 %10
  %12 = getelementptr i8, ptr %0, i64 4
  %13 = getelementptr i8, ptr %0, i64 32
  %14 = getelementptr i8, ptr %0, i64 64
  %15 = getelementptr i8, ptr %0, i64 96
  br label %16

16:                                               ; preds = %90, %7
  %17 = phi i64 [ 0, %7 ], [ %91, %90 ]
  %18 = getelementptr inbounds i32, ptr %0, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = getelementptr inbounds i32, ptr %4, i64 %17
  store i32 0, ptr %20, align 4, !tbaa !5
  %21 = icmp slt i32 %19, %2
  br i1 %21, label %22, label %90

22:                                               ; preds = %16
  %23 = sext i32 %19 to i64
  %24 = xor i64 %23, -1
  %25 = add nsw i64 %24, %8
  %26 = lshr i64 %25, 1
  %27 = add nuw i64 %26, 1
  %28 = icmp ult i64 %25, 32
  br i1 %28, label %79, label %29

29:                                               ; preds = %22
  %30 = shl nsw i64 %23, 2
  %31 = getelementptr i8, ptr %0, i64 %30
  %32 = xor i64 %23, -1
  %33 = add nsw i64 %32, %8
  %34 = shl nsw i64 %33, 2
  %35 = and i64 %34, -8
  %36 = getelementptr i8, ptr %12, i64 %35
  %37 = getelementptr i8, ptr %36, i64 %30
  %38 = icmp ugt ptr %37, %4
  %39 = icmp ult ptr %31, %11
  %40 = and i1 %38, %39
  br i1 %40, label %79, label %41

41:                                               ; preds = %29
  %42 = and i64 %27, 15
  %43 = icmp eq i64 %42, 0
  %44 = select i1 %43, i64 16, i64 %42
  %45 = sub i64 %27, %44
  %46 = shl i64 %45, 1
  %47 = add i64 %46, %23
  br label %48

48:                                               ; preds = %48, %41
  %49 = phi i64 [ 0, %41 ], [ %72, %48 ]
  %50 = phi <4 x i32> [ zeroinitializer, %41 ], [ %68, %48 ]
  %51 = phi <4 x i32> [ zeroinitializer, %41 ], [ %69, %48 ]
  %52 = phi <4 x i32> [ zeroinitializer, %41 ], [ %70, %48 ]
  %53 = phi <4 x i32> [ zeroinitializer, %41 ], [ %71, %48 ]
  %54 = shl i64 %49, 1
  %55 = add i64 %54, %23
  %56 = getelementptr inbounds i32, ptr %0, i64 %55
  %57 = getelementptr i32, ptr %13, i64 %55
  %58 = getelementptr i32, ptr %14, i64 %55
  %59 = getelementptr i32, ptr %15, i64 %55
  %60 = load <8 x i32>, ptr %56, align 4, !tbaa !5
  %61 = load <8 x i32>, ptr %57, align 4, !tbaa !5
  %62 = load <8 x i32>, ptr %58, align 4, !tbaa !5
  %63 = load <8 x i32>, ptr %59, align 4, !tbaa !5
  %64 = shufflevector <8 x i32> %60, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %65 = shufflevector <8 x i32> %61, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %66 = shufflevector <8 x i32> %62, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %67 = shufflevector <8 x i32> %63, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %68 = add <4 x i32> %50, %64
  %69 = add <4 x i32> %51, %65
  %70 = add <4 x i32> %52, %66
  %71 = add <4 x i32> %53, %67
  %72 = add nuw i64 %49, 16
  %73 = icmp eq i64 %72, %45
  br i1 %73, label %74, label %48, !llvm.loop !9

74:                                               ; preds = %48
  %75 = add <4 x i32> %69, %68
  %76 = add <4 x i32> %70, %75
  %77 = add <4 x i32> %71, %76
  %78 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %77)
  store i32 %78, ptr %20, align 4, !tbaa !5
  br label %79

79:                                               ; preds = %74, %29, %22
  %80 = phi i64 [ %23, %29 ], [ %23, %22 ], [ %47, %74 ]
  %81 = phi i32 [ 0, %29 ], [ 0, %22 ], [ %78, %74 ]
  br label %82

82:                                               ; preds = %82, %79
  %83 = phi i64 [ %88, %82 ], [ %80, %79 ]
  %84 = phi i32 [ %87, %82 ], [ %81, %79 ]
  %85 = getelementptr inbounds i32, ptr %0, i64 %83
  %86 = load i32, ptr %85, align 4, !tbaa !5
  %87 = add nsw i32 %84, %86
  store i32 %87, ptr %20, align 4, !tbaa !5
  %88 = add nsw i64 %83, 2
  %89 = icmp slt i64 %88, %8
  br i1 %89, label %82, label %90, !llvm.loop !13

90:                                               ; preds = %82, %16
  %91 = add nuw nsw i64 %17, 1
  %92 = icmp eq i64 %91, %9
  br i1 %92, label %93, label %16, !llvm.loop !14

93:                                               ; preds = %90, %5
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync)
define noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #1 {
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

attributes #0 = { nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10}
