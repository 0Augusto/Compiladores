; ModuleID = '../exptree.c'
source_filename = "../exptree.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.Comb = type { i32, i32, i32 }

@__stderrp = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [29 x i8] c"Out of memory for work list\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"Out of memory for combination list\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c" d%d \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"%d=%d\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"; \00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@stopSearch = internal unnamed_addr global i1 false, align 4
@nbNodes = internal unnamed_addr global i32 0, align 4
@dmax = internal unnamed_addr global i32 0, align 4
@workList = internal unnamed_addr global ptr null, align 8
@listLength = internal unnamed_addr global i32 0, align 4
@goal = internal unnamed_addr global i32 0, align 4
@best = internal unnamed_addr global i32 0, align 4
@bestDepth = internal unnamed_addr global i32 0, align 4
@solution = internal unnamed_addr global ptr null, align 8
@combList = internal unnamed_addr global ptr null, align 8
@__stdinp = external local_unnamed_addr global ptr, align 8
@str.14 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: nounwind ssp uwtable(sync)
define noalias noundef ptr @newWorkList(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call ptr @calloc(i64 noundef %2, i64 noundef 4) #13
  %4 = icmp eq ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  ret ptr %3

6:                                                ; preds = %1
  %7 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %8 = tail call i64 @fwrite(ptr nonnull @.str, i64 28, i64 1, ptr %7)
  tail call void @exit(i32 noundef 1) #14
  unreachable
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define noalias noundef ptr @newCombList(i32 noundef %0) local_unnamed_addr #0 {
  %2 = sext i32 %0 to i64
  %3 = tail call ptr @calloc(i64 noundef %2, i64 noundef 12) #13
  %4 = icmp eq ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  ret ptr %3

6:                                                ; preds = %1
  %7 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %8 = tail call i64 @fwrite(ptr nonnull @.str.1, i64 35, i64 1, ptr %7)
  tail call void @exit(i32 noundef 1) #14
  unreachable
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @initWorkList(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %14

5:                                                ; preds = %3
  %6 = zext nneg i32 %2 to i64
  br label %7

7:                                                ; preds = %5, %7
  %8 = phi i64 [ 0, %5 ], [ %12, %7 ]
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !9
  %11 = getelementptr inbounds i32, ptr %0, i64 %8
  store i32 %10, ptr %11, align 4, !tbaa !9
  %12 = add nuw nsw i64 %8, 1
  %13 = icmp eq i64 %12, %6
  br i1 %13, label %14, label %7, !llvm.loop !11

14:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: write) uwtable(sync)
define void @initCombList(ptr nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = zext nneg i32 %1 to i64
  br label %6

6:                                                ; preds = %4, %6
  %7 = phi i64 [ 0, %4 ], [ %9, %6 ]
  %8 = getelementptr inbounds %struct.Comb, ptr %0, i64 %7, i32 2
  store i32 0, ptr %8, align 4, !tbaa !14
  %9 = add nuw nsw i64 %7, 1
  %10 = icmp eq i64 %9, %5
  br i1 %10, label %11, label %6, !llvm.loop !16

11:                                               ; preds = %6, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @saveSolution(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  %6 = zext nneg i32 %2 to i64
  br label %7

7:                                                ; preds = %5, %7
  %8 = phi i64 [ 0, %5 ], [ %18, %7 ]
  %9 = getelementptr inbounds %struct.Comb, ptr %1, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !17
  %11 = getelementptr inbounds %struct.Comb, ptr %0, i64 %8
  store i32 %10, ptr %11, align 4, !tbaa !17
  %12 = getelementptr inbounds i8, ptr %9, i64 4
  %13 = load i32, ptr %12, align 4, !tbaa !18
  %14 = getelementptr inbounds i8, ptr %11, i64 4
  store i32 %13, ptr %14, align 4, !tbaa !18
  %15 = getelementptr inbounds i8, ptr %9, i64 8
  %16 = load i32, ptr %15, align 4, !tbaa !14
  %17 = getelementptr inbounds i8, ptr %11, i64 8
  store i32 %16, ptr %17, align 4, !tbaa !14
  %18 = add nuw nsw i64 %8, 1
  %19 = icmp eq i64 %18, %6
  br i1 %19, label %20, label %7, !llvm.loop !19

20:                                               ; preds = %7, %3
  %21 = sext i32 %2 to i64
  %22 = getelementptr inbounds %struct.Comb, ptr %0, i64 %21, i32 2
  store i32 0, ptr %22, align 4, !tbaa !14
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define i32 @calculate(ptr nocapture noundef readonly %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds i8, ptr %0, i64 8
  %3 = load i32, ptr %2, align 4, !tbaa !14
  switch i32 %3, label %24 [
    i32 1, label %4
    i32 2, label %9
    i32 3, label %14
    i32 4, label %19
  ]

4:                                                ; preds = %1
  %5 = load i32, ptr %0, align 4, !tbaa !17
  %6 = getelementptr inbounds i8, ptr %0, i64 4
  %7 = load i32, ptr %6, align 4, !tbaa !18
  %8 = add nsw i32 %7, %5
  br label %24

9:                                                ; preds = %1
  %10 = load i32, ptr %0, align 4, !tbaa !17
  %11 = getelementptr inbounds i8, ptr %0, i64 4
  %12 = load i32, ptr %11, align 4, !tbaa !18
  %13 = sub nsw i32 %10, %12
  br label %24

14:                                               ; preds = %1
  %15 = load i32, ptr %0, align 4, !tbaa !17
  %16 = getelementptr inbounds i8, ptr %0, i64 4
  %17 = load i32, ptr %16, align 4, !tbaa !18
  %18 = mul nsw i32 %17, %15
  br label %24

19:                                               ; preds = %1
  %20 = load i32, ptr %0, align 4, !tbaa !17
  %21 = getelementptr inbounds i8, ptr %0, i64 4
  %22 = load i32, ptr %21, align 4, !tbaa !18
  %23 = sdiv i32 %20, %22
  br label %24

24:                                               ; preds = %1, %19, %14, %9, %4
  %25 = phi i32 [ %23, %19 ], [ %18, %14 ], [ %13, %9 ], [ %8, %4 ], [ 0, %1 ]
  ret i32 %25
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @printSolution(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %54

4:                                                ; preds = %2
  %5 = add nsw i32 %1, -1
  %6 = sext i32 %5 to i64
  %7 = zext nneg i32 %1 to i64
  br label %8

8:                                                ; preds = %4, %51
  %9 = phi i64 [ 0, %4 ], [ %52, %51 ]
  %10 = getelementptr inbounds %struct.Comb, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !17
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %11)
  %13 = getelementptr inbounds i8, ptr %10, i64 8
  %14 = load i32, ptr %13, align 4, !tbaa !14
  switch i32 %14, label %25 [
    i32 0, label %15
    i32 1, label %17
    i32 2, label %19
    i32 3, label %21
    i32 4, label %23
  ]

15:                                               ; preds = %8
  %16 = tail call i32 @putchar(i32 32)
  br label %27

17:                                               ; preds = %8
  %18 = tail call i32 @putchar(i32 43)
  br label %27

19:                                               ; preds = %8
  %20 = tail call i32 @putchar(i32 45)
  br label %27

21:                                               ; preds = %8
  %22 = tail call i32 @putchar(i32 42)
  br label %27

23:                                               ; preds = %8
  %24 = tail call i32 @putchar(i32 58)
  br label %27

25:                                               ; preds = %8
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef %14)
  br label %27

27:                                               ; preds = %25, %23, %21, %19, %17, %15
  %28 = getelementptr inbounds i8, ptr %10, i64 4
  %29 = load i32, ptr %28, align 4, !tbaa !18
  %30 = load i32, ptr %13, align 4, !tbaa !14
  switch i32 %30, label %43 [
    i32 1, label %31
    i32 2, label %34
    i32 3, label %37
    i32 4, label %40
  ]

31:                                               ; preds = %27
  %32 = load i32, ptr %10, align 4, !tbaa !17
  %33 = add nsw i32 %32, %29
  br label %43

34:                                               ; preds = %27
  %35 = load i32, ptr %10, align 4, !tbaa !17
  %36 = sub nsw i32 %35, %29
  br label %43

37:                                               ; preds = %27
  %38 = load i32, ptr %10, align 4, !tbaa !17
  %39 = mul nsw i32 %38, %29
  br label %43

40:                                               ; preds = %27
  %41 = load i32, ptr %10, align 4, !tbaa !17
  %42 = sdiv i32 %41, %29
  br label %43

43:                                               ; preds = %27, %31, %34, %37, %40
  %44 = phi i32 [ %42, %40 ], [ %39, %37 ], [ %36, %34 ], [ %33, %31 ], [ 0, %27 ]
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef %29, i32 noundef %44)
  %46 = icmp slt i64 %9, %6
  br i1 %46, label %47, label %49

47:                                               ; preds = %43
  %48 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10)
  br label %51

49:                                               ; preds = %43
  %50 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14)
  br label %51

