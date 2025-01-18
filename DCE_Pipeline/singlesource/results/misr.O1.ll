; ModuleID = '../misr.c'
source_filename = "../misr.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.cells = type { i32, i32, ptr }

@reg_len = local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%hu\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Register too long; Max. = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1
@str = private unnamed_addr constant [42 x i8] c"Structure does not match Register length:\00", align 1

; Function Attrs: nounwind ssp uwtable(sync)
define range(i32 0, 5) i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.cells, align 8
  %4 = alloca [100 x i8], align 1
  %5 = alloca [3 x i16], align 2
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #12
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %4) #12
  call void @llvm.lifetime.start.p0(i64 6, ptr nonnull %5) #12
  store i32 10, ptr @reg_len, align 4, !tbaa !5
  %6 = icmp sgt i32 %0, 6
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, ptr %4, i64 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(9) %8, i8 48, i64 9, i1 false), !tbaa !9
  store i8 49, ptr %4, align 1, !tbaa !9
  %9 = getelementptr inbounds i8, ptr %4, i64 10
  store i8 0, ptr %9, align 1, !tbaa !9
  br label %14

10:                                               ; preds = %2
  %11 = getelementptr inbounds i8, ptr %1, i64 48
  %12 = load ptr, ptr %11, align 8, !tbaa !10
  %13 = call ptr @__strcpy_chk(ptr noundef nonnull %4, ptr noundef %12, i64 noundef 100) #12
  br label %14

14:                                               ; preds = %7, %10
  %15 = icmp sgt i32 %0, 7
  br i1 %15, label %16, label %20

16:                                               ; preds = %14
  %17 = getelementptr inbounds i8, ptr %1, i64 56
  %18 = load ptr, ptr %17, align 8, !tbaa !10
  %19 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %18, ptr noundef nonnull @.str, ptr noundef nonnull %5)
  br label %21

20:                                               ; preds = %14
  store i16 1, ptr %5, align 2, !tbaa !12
  br label %21

21:                                               ; preds = %20, %16
  %22 = icmp sgt i32 %0, 8
  br i1 %22, label %23, label %28

23:                                               ; preds = %21
  %24 = getelementptr inbounds i8, ptr %1, i64 64
  %25 = load ptr, ptr %24, align 8, !tbaa !10
  %26 = getelementptr inbounds i8, ptr %5, i64 2
  %27 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %25, ptr noundef nonnull @.str, ptr noundef nonnull %26)
  br label %30

28:                                               ; preds = %21
  %29 = getelementptr inbounds i8, ptr %5, i64 2
  store i16 0, ptr %29, align 2, !tbaa !12
  br label %30

30:                                               ; preds = %28, %23
  %31 = icmp sgt i32 %0, 9
  br i1 %31, label %32, label %37

32:                                               ; preds = %30
  %33 = getelementptr inbounds i8, ptr %1, i64 72
  %34 = load ptr, ptr %33, align 8, !tbaa !10
  %35 = getelementptr inbounds i8, ptr %5, i64 4
  %36 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %34, ptr noundef nonnull @.str, ptr noundef nonnull %35)
  br label %39

37:                                               ; preds = %30
  %38 = getelementptr inbounds i8, ptr %5, i64 4
  store i16 0, ptr %38, align 2, !tbaa !12
  br label %39

39:                                               ; preds = %37, %32
  %40 = load i32, ptr @reg_len, align 4, !tbaa !5
  %41 = icmp sgt i32 %40, 100
  br i1 %41, label %42, label %44

42:                                               ; preds = %39
  %43 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 100)
  br label %98

44:                                               ; preds = %39
  %45 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %4) #12
  %46 = sext i32 %40 to i64
  %47 = icmp eq i64 %45, %46
  br i1 %47, label %50, label %48

48:                                               ; preds = %44
  %49 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %98

50:                                               ; preds = %44
  %51 = call ptr @seed48(ptr noundef nonnull %5) #12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 noundef 0, i64 noundef 16, i1 noundef false) #12
  %52 = load i32, ptr @reg_len, align 4, !tbaa !5
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %63, label %54

