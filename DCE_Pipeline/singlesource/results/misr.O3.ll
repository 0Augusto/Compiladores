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
  br label %15

10:                                               ; preds = %2
  %11 = getelementptr inbounds i8, ptr %1, i64 48
  %12 = load ptr, ptr %11, align 8, !tbaa !10
  %13 = call ptr @__strcpy_chk(ptr noundef nonnull %4, ptr noundef %12, i64 noundef 100) #12
  %14 = icmp eq i32 %0, 7
  br i1 %14, label %15, label %16

15:                                               ; preds = %7, %10
  store i16 1, ptr %5, align 2, !tbaa !12
  br label %21

16:                                               ; preds = %10
  %17 = getelementptr inbounds i8, ptr %1, i64 56
  %18 = load ptr, ptr %17, align 8, !tbaa !10
  %19 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %18, ptr noundef nonnull @.str, ptr noundef nonnull %5)
  %20 = icmp eq i32 %0, 8
  br i1 %20, label %21, label %23

21:                                               ; preds = %16, %15
  %22 = getelementptr inbounds i8, ptr %5, i64 2
  store i16 0, ptr %22, align 2, !tbaa !12
  br label %34

23:                                               ; preds = %16
  %24 = getelementptr inbounds i8, ptr %1, i64 64
  %25 = load ptr, ptr %24, align 8, !tbaa !10
  %26 = getelementptr inbounds i8, ptr %5, i64 2
  %27 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %25, ptr noundef nonnull @.str, ptr noundef nonnull %26)
  %28 = icmp ugt i32 %0, 9
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = getelementptr inbounds i8, ptr %1, i64 72
  %31 = load ptr, ptr %30, align 8, !tbaa !10
  %32 = getelementptr inbounds i8, ptr %5, i64 4
  %33 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %31, ptr noundef nonnull @.str, ptr noundef nonnull %32)
  br label %36

34:                                               ; preds = %21, %23
  %35 = getelementptr inbounds i8, ptr %5, i64 4
  store i16 0, ptr %35, align 2, !tbaa !12
  br label %36

36:                                               ; preds = %34, %29
  %37 = load i32, ptr @reg_len, align 4, !tbaa !5
  %38 = icmp sgt i32 %37, 100
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 100)
  br label %94

41:                                               ; preds = %36
  %42 = call i64 @strlen(ptr noundef nonnull dereferenceable(1) %4) #12
  %43 = sext i32 %37 to i64
  %44 = icmp eq i64 %42, %43
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %94

47:                                               ; preds = %41
  %48 = call ptr @seed48(ptr noundef nonnull %5) #12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %3, i8 noundef 0, i64 noundef 16, i1 noundef false) #12
  %49 = load i32, ptr @reg_len, align 4, !tbaa !5
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %59, label %51

51:                                               ; preds = %47, %51
  %52 = phi ptr [ %54, %51 ], [ %3, %47 ]
  %53 = phi i32 [ %57, %51 ], [ 0, %47 ]
  %54 = call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #13
  store <2 x i32> <i32 1, i32 1>, ptr %54, align 8, !tbaa !5
  %55 = getelementptr inbounds i8, ptr %54, i64 8
  store ptr null, ptr %55, align 8, !tbaa !14
  %56 = getelementptr inbounds i8, ptr %52, i64 8
  store ptr %54, ptr %56, align 8, !tbaa !14
  %57 = add nuw i32 %53, 1
  %58 = icmp eq i32 %53, %49
  br i1 %58, label %59, label %51, !llvm.loop !16

59:                                               ; preds = %51, %47
  %60 = getelementptr inbounds i8, ptr %3, i64 8
  br label %61

61:                                               ; preds = %59, %74
  %62 = phi i32 [ 0, %59 ], [ %77, %74 ]
  %63 = phi i32 [ 0, %59 ], [ %76, %74 ]
  %64 = load ptr, ptr %60, align 8, !tbaa !14
  %65 = icmp eq ptr %64, null
  br i1 %65, label %74, label %66

66:                                               ; preds = %61, %66
  %67 = phi ptr [ %72, %66 ], [ %64, %61 ]
  %68 = phi ptr [ %67, %66 ], [ %3, %61 ]
  %69 = load i32, ptr %68, align 8, !tbaa !18
  %70 = getelementptr inbounds i8, ptr %68, i64 4
  store i32 %69, ptr %70, align 4, !tbaa !19
  %71 = getelementptr inbounds i8, ptr %67, i64 8
  %72 = load ptr, ptr %71, align 8, !tbaa !14
  %73 = icmp eq ptr %72, null
  br i1 %73, label %74, label %66, !llvm.loop !20