51:                                               ; preds = %47, %49
  %52 = add nuw nsw i64 %9, 1
  %53 = icmp eq i64 %52, %7
  br i1 %53, label %54, label %8, !llvm.loop !20

54:                                               ; preds = %51, %2
  %55 = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @printList(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #7 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %20

5:                                                ; preds = %3
  %6 = zext nneg i32 %1 to i64
  br label %7

7:                                                ; preds = %5, %17
  %8 = phi i64 [ 0, %5 ], [ %18, %17 ]
  %9 = trunc nuw nsw i64 %8 to i32
  %10 = shl nuw i32 1, %9
  %11 = and i32 %10, %2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %7
  %14 = getelementptr inbounds i32, ptr %0, i64 %8
  %15 = load i32, ptr %14, align 4, !tbaa !9
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef %15)
  br label %17

17:                                               ; preds = %7, %13
  %18 = add nuw nsw i64 %8, 1
  %19 = icmp eq i64 %18, %6
  br i1 %19, label %20, label %7, !llvm.loop !21

20:                                               ; preds = %17, %3
  %21 = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @recSearch(i32 noundef %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = load i1, ptr @stopSearch, align 4
  br i1 %3, label %141, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr @nbNodes, align 4, !tbaa !9
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr @nbNodes, align 4, !tbaa !9
  %7 = load i32, ptr @dmax, align 4, !tbaa !9
  %8 = icmp eq i32 %7, %0
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = sext i32 %0 to i64
  %11 = add nsw i32 %0, 1
  br label %51

12:                                               ; preds = %4
  %13 = load ptr, ptr @workList, align 8, !tbaa !5
  %14 = load i32, ptr @listLength, align 4, !tbaa !9
  %15 = add nsw i32 %14, %0
  %16 = sext i32 %15 to i64
  %17 = getelementptr i32, ptr %13, i64 %16
  %18 = getelementptr i8, ptr %17, i64 -4
  %19 = load i32, ptr %18, align 4, !tbaa !9
  %20 = load i32, ptr @goal, align 4, !tbaa !9
  %21 = sub nsw i32 %19, %20
  %22 = tail call i32 @llvm.abs.i32(i32 %21, i1 true)
  %23 = load i32, ptr @best, align 4, !tbaa !9
  %24 = sub nsw i32 %23, %20
  %25 = tail call i32 @llvm.abs.i32(i32 %24, i1 true)
  %26 = icmp ult i32 %22, %25
  br i1 %26, label %27, label %141

27:                                               ; preds = %12
  store i32 %19, ptr @best, align 4, !tbaa !9
  store i32 %0, ptr @bestDepth, align 4, !tbaa !9
  %28 = load ptr, ptr @solution, align 8, !tbaa !5
  %29 = load ptr, ptr @combList, align 8, !tbaa !5
  %30 = icmp sgt i32 %0, 0
  br i1 %30, label %31, label %46

31:                                               ; preds = %27
  %32 = zext nneg i32 %0 to i64
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i64 [ 0, %31 ], [ %44, %33 ]
  %35 = getelementptr inbounds %struct.Comb, ptr %29, i64 %34
  %36 = load i32, ptr %35, align 4, !tbaa !17
  %37 = getelementptr inbounds %struct.Comb, ptr %28, i64 %34
  store i32 %36, ptr %37, align 4, !tbaa !17
  %38 = getelementptr inbounds i8, ptr %35, i64 4
  %39 = load i32, ptr %38, align 4, !tbaa !18
  %40 = getelementptr inbounds i8, ptr %37, i64 4
  store i32 %39, ptr %40, align 4, !tbaa !18
  %41 = getelementptr inbounds i8, ptr %35, i64 8
  %42 = load i32, ptr %41, align 4, !tbaa !14
  %43 = getelementptr inbounds i8, ptr %37, i64 8
  store i32 %42, ptr %43, align 4, !tbaa !14
  %44 = add nuw nsw i64 %34, 1
  %45 = icmp eq i64 %44, %32
  br i1 %45, label %46, label %33, !llvm.loop !19

46:                                               ; preds = %33, %27
  %47 = sext i32 %0 to i64
  %48 = getelementptr inbounds %struct.Comb, ptr %28, i64 %47, i32 2
  store i32 0, ptr %48, align 4, !tbaa !14
  %49 = icmp eq i32 %19, %20
  br i1 %49, label %50, label %141

50:                                               ; preds = %46
  tail call void @printSolution(ptr noundef %29, i32 noundef %0)
  store i1 true, ptr @stopSearch, align 4
  br label %141

51:                                               ; preds = %9, %138
  %52 = phi i32 [ 1, %9 ], [ %139, %138 ]
  %53 = load i32, ptr @listLength, align 4, !tbaa !9
  %54 = add nsw i32 %53, %0
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %138

56:                                               ; preds = %51
  %57 = add nsw i32 %52, -3
  %58 = icmp ult i32 %57, 2
  br label %59

59:                                               ; preds = %56, %132
  %60 = phi i64 [ 0, %56 ], [ %133, %132 ]
  %61 = trunc nuw nsw i64 %60 to i32
  %62 = shl nuw i32 1, %61
  %63 = and i32 %62, %1
  %64 = icmp eq i32 %63, 0
  %65 = icmp ne i64 %60, 0
  %66 = and i1 %64, %65
  br i1 %66, label %67, label %132

67:                                               ; preds = %59
  %68 = or i32 %62, %1
  br label %69

69:                                               ; preds = %67, %129
  %70 = phi i64 [ 0, %67 ], [ %130, %129 ]
  %71 = trunc nuw nsw i64 %70 to i32
  %72 = shl nuw i32 1, %71
  %73 = and i32 %72, %1
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %129

75:                                               ; preds = %69
  %76 = load ptr, ptr @workList, align 8, !tbaa !5
  %77 = getelementptr inbounds i32, ptr %76, i64 %60
  %78 = load i32, ptr %77, align 4, !tbaa !9
  %79 = getelementptr inbounds i32, ptr %76, i64 %70
  %80 = load i32, ptr %79, align 4, !tbaa !9
  br i1 %58, label %81, label %85

81:                                               ; preds = %75
  %82 = icmp eq i32 %78, 1
  %83 = icmp eq i32 %80, 1
  %84 = select i1 %82, i1 true, i1 %83
  br i1 %84, label %129, label %85

85:                                               ; preds = %81, %75
  %86 = icmp eq i32 %78, 0
  %87 = icmp eq i32 %80, 0
  %88 = select i1 %86, i1 true, i1 %87
  br i1 %88, label %129, label %89

89:                                               ; preds = %85
  switch i32 %52, label %97 [
    i32 4, label %90
    i32 2, label %94
  ]

90:                                               ; preds = %89
  %91 = srem i32 %78, %80
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %93, label %129

93:                                               ; preds = %90
  switch i32 %52, label %97 [
    i32 4, label %94
    i32 2, label %94
  ]

94:                                               ; preds = %89, %93, %93
  %95 = tail call i32 @llvm.smax.i32(i32 %78, i32 %80)
  %96 = tail call i32 @llvm.smin.i32(i32 %78, i32 %80)
  br label %97

97:                                               ; preds = %94, %89, %93
  %98 = phi i32 [ %78, %93 ], [ %95, %94 ], [ %78, %89 ]
  %99 = phi i32 [ %80, %93 ], [ %96, %94 ], [ %80, %89 ]
  %100 = or i32 %68, %72
  %101 = load ptr, ptr @combList, align 8, !tbaa !5
  %102 = getelementptr inbounds %struct.Comb, ptr %101, i64 %10
  store i32 %98, ptr %102, align 4, !tbaa !17
  %103 = getelementptr inbounds %struct.Comb, ptr %101, i64 %10, i32 1
  store i32 %99, ptr %103, align 4, !tbaa !18
  %104 = getelementptr inbounds %struct.Comb, ptr %101, i64 %10, i32 2
  store i32 %52, ptr %104, align 4, !tbaa !14
  %105 = getelementptr inbounds i8, ptr %102, i64 8
  %106 = load i32, ptr %105, align 4, !tbaa !14
  switch i32 %106, label %123 [
    i32 1, label %107
    i32 2, label %111
    i32 3, label %115
    i32 4, label %119
  ]

107:                                              ; preds = %97
  %108 = getelementptr inbounds i8, ptr %102, i64 4
  %109 = load i32, ptr %108, align 4, !tbaa !18
  %110 = add nsw i32 %109, %98
  br label %123

111:                                              ; preds = %97
  %112 = getelementptr inbounds i8, ptr %102, i64 4
  %113 = load i32, ptr %112, align 4, !tbaa !18
  %114 = sub nsw i32 %98, %113
  br label %123

115:                                              ; preds = %97
  %116 = getelementptr inbounds i8, ptr %102, i64 4
  %117 = load i32, ptr %116, align 4, !tbaa !18
  %118 = mul nsw i32 %117, %98
  br label %123

119:                                              ; preds = %97
  %120 = getelementptr inbounds i8, ptr %102, i64 4
  %121 = load i32, ptr %120, align 4, !tbaa !18
  %122 = sdiv i32 %98, %121
  br label %123

123:                                              ; preds = %97, %107, %111, %115, %119
  %124 = phi i32 [ %122, %119 ], [ %118, %115 ], [ %114, %111 ], [ %110, %107 ], [ 0, %97 ]
  %125 = load i32, ptr @listLength, align 4, !tbaa !9
  %126 = add nsw i32 %125, %0
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, ptr %76, i64 %127
  store i32 %124, ptr %128, align 4, !tbaa !9
  tail call void @recSearch(i32 noundef %11, i32 noundef %100)
  br label %129

129:                                              ; preds = %90, %85, %81, %69, %123
  %130 = add nuw nsw i64 %70, 1
  %131 = icmp eq i64 %130, %60
  br i1 %131, label %132, label %69, !llvm.loop !22

132:                                              ; preds = %129, %59
  %133 = add nuw nsw i64 %60, 1
  %134 = load i32, ptr @listLength, align 4, !tbaa !9
  %135 = add nsw i32 %134, %0
  %136 = sext i32 %135 to i64
  %137 = icmp slt i64 %133, %136
  br i1 %137, label %59, label %138, !llvm.loop !23

138:                                              ; preds = %132, %51
  %139 = add nuw nsw i32 %52, 1
  %140 = icmp eq i32 %139, 5
  br i1 %140, label %141, label %51, !llvm.loop !24

141:                                              ; preds = %138, %46, %50, %12, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #9

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @doSearch() local_unnamed_addr #7 {
  %1 = load i32, ptr @listLength, align 4, !tbaa !9
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %23

3:                                                ; preds = %0
  %4 = load i32, ptr @best, align 4, !tbaa !9
  %5 = load ptr, ptr @workList, align 8, !tbaa !5
  %6 = load i32, ptr @goal, align 4, !tbaa !9
  %7 = zext nneg i32 %1 to i64
  br label %8

8:                                                ; preds = %3, %19
  %9 = phi i64 [ 0, %3 ], [ %21, %19 ]
  %10 = phi i32 [ %4, %3 ], [ %20, %19 ]
  %11 = getelementptr inbounds i32, ptr %5, i64 %9
  %12 = load i32, ptr %11, align 4, !tbaa !9
  %13 = sub nsw i32 %12, %6
  %14 = tail call i32 @llvm.abs.i32(i32 %13, i1 true)
  %15 = sub nsw i32 %10, %6
  %16 = tail call i32 @llvm.abs.i32(i32 %15, i1 true)
  %17 = icmp ult i32 %14, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %8
  store i32 %12, ptr @best, align 4, !tbaa !9
  br label %19

19:                                               ; preds = %8, %18
  %20 = phi i32 [ %10, %8 ], [ %12, %18 ]
  %21 = add nuw nsw i64 %9, 1
  %22 = icmp eq i64 %21, %7
  br i1 %22, label %23, label %8, !llvm.loop !25

23:                                               ; preds = %19, %0
  %24 = load i32, ptr @best, align 4, !tbaa !9
  %25 = load i32, ptr @goal, align 4, !tbaa !9
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %30, label %27

27:                                               ; preds = %23
  store i32 1, ptr @dmax, align 4, !tbaa !9
  %28 = load i32, ptr @listLength, align 4, !tbaa !9
  %29 = icmp sgt i32 %28, 1
  br i1 %29, label %32, label %39

30:                                               ; preds = %23
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14)
  br label %44