54:                                               ; preds = %50, %54
  %55 = phi ptr [ %57, %54 ], [ %3, %50 ]
  %56 = phi i32 [ %61, %54 ], [ 0, %50 ]
  %57 = call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #13
  store i32 1, ptr %57, align 8, !tbaa !14
  %58 = getelementptr inbounds i8, ptr %57, i64 4
  store i32 1, ptr %58, align 4, !tbaa !16
  %59 = getelementptr inbounds i8, ptr %57, i64 8
  store ptr null, ptr %59, align 8, !tbaa !17
  %60 = getelementptr inbounds i8, ptr %55, i64 8
  store ptr %57, ptr %60, align 8, !tbaa !17
  %61 = add nuw i32 %56, 1
  %62 = icmp eq i32 %56, %52
  br i1 %62, label %63, label %54, !llvm.loop !18

63:                                               ; preds = %54, %50
  %64 = getelementptr inbounds i8, ptr %3, i64 8
  br label %65

65:                                               ; preds = %63, %78
  %66 = phi i32 [ 0, %63 ], [ %81, %78 ]
  %67 = phi i32 [ 0, %63 ], [ %80, %78 ]
  %68 = load ptr, ptr %64, align 8, !tbaa !17
  %69 = icmp eq ptr %68, null
  br i1 %69, label %78, label %70

70:                                               ; preds = %65, %70
  %71 = phi ptr [ %76, %70 ], [ %68, %65 ]
  %72 = phi ptr [ %71, %70 ], [ %3, %65 ]
  %73 = load i32, ptr %72, align 8, !tbaa !14
  %74 = getelementptr inbounds i8, ptr %72, i64 4
  store i32 %73, ptr %74, align 4, !tbaa !16
  %75 = getelementptr inbounds i8, ptr %71, i64 8
  %76 = load ptr, ptr %75, align 8, !tbaa !17
  %77 = icmp eq ptr %76, null
  br i1 %77, label %78, label %70, !llvm.loop !21

78:                                               ; preds = %70, %65
  %79 = call i32 @simulate(i32 noundef 10, ptr noundef nonnull %3, double noundef 2.500000e-01, ptr noundef nonnull %4)
  %80 = add nuw nsw i32 %79, %67
  %81 = add nuw nsw i32 %66, 1
  %82 = icmp eq i32 %81, 100000
  br i1 %82, label %83, label %65, !llvm.loop !22

83:                                               ; preds = %78
  %84 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4)
  %85 = load i32, ptr @reg_len, align 4, !tbaa !5
  %86 = load i16, ptr %5, align 2, !tbaa !12
  %87 = zext i16 %86 to i32
  %88 = getelementptr inbounds i8, ptr %5, i64 2
  %89 = load i16, ptr %88, align 2, !tbaa !12
  %90 = zext i16 %89 to i32
  %91 = getelementptr inbounds i8, ptr %5, i64 4
  %92 = load i16, ptr %91, align 2, !tbaa !12
  %93 = zext i16 %92 to i32
  %94 = sub nsw i32 100000, %80
  %95 = sitofp i32 %94 to double
  %96 = fdiv double %95, 1.000000e+05
  %97 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %85, i32 noundef 10, double noundef 2.500000e-01, i32 noundef 100000, ptr noundef nonnull %4, i32 noundef %87, i32 noundef %90, i32 noundef %93, double noundef %96)
  br label %98