74:                                               ; preds = %66, %61
  %75 = call i32 @simulate(i32 noundef 10, ptr noundef nonnull %3, double noundef 2.500000e-01, ptr noundef nonnull %4)
  %76 = add nuw nsw i32 %75, %63
  %77 = add nuw nsw i32 %62, 1
  %78 = icmp eq i32 %77, 100000
  br i1 %78, label %79, label %61, !llvm.loop !21

79:                                               ; preds = %74
  %80 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4)
  %81 = load i32, ptr @reg_len, align 4, !tbaa !5
  %82 = load i16, ptr %5, align 2, !tbaa !12
  %83 = zext i16 %82 to i32
  %84 = getelementptr inbounds i8, ptr %5, i64 2
  %85 = load i16, ptr %84, align 2, !tbaa !12
  %86 = zext i16 %85 to i32
  %87 = getelementptr inbounds i8, ptr %5, i64 4
  %88 = load i16, ptr %87, align 2, !tbaa !12
  %89 = zext i16 %88 to i32
  %90 = sub nsw i32 100000, %76
  %91 = sitofp i32 %90 to double
  %92 = fdiv double %91, 1.000000e+05
  %93 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %81, i32 noundef 10, double noundef 2.500000e-01, i32 noundef 100000, ptr noundef nonnull %4, i32 noundef %83, i32 noundef %86, i32 noundef %89, double noundef %92)
  br label %94

94:                                               ; preds = %79, %45, %39
  %95 = phi i32 [ 2, %39 ], [ 4, %45 ], [ 0, %79 ]
  call void @llvm.lifetime.end.p0(i64 6, ptr nonnull %5) #12
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %4) #12
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12
  ret i32 %95
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
  br i1 %3, label %12, label %4

4:                                                ; preds = %1, %4
  %5 = phi ptr [ %7, %4 ], [ %0, %1 ]
  %6 = phi i32 [ %10, %4 ], [ 0, %1 ]
  %7 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #13
  store <2 x i32> <i32 1, i32 1>, ptr %7, align 8, !tbaa !5
  %8 = getelementptr inbounds i8, ptr %7, i64 8
  store ptr null, ptr %8, align 8, !tbaa !14
  %9 = getelementptr inbounds i8, ptr %5, i64 8
  store ptr %7, ptr %9, align 8, !tbaa !14
  %10 = add nuw i32 %6, 1
  %11 = icmp eq i32 %6, %2
  br i1 %11, label %12, label %4, !llvm.loop !16