32:                                               ; preds = %27, %34
  tail call void @recSearch(i32 noundef 0, i32 noundef 0)
  %33 = load i1, ptr @stopSearch, align 4
  br i1 %33, label %39, label %34

34:                                               ; preds = %32
  %35 = load i32, ptr @dmax, align 4, !tbaa !9
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr @dmax, align 4, !tbaa !9
  %37 = load i32, ptr @listLength, align 4, !tbaa !9
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %32, label %39, !llvm.loop !26

39:                                               ; preds = %34, %32, %27
  %40 = load i1, ptr @stopSearch, align 4
  br i1 %40, label %44, label %41

41:                                               ; preds = %39
  %42 = load ptr, ptr @solution, align 8, !tbaa !5
  %43 = load i32, ptr @bestDepth, align 4, !tbaa !9
  tail call void @printSolution(ptr noundef %42, i32 noundef %43)
  br label %44

44:                                               ; preds = %39, %41, %30
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define range(i32 -2147483648, 2147483647) i32 @getInput() local_unnamed_addr #0 {
  %1 = alloca [16 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %1) #15
  store i32 13, ptr %1, align 4, !tbaa !9
  %2 = getelementptr inbounds i8, ptr %1, i64 4
  store i32 32, ptr %2, align 4, !tbaa !9
  %3 = getelementptr inbounds i8, ptr %1, i64 8
  store i32 14, ptr %3, align 4, !tbaa !9
  %4 = getelementptr inbounds i8, ptr %1, i64 12
  store i32 1412, ptr %4, align 4, !tbaa !9
  br label %5