98:                                               ; preds = %83, %48, %42
  %99 = phi i32 [ 2, %42 ], [ 4, %48 ], [ 0, %83 ]
  call void @llvm.lifetime.end.p0(i64 6, ptr nonnull %5) #12
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %4) #12
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12
  ret i32 %99
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @sscanf(ptr nocapture noundef readonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #3

declare ptr @seed48(ptr noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @create_link_list(ptr noundef %0) local_unnamed_addr #5 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(16) %0, i8 noundef 0, i64 noundef 16, i1 noundef false) #12
  %2 = load i32, ptr @reg_len, align 4, !tbaa !5
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %13, label %4

4:                                                ; preds = %1, %4
  %5 = phi ptr [ %7, %4 ], [ %0, %1 ]
  %6 = phi i32 [ %11, %4 ], [ 0, %1 ]
  %7 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #13
  store i32 1, ptr %7, align 8, !tbaa !14
  %8 = getelementptr inbounds i8, ptr %7, i64 4
  store i32 1, ptr %8, align 4, !tbaa !16
  %9 = getelementptr inbounds i8, ptr %7, i64 8
  store ptr null, ptr %9, align 8, !tbaa !17
  %10 = getelementptr inbounds i8, ptr %5, i64 8
  store ptr %7, ptr %10, align 8, !tbaa !17
  %11 = add nuw i32 %6, 1
  %12 = icmp eq i32 %6, %2
  br i1 %12, label %13, label %4, !llvm.loop !18

13:                                               ; preds = %4, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(readwrite, inaccessiblemem: none) uwtable(sync)
define void @init(ptr nocapture noundef %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8, !tbaa !17
  %4 = icmp eq ptr %3, null
  br i1 %4, label %13, label %5

5:                                                ; preds = %1, %5
  %6 = phi ptr [ %11, %5 ], [ %3, %1 ]
  %7 = phi ptr [ %6, %5 ], [ %0, %1 ]
  %8 = load i32, ptr %7, align 8, !tbaa !14
  %9 = getelementptr inbounds i8, ptr %7, i64 4
  store i32 %8, ptr %9, align 4, !tbaa !16
  %10 = getelementptr inbounds i8, ptr %6, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !17
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %5, !llvm.loop !21

13:                                               ; preds = %5, %1
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define range(i32 0, 2) i32 @simulate(i32 noundef %0, ptr nocapture noundef %1, double noundef %2, ptr nocapture noundef readonly %3) local_unnamed_addr #0 {
  %5 = load i32, ptr @reg_len, align 4, !tbaa !5
  %6 = add nsw i32 %5, -1
  %7 = freeze i32 %6
  %8 = sdiv i32 %7, 31
  %9 = mul i32 %8, 31
  %10 = sub i32 %7, %9
  %11 = getelementptr i8, ptr %3, i64 -1
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %13, label %24

13:                                               ; preds = %4
  %14 = icmp sgt i32 %5, 31
  %15 = icmp sgt i32 %10, 0
  %16 = mul nsw i32 %8, 31
  %17 = tail call i32 @llvm.smax.i32(i32 %8, i32 1)
  %18 = sext i32 %16 to i64
  %19 = zext nneg i32 %17 to i64
  %20 = zext nneg i32 %10 to i64
  %21 = getelementptr i8, ptr %3, i64 %18
  br label %22

22:                                               ; preds = %13, %141
  %23 = phi i32 [ 0, %13 ], [ %158, %141 ]
  br i1 %14, label %27, label %79

24:                                               ; preds = %141, %4
  %25 = load i32, ptr @reg_len, align 4, !tbaa !5
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %160, label %173

27:                                               ; preds = %22, %76
  %28 = phi i64 [ %77, %76 ], [ 0, %22 ]
  %29 = phi ptr [ %66, %76 ], [ %1, %22 ]
  %30 = phi i32 [ %52, %76 ], [ 0, %22 ]
  %31 = phi i32 [ %51, %76 ], [ 0, %22 ]
  %32 = tail call i64 @lrand48() #12
  %33 = mul nuw nsw i64 %28, 31
  %34 = getelementptr inbounds i8, ptr %3, i64 %33
  br label %35

35:                                               ; preds = %27, %50
  %36 = phi i64 [ 0, %27 ], [ %74, %50 ]
  %37 = phi i64 [ %32, %27 ], [ %73, %50 ]
  %38 = phi ptr [ %29, %27 ], [ %66, %50 ]
  %39 = phi i32 [ %30, %27 ], [ %52, %50 ]
  %40 = phi i32 [ %31, %27 ], [ %51, %50 ]
  %41 = getelementptr inbounds i8, ptr %34, i64 %36
  %42 = load i8, ptr %41, align 1, !tbaa !9
  %43 = icmp eq i8 %42, 49
  br i1 %43, label %44, label %50

44:                                               ; preds = %35
  %45 = load i32, ptr %38, align 8, !tbaa !14
  %46 = add nsw i32 %45, %40
  %47 = getelementptr inbounds i8, ptr %38, i64 4
  %48 = load i32, ptr %47, align 4, !tbaa !16
  %49 = add nsw i32 %48, %39
  br label %50

50:                                               ; preds = %44, %35
  %51 = phi i32 [ %46, %44 ], [ %40, %35 ]
  %52 = phi i32 [ %49, %44 ], [ %39, %35 ]
  %53 = getelementptr inbounds i8, ptr %38, i64 8
  %54 = load ptr, ptr %53, align 8, !tbaa !17
  %55 = load i32, ptr %54, align 8, !tbaa !14
  %56 = trunc i64 %37 to i32
  %57 = add i32 %55, %56
  %58 = and i32 %57, 1
  store i32 %58, ptr %38, align 8, !tbaa !14
  %59 = tail call i64 @lrand48() #12
  %60 = srem i64 %59, 1000
  %61 = sitofp i64 %60 to double
  %62 = fdiv double %61, 1.000000e+03
  %63 = fcmp olt double %62, %2
  %64 = zext i1 %63 to i64
  %65 = xor i64 %37, %64
  %66 = load ptr, ptr %53, align 8, !tbaa !17
  %67 = getelementptr inbounds i8, ptr %66, i64 4
  %68 = load i32, ptr %67, align 4, !tbaa !16
  %69 = trunc i64 %65 to i32
  %70 = add i32 %68, %69
  %71 = and i32 %70, 1
  %72 = getelementptr inbounds i8, ptr %38, i64 4
  store i32 %71, ptr %72, align 4, !tbaa !16
  %73 = ashr i64 %37, 1
  %74 = add nuw nsw i64 %36, 1
  %75 = icmp eq i64 %74, 31
  br i1 %75, label %76, label %35, !llvm.loop !23

76:                                               ; preds = %50
  %77 = add nuw nsw i64 %28, 1
  %78 = icmp eq i64 %77, %19
  br i1 %78, label %79, label %27, !llvm.loop !24

79:                                               ; preds = %76, %22
  %80 = phi i32 [ 0, %22 ], [ %51, %76 ]
  %81 = phi i32 [ 0, %22 ], [ %52, %76 ]
  %82 = phi ptr [ %1, %22 ], [ %66, %76 ]
  %83 = tail call i64 @lrand48() #12
  br i1 %15, label %84, label %125

84:                                               ; preds = %79, %99
  %85 = phi i64 [ %123, %99 ], [ 0, %79 ]
  %86 = phi i64 [ %122, %99 ], [ %83, %79 ]
  %87 = phi ptr [ %115, %99 ], [ %82, %79 ]
  %88 = phi i32 [ %101, %99 ], [ %81, %79 ]
  %89 = phi i32 [ %100, %99 ], [ %80, %79 ]
  %90 = getelementptr i8, ptr %21, i64 %85
  %91 = load i8, ptr %90, align 1, !tbaa !9
  %92 = icmp eq i8 %91, 49
  br i1 %92, label %93, label %99

93:                                               ; preds = %84
  %94 = load i32, ptr %87, align 8, !tbaa !14
  %95 = add nsw i32 %94, %89
  %96 = getelementptr inbounds i8, ptr %87, i64 4
  %97 = load i32, ptr %96, align 4, !tbaa !16
  %98 = add nsw i32 %97, %88
  br label %99

99:                                               ; preds = %93, %84
  %100 = phi i32 [ %95, %93 ], [ %89, %84 ]
  %101 = phi i32 [ %98, %93 ], [ %88, %84 ]
  %102 = getelementptr inbounds i8, ptr %87, i64 8
  %103 = load ptr, ptr %102, align 8, !tbaa !17
  %104 = load i32, ptr %103, align 8, !tbaa !14
  %105 = trunc i64 %86 to i32
  %106 = add i32 %104, %105
  %107 = and i32 %106, 1
  store i32 %107, ptr %87, align 8, !tbaa !14
  %108 = tail call i64 @lrand48() #12
  %109 = srem i64 %108, 1000
  %110 = sitofp i64 %109 to double
  %111 = fdiv double %110, 1.000000e+03
  %112 = fcmp olt double %111, %2
  %113 = zext i1 %112 to i64
  %114 = xor i64 %86, %113
  %115 = load ptr, ptr %102, align 8, !tbaa !17
  %116 = getelementptr inbounds i8, ptr %115, i64 4
  %117 = load i32, ptr %116, align 4, !tbaa !16
  %118 = trunc i64 %114 to i32
  %119 = add i32 %117, %118
  %120 = and i32 %119, 1
  %121 = getelementptr inbounds i8, ptr %87, i64 4
  store i32 %120, ptr %121, align 4, !tbaa !16
  %122 = ashr i64 %86, 1
  %123 = add nuw nsw i64 %85, 1
  %124 = icmp eq i64 %123, %20
  br i1 %124, label %125, label %84, !llvm.loop !25

125:                                              ; preds = %99, %79
  %126 = phi i32 [ %80, %79 ], [ %100, %99 ]
  %127 = phi i32 [ %81, %79 ], [ %101, %99 ]
  %128 = phi ptr [ %82, %79 ], [ %115, %99 ]
  %129 = tail call i64 @lrand48() #12
  %130 = load i32, ptr @reg_len, align 4, !tbaa !5
  %131 = sext i32 %130 to i64
  %132 = getelementptr i8, ptr %11, i64 %131
  %133 = load i8, ptr %132, align 1, !tbaa !9
  %134 = icmp eq i8 %133, 49
  br i1 %134, label %135, label %141

135:                                              ; preds = %125
  %136 = load i32, ptr %128, align 8, !tbaa !14
  %137 = add nsw i32 %136, %126
  %138 = getelementptr inbounds i8, ptr %128, i64 4
  %139 = load i32, ptr %138, align 4, !tbaa !16
  %140 = add nsw i32 %139, %127
  br label %141

141:                                              ; preds = %135, %125
  %142 = phi i32 [ %137, %135 ], [ %126, %125 ]
  %143 = phi i32 [ %140, %135 ], [ %127, %125 ]
  %144 = trunc i64 %129 to i32
  %145 = add i32 %142, %144
  %146 = and i32 %145, 1
  store i32 %146, ptr %128, align 8, !tbaa !14
  %147 = tail call i64 @lrand48() #12
  %148 = srem i64 %147, 10000
  %149 = sitofp i64 %148 to double
  %150 = fdiv double %149, 1.000000e+04
  %151 = fcmp olt double %150, %2
  %152 = zext i1 %151 to i64
  %153 = xor i64 %129, %152
  %154 = trunc i64 %153 to i32
  %155 = add i32 %143, %154
  %156 = and i32 %155, 1
  %157 = getelementptr inbounds i8, ptr %128, i64 4
  store i32 %156, ptr %157, align 4, !tbaa !16
  %158 = add nuw nsw i32 %23, 1
  %159 = icmp eq i32 %158, %0
  br i1 %159, label %24, label %22, !llvm.loop !26

160:                                              ; preds = %24, %160
  %161 = phi i32 [ %171, %160 ], [ 0, %24 ]
  %162 = phi ptr [ %170, %160 ], [ %1, %24 ]
  %163 = phi i32 [ %168, %160 ], [ 0, %24 ]
  %164 = load i32, ptr %162, align 8, !tbaa !14
  %165 = getelementptr inbounds i8, ptr %162, i64 4
  %166 = load i32, ptr %165, align 4, !tbaa !16
  %167 = icmp eq i32 %164, %166
  %168 = select i1 %167, i32 %163, i32 1
  %169 = getelementptr inbounds i8, ptr %162, i64 8
  %170 = load ptr, ptr %169, align 8, !tbaa !17
  %171 = add nuw nsw i32 %161, 1
  %172 = icmp eq i32 %171, %25
  br i1 %172, label %173, label %160, !llvm.loop !27

173:                                              ; preds = %160, %24
  %174 = phi i32 [ 0, %24 ], [ %168, %160 ]
  ret i32 %174
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: nounwind ssp uwtable(sync)
define void @kill_list(ptr noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %1, %3
  %4 = phi ptr [ %6, %3 ], [ %0, %1 ]
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  %6 = load ptr, ptr %5, align 8, !tbaa !17
  tail call void @free(ptr noundef %4)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !28

8:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #8

declare i64 @lrand48() local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #11

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { mustprogress nofree nounwind willreturn memory(argmem: read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { nofree norecurse nosync nounwind ssp memory(readwrite, inaccessiblemem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #8 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #9 = { nofree nounwind }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { nounwind }
attributes #13 = { allocsize(0) }

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
!9 = !{!7, !7, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !7, i64 0}
!14 = !{!15, !6, i64 0}
!15 = !{!"cells", !6, i64 0, !6, i64 4, !11, i64 8}
!16 = !{!15, !6, i64 4}
!17 = !{!15, !11, i64 8}
!18 = distinct !{!18, !19, !20}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !19, !20}
!22 = distinct !{!22, !19, !20}
!23 = distinct !{!23, !19, !20}
!24 = distinct !{!24, !19, !20}
!25 = distinct !{!25, !19, !20}
!26 = distinct !{!26, !19, !20}
!27 = distinct !{!27, !19, !20}
!28 = distinct !{!28, !19, !20}