12:                                               ; preds = %4, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(readwrite, inaccessiblemem: none) uwtable(sync)
define void @init(ptr nocapture noundef %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds i8, ptr %0, i64 8
  %3 = load ptr, ptr %2, align 8, !tbaa !14
  %4 = icmp eq ptr %3, null
  br i1 %4, label %13, label %5

5:                                                ; preds = %1, %5
  %6 = phi ptr [ %11, %5 ], [ %3, %1 ]
  %7 = phi ptr [ %6, %5 ], [ %0, %1 ]
  %8 = load i32, ptr %7, align 8, !tbaa !18
  %9 = getelementptr inbounds i8, ptr %7, i64 4
  store i32 %8, ptr %9, align 4, !tbaa !19
  %10 = getelementptr inbounds i8, ptr %6, i64 8
  %11 = load ptr, ptr %10, align 8, !tbaa !14
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %5, !llvm.loop !20

13:                                               ; preds = %5, %1
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define range(i32 0, 2) i32 @simulate(i32 noundef %0, ptr nocapture noundef %1, double noundef %2, ptr nocapture noundef readonly %3) local_unnamed_addr #0 {
  %5 = load i32, ptr @reg_len, align 4, !tbaa !5
  %6 = getelementptr i8, ptr %3, i64 -1
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %26

8:                                                ; preds = %4
  %9 = add nsw i32 %5, -1
  %10 = freeze i32 %9
  %11 = sdiv i32 %10, 31
  %12 = mul i32 %11, 31
  %13 = sub i32 %10, %12
  %14 = icmp sgt i32 %5, 31
  %15 = icmp sgt i32 %13, 0
  %16 = mul nsw i32 %11, 31
  %17 = tail call i32 @llvm.smax.i32(i32 %11, i32 1)
  %18 = sext i32 %16 to i64
  %19 = zext nneg i32 %17 to i64
  %20 = zext nneg i32 %13 to i64
  %21 = getelementptr i8, ptr %3, i64 %18
  br label %22

22:                                               ; preds = %8, %127
  %23 = phi i32 [ 0, %8 ], [ %145, %127 ]
  br i1 %14, label %29, label %75

24:                                               ; preds = %127
  %25 = load i32, ptr @reg_len, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %24, %4
  %27 = phi i32 [ %25, %24 ], [ %5, %4 ]
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %147, label %160

29:                                               ; preds = %22, %72
  %30 = phi i64 [ %73, %72 ], [ 0, %22 ]
  %31 = phi ptr [ %62, %72 ], [ %1, %22 ]
  %32 = phi <2 x i32> [ %48, %72 ], [ zeroinitializer, %22 ]
  %33 = tail call i64 @lrand48() #12
  %34 = mul nuw nsw i64 %30, 31
  %35 = getelementptr inbounds i8, ptr %3, i64 %34
  br label %36

36:                                               ; preds = %29, %47
  %37 = phi i64 [ 0, %29 ], [ %70, %47 ]
  %38 = phi i64 [ %33, %29 ], [ %69, %47 ]
  %39 = phi ptr [ %31, %29 ], [ %62, %47 ]
  %40 = phi <2 x i32> [ %32, %29 ], [ %48, %47 ]
  %41 = getelementptr inbounds i8, ptr %35, i64 %37
  %42 = load i8, ptr %41, align 1, !tbaa !9
  %43 = icmp eq i8 %42, 49
  br i1 %43, label %44, label %47

44:                                               ; preds = %36
  %45 = load <2 x i32>, ptr %39, align 8, !tbaa !5
  %46 = add nsw <2 x i32> %45, %40
  br label %47

47:                                               ; preds = %44, %36
  %48 = phi <2 x i32> [ %46, %44 ], [ %40, %36 ]
  %49 = getelementptr inbounds i8, ptr %39, i64 8
  %50 = load ptr, ptr %49, align 8, !tbaa !14
  %51 = load i32, ptr %50, align 8, !tbaa !18
  %52 = trunc i64 %38 to i32
  %53 = add i32 %51, %52
  %54 = and i32 %53, 1
  store i32 %54, ptr %39, align 8, !tbaa !18
  %55 = tail call i64 @lrand48() #12
  %56 = srem i64 %55, 1000
  %57 = sitofp i64 %56 to double
  %58 = fdiv double %57, 1.000000e+03
  %59 = fcmp olt double %58, %2
  %60 = zext i1 %59 to i64
  %61 = xor i64 %38, %60
  %62 = load ptr, ptr %49, align 8, !tbaa !14
  %63 = getelementptr inbounds i8, ptr %62, i64 4
  %64 = load i32, ptr %63, align 4, !tbaa !19
  %65 = trunc i64 %61 to i32
  %66 = add i32 %64, %65
  %67 = and i32 %66, 1
  %68 = getelementptr inbounds i8, ptr %39, i64 4
  store i32 %67, ptr %68, align 4, !tbaa !19
  %69 = ashr i64 %38, 1
  %70 = add nuw nsw i64 %37, 1
  %71 = icmp eq i64 %70, 31
  br i1 %71, label %72, label %36, !llvm.loop !22

72:                                               ; preds = %47
  %73 = add nuw nsw i64 %30, 1
  %74 = icmp eq i64 %73, %19
  br i1 %74, label %75, label %29, !llvm.loop !23

75:                                               ; preds = %72, %22
  %76 = phi ptr [ %1, %22 ], [ %62, %72 ]
  %77 = phi <2 x i32> [ zeroinitializer, %22 ], [ %48, %72 ]
  %78 = tail call i64 @lrand48() #12
  br i1 %15, label %79, label %115

79:                                               ; preds = %75, %90
  %80 = phi i64 [ %113, %90 ], [ 0, %75 ]
  %81 = phi i64 [ %112, %90 ], [ %78, %75 ]
  %82 = phi ptr [ %105, %90 ], [ %76, %75 ]
  %83 = phi <2 x i32> [ %91, %90 ], [ %77, %75 ]
  %84 = getelementptr i8, ptr %21, i64 %80
  %85 = load i8, ptr %84, align 1, !tbaa !9
  %86 = icmp eq i8 %85, 49
  br i1 %86, label %87, label %90

87:                                               ; preds = %79
  %88 = load <2 x i32>, ptr %82, align 8, !tbaa !5
  %89 = add nsw <2 x i32> %88, %83
  br label %90

90:                                               ; preds = %87, %79
  %91 = phi <2 x i32> [ %89, %87 ], [ %83, %79 ]
  %92 = getelementptr inbounds i8, ptr %82, i64 8
  %93 = load ptr, ptr %92, align 8, !tbaa !14
  %94 = load i32, ptr %93, align 8, !tbaa !18
  %95 = trunc i64 %81 to i32
  %96 = add i32 %94, %95
  %97 = and i32 %96, 1
  store i32 %97, ptr %82, align 8, !tbaa !18
  %98 = tail call i64 @lrand48() #12
  %99 = srem i64 %98, 1000
  %100 = sitofp i64 %99 to double
  %101 = fdiv double %100, 1.000000e+03
  %102 = fcmp olt double %101, %2
  %103 = zext i1 %102 to i64
  %104 = xor i64 %81, %103
  %105 = load ptr, ptr %92, align 8, !tbaa !14
  %106 = getelementptr inbounds i8, ptr %105, i64 4
  %107 = load i32, ptr %106, align 4, !tbaa !19
  %108 = trunc i64 %104 to i32
  %109 = add i32 %107, %108
  %110 = and i32 %109, 1
  %111 = getelementptr inbounds i8, ptr %82, i64 4
  store i32 %110, ptr %111, align 4, !tbaa !19
  %112 = ashr i64 %81, 1
  %113 = add nuw nsw i64 %80, 1
  %114 = icmp eq i64 %113, %20
  br i1 %114, label %115, label %79, !llvm.loop !24

115:                                              ; preds = %90, %75
  %116 = phi ptr [ %76, %75 ], [ %105, %90 ]
  %117 = phi <2 x i32> [ %77, %75 ], [ %91, %90 ]
  %118 = tail call i64 @lrand48() #12
  %119 = load i32, ptr @reg_len, align 4, !tbaa !5
  %120 = sext i32 %119 to i64
  %121 = getelementptr i8, ptr %6, i64 %120
  %122 = load i8, ptr %121, align 1, !tbaa !9
  %123 = icmp eq i8 %122, 49
  br i1 %123, label %124, label %127

124:                                              ; preds = %115
  %125 = load <2 x i32>, ptr %116, align 8, !tbaa !5
  %126 = add nsw <2 x i32> %125, %117
  br label %127

127:                                              ; preds = %124, %115
  %128 = phi <2 x i32> [ %126, %124 ], [ %117, %115 ]
  %129 = trunc i64 %118 to i32
  %130 = extractelement <2 x i32> %128, i64 0
  %131 = add i32 %130, %129
  %132 = and i32 %131, 1
  store i32 %132, ptr %116, align 8, !tbaa !18
  %133 = tail call i64 @lrand48() #12
  %134 = srem i64 %133, 10000
  %135 = sitofp i64 %134 to double
  %136 = fdiv double %135, 1.000000e+04
  %137 = fcmp olt double %136, %2
  %138 = zext i1 %137 to i64
  %139 = xor i64 %118, %138
  %140 = trunc i64 %139 to i32
  %141 = extractelement <2 x i32> %128, i64 1
  %142 = add i32 %141, %140
  %143 = and i32 %142, 1
  %144 = getelementptr inbounds i8, ptr %116, i64 4
  store i32 %143, ptr %144, align 4, !tbaa !19
  %145 = add nuw nsw i32 %23, 1
  %146 = icmp eq i32 %145, %0
  br i1 %146, label %24, label %22, !llvm.loop !25

147:                                              ; preds = %26, %147
  %148 = phi i32 [ %158, %147 ], [ 0, %26 ]
  %149 = phi ptr [ %157, %147 ], [ %1, %26 ]
  %150 = phi i32 [ %155, %147 ], [ 0, %26 ]
  %151 = load i32, ptr %149, align 8, !tbaa !18
  %152 = getelementptr inbounds i8, ptr %149, i64 4
  %153 = load i32, ptr %152, align 4, !tbaa !19
  %154 = icmp eq i32 %151, %153
  %155 = select i1 %154, i32 %150, i32 1
  %156 = getelementptr inbounds i8, ptr %149, i64 8
  %157 = load ptr, ptr %156, align 8, !tbaa !14
  %158 = add nuw nsw i32 %148, 1
  %159 = icmp eq i32 %158, %27
  br i1 %159, label %160, label %147, !llvm.loop !26

160:                                              ; preds = %147, %26
  %161 = phi i32 [ 0, %26 ], [ %155, %147 ]
  ret i32 %161
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
  %6 = load ptr, ptr %5, align 8, !tbaa !14
  tail call void @free(ptr noundef nonnull %4)
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %3, !llvm.loop !27

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
!14 = !{!15, !11, i64 8}
!15 = !{!"cells", !6, i64 0, !6, i64 4, !11, i64 8}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!15, !6, i64 0}
!19 = !{!15, !6, i64 4}
!20 = distinct !{!20, !17}
!21 = distinct !{!21, !17}
!22 = distinct !{!22, !17}
!23 = distinct !{!23, !17}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !17}