5:                                                ; preds = %8, %0
  %6 = phi i64 [ %14, %8 ], [ 0, %0 ]
  %7 = call i32 @getchar()
  switch i32 %7, label %8 [
    i32 -1, label %15
    i32 10, label %15
  ]

8:                                                ; preds = %5
  %9 = load ptr, ptr @__stdinp, align 8, !tbaa !5
  %10 = call i32 @ungetc(i32 noundef %7, ptr noundef %9)
  %11 = load ptr, ptr @__stdinp, align 8, !tbaa !5
  %12 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %6
  %13 = call i32 (ptr, ptr, ...) @fscanf(ptr noundef %11, ptr noundef nonnull @.str.2, ptr noundef nonnull %12)
  %14 = add nuw nsw i64 %6, 1
  br label %5, !llvm.loop !27

15:                                               ; preds = %5, %5
  %16 = trunc nuw nsw i64 %6 to i32
  %17 = icmp eq i64 %6, 0
  %18 = add nsw i32 %16, -1
  %19 = select i1 %17, i32 3, i32 %18
  store i32 %19, ptr @listLength, align 4, !tbaa !9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4, !tbaa !9
  store i32 %22, ptr @goal, align 4, !tbaa !9
  %23 = shl nsw i32 %19, 1
  %24 = sext i32 %23 to i64
  %25 = call ptr @calloc(i64 noundef %24, i64 noundef 4) #13
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %30

27:                                               ; preds = %15
  %28 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %29 = call i64 @fwrite(ptr nonnull @.str, i64 28, i64 1, ptr %28)
  call void @exit(i32 noundef 1) #14
  unreachable

30:                                               ; preds = %15
  store ptr %25, ptr @workList, align 8, !tbaa !5
  %31 = call ptr @calloc(i64 noundef %20, i64 noundef 12) #13
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %36

33:                                               ; preds = %30
  %34 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %35 = call i64 @fwrite(ptr nonnull @.str.1, i64 35, i64 1, ptr %34)
  call void @exit(i32 noundef 1) #14
  unreachable

36:                                               ; preds = %30
  store ptr %31, ptr @combList, align 8, !tbaa !5
  %37 = call ptr @calloc(i64 noundef %20, i64 noundef 12) #13
  %38 = icmp eq ptr %37, null
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %41 = call i64 @fwrite(ptr nonnull @.str.1, i64 35, i64 1, ptr %40)
  call void @exit(i32 noundef 1) #14
  unreachable

42:                                               ; preds = %36
  store ptr %37, ptr @solution, align 8, !tbaa !5
  %43 = icmp sgt i32 %19, 0
  br i1 %43, label %44, label %61

44:                                               ; preds = %42
  %45 = zext nneg i32 %19 to i64
  %46 = shl nuw nsw i64 %45, 2
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 4 %25, ptr nonnull align 4 %1, i64 %46, i1 false), !tbaa !9
  %47 = zext nneg i32 %19 to i64
  br label %48

48:                                               ; preds = %48, %44
  %49 = phi i64 [ 0, %44 ], [ %51, %48 ]
  %50 = getelementptr inbounds %struct.Comb, ptr %31, i64 %49, i32 2
  store i32 0, ptr %50, align 4, !tbaa !14
  %51 = add nuw nsw i64 %49, 1
  %52 = icmp eq i64 %51, %47
  br i1 %52, label %53, label %48, !llvm.loop !16

53:                                               ; preds = %48
  br i1 %43, label %54, label %61

54:                                               ; preds = %53
  %55 = zext nneg i32 %19 to i64
  br label %56

56:                                               ; preds = %56, %54
  %57 = phi i64 [ 0, %54 ], [ %59, %56 ]
  %58 = getelementptr inbounds %struct.Comb, ptr %37, i64 %57, i32 2
  store i32 0, ptr %58, align 4, !tbaa !14
  %59 = add nuw nsw i64 %57, 1
  %60 = icmp eq i64 %59, %55
  br i1 %60, label %61, label %56, !llvm.loop !16

61:                                               ; preds = %56, %42, %53
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #15
  ret i32 %19
}

; Function Attrs: nofree nounwind
declare noundef i32 @getchar() local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @ungetc(i32 noundef, ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @fscanf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @search() local_unnamed_addr #7 {
  store i1 false, ptr @stopSearch, align 4
  store i32 0, ptr @nbNodes, align 4, !tbaa !9
  tail call void @doSearch()
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 @getInput()
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  store i1 false, ptr @stopSearch, align 4
  store i32 0, ptr @nbNodes, align 4, !tbaa !9
  tail call void @doSearch()
  br label %6

6:                                                ; preds = %5, %2
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #11

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #12

attributes #0 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nofree norecurse nosync nounwind ssp memory(argmem: write) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #8 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #9 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nofree nounwind }
attributes #11 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { allocsize(0,1) }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !10, i64 8}
!15 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8}
!16 = distinct !{!16, !12, !13}
!17 = !{!15, !10, i64 0}
!18 = !{!15, !10, i64 4}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !12, !13}
!24 = distinct !{!24, !12, !13}
!25 = distinct !{!25, !12, !13}
!26 = distinct !{!26, !12, !13}
!27 = distinct !{!27, !12, !13}
