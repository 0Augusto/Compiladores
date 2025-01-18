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
  br i1 %4, label %5, label %42

5:                                                ; preds = %3
  %6 = ptrtoint ptr %0 to i64
  %7 = ptrtoint ptr %1 to i64
  %8 = zext nneg i32 %2 to i64
  %9 = icmp ult i32 %2, 16
  %10 = sub i64 %6, %7
  %11 = icmp ult i64 %10, 64
  %12 = or i1 %9, %11
  br i1 %12, label %33, label %13

13:                                               ; preds = %5
  %14 = and i64 %8, 2147483632
  br label %15

15:                                               ; preds = %15, %13
  %16 = phi i64 [ 0, %13 ], [ %29, %15 ]
  %17 = getelementptr inbounds i32, ptr %1, i64 %16
  %18 = getelementptr inbounds i8, ptr %17, i64 16
  %19 = getelementptr inbounds i8, ptr %17, i64 32
  %20 = getelementptr inbounds i8, ptr %17, i64 48
  %21 = load <4 x i32>, ptr %17, align 4, !tbaa !9
  %22 = load <4 x i32>, ptr %18, align 4, !tbaa !9
  %23 = load <4 x i32>, ptr %19, align 4, !tbaa !9
  %24 = load <4 x i32>, ptr %20, align 4, !tbaa !9
  %25 = getelementptr inbounds i32, ptr %0, i64 %16
  %26 = getelementptr inbounds i8, ptr %25, i64 16
  %27 = getelementptr inbounds i8, ptr %25, i64 32
  %28 = getelementptr inbounds i8, ptr %25, i64 48
  store <4 x i32> %21, ptr %25, align 4, !tbaa !9
  store <4 x i32> %22, ptr %26, align 4, !tbaa !9
  store <4 x i32> %23, ptr %27, align 4, !tbaa !9
  store <4 x i32> %24, ptr %28, align 4, !tbaa !9
  %29 = add nuw i64 %16, 16
  %30 = icmp eq i64 %29, %14
  br i1 %30, label %31, label %15, !llvm.loop !11

31:                                               ; preds = %15
  %32 = icmp eq i64 %14, %8
  br i1 %32, label %42, label %33

33:                                               ; preds = %31, %5
  %34 = phi i64 [ 0, %5 ], [ %14, %31 ]
  br label %35

35:                                               ; preds = %33, %35
  %36 = phi i64 [ %40, %35 ], [ %34, %33 ]
  %37 = getelementptr inbounds i32, ptr %1, i64 %36
  %38 = load i32, ptr %37, align 4, !tbaa !9
  %39 = getelementptr inbounds i32, ptr %0, i64 %36
  store i32 %38, ptr %39, align 4, !tbaa !9
  %40 = add nuw nsw i64 %36, 1
  %41 = icmp eq i64 %40, %8
  br i1 %41, label %42, label %35, !llvm.loop !15

42:                                               ; preds = %35, %31, %3
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: write) uwtable(sync)
define void @initCombList(ptr nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #5 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %29

4:                                                ; preds = %2
  %5 = zext nneg i32 %1 to i64
  %6 = icmp ult i32 %1, 4
  br i1 %6, label %22, label %7

7:                                                ; preds = %4
  %8 = and i64 %5, 2147483644
  br label %9

9:                                                ; preds = %9, %7
  %10 = phi i64 [ 0, %7 ], [ %18, %9 ]
  %11 = or disjoint i64 %10, 1
  %12 = or disjoint i64 %10, 2
  %13 = or disjoint i64 %10, 3
  %14 = getelementptr inbounds %struct.Comb, ptr %0, i64 %10, i32 2
  %15 = getelementptr inbounds %struct.Comb, ptr %0, i64 %11, i32 2
  %16 = getelementptr inbounds %struct.Comb, ptr %0, i64 %12, i32 2
  %17 = getelementptr inbounds %struct.Comb, ptr %0, i64 %13, i32 2
  store i32 0, ptr %14, align 4, !tbaa !16
  store i32 0, ptr %15, align 4, !tbaa !16
  store i32 0, ptr %16, align 4, !tbaa !16
  store i32 0, ptr %17, align 4, !tbaa !16
  %18 = add nuw i64 %10, 4
  %19 = icmp eq i64 %18, %8
  br i1 %19, label %20, label %9, !llvm.loop !18

20:                                               ; preds = %9
  %21 = icmp eq i64 %8, %5
  br i1 %21, label %29, label %22

22:                                               ; preds = %20, %4
  %23 = phi i64 [ 0, %4 ], [ %8, %20 ]
  br label %24

24:                                               ; preds = %22, %24
  %25 = phi i64 [ %27, %24 ], [ %23, %22 ]
  %26 = getelementptr inbounds %struct.Comb, ptr %0, i64 %25, i32 2
  store i32 0, ptr %26, align 4, !tbaa !16
  %27 = add nuw nsw i64 %25, 1
  %28 = icmp eq i64 %27, %5
  br i1 %28, label %29, label %24, !llvm.loop !19

29:                                               ; preds = %24, %20, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @saveSolution(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %5, label %60

5:                                                ; preds = %3
  %6 = zext nneg i32 %2 to i64
  %7 = icmp ult i32 %2, 12
  br i1 %7, label %48, label %8

8:                                                ; preds = %5
  %9 = mul nuw nsw i64 %6, 12
  %10 = add nsw i64 %9, -8
  %11 = getelementptr i8, ptr %0, i64 %10
  %12 = getelementptr i8, ptr %1, i64 %10
  %13 = getelementptr i8, ptr %0, i64 4
  %14 = add nsw i64 %9, -4
  %15 = getelementptr i8, ptr %0, i64 %14
  %16 = getelementptr i8, ptr %1, i64 4
  %17 = getelementptr i8, ptr %1, i64 %14
  %18 = getelementptr i8, ptr %0, i64 8
  %19 = getelementptr i8, ptr %0, i64 %9
  %20 = getelementptr i8, ptr %1, i64 8
  %21 = getelementptr i8, ptr %1, i64 %9
  %22 = icmp ugt ptr %12, %0
  %23 = icmp ugt ptr %11, %1
  %24 = and i1 %22, %23
  %25 = icmp ult ptr %13, %17
  %26 = icmp ult ptr %16, %15
  %27 = and i1 %25, %26
  %28 = or i1 %24, %27
  %29 = icmp ult ptr %18, %21
  %30 = icmp ult ptr %20, %19
  %31 = and i1 %29, %30
  %32 = or i1 %28, %31
  br i1 %32, label %48, label %33

33:                                               ; preds = %8
  %34 = and i64 %6, 2147483640
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi i64 [ 0, %33 ], [ %44, %35 ]
  %37 = or disjoint i64 %36, 4
  %38 = getelementptr inbounds %struct.Comb, ptr %1, i64 %36
  %39 = getelementptr inbounds %struct.Comb, ptr %1, i64 %37
  %40 = load <12 x i32>, ptr %38, align 4, !tbaa !9
  %41 = load <12 x i32>, ptr %39, align 4, !tbaa !9
  %42 = getelementptr inbounds %struct.Comb, ptr %0, i64 %36
  %43 = getelementptr inbounds %struct.Comb, ptr %0, i64 %37
  store <12 x i32> %40, ptr %42, align 4, !tbaa !9
  store <12 x i32> %41, ptr %43, align 4, !tbaa !9
  %44 = add nuw i64 %36, 8
  %45 = icmp eq i64 %44, %34
  br i1 %45, label %46, label %35, !llvm.loop !20

46:                                               ; preds = %35
  %47 = icmp eq i64 %34, %6
  br i1 %47, label %60, label %48

48:                                               ; preds = %46, %8, %5
  %49 = phi i64 [ 0, %8 ], [ 0, %5 ], [ %34, %46 ]
  br label %50

50:                                               ; preds = %48, %50
  %51 = phi i64 [ %58, %50 ], [ %49, %48 ]
  %52 = getelementptr inbounds %struct.Comb, ptr %1, i64 %51
  %53 = getelementptr inbounds %struct.Comb, ptr %0, i64 %51
  %54 = load <2 x i32>, ptr %52, align 4, !tbaa !9
  store <2 x i32> %54, ptr %53, align 4, !tbaa !9
  %55 = getelementptr inbounds i8, ptr %52, i64 8
  %56 = load i32, ptr %55, align 4, !tbaa !16
  %57 = getelementptr inbounds i8, ptr %53, i64 8
  store i32 %56, ptr %57, align 4, !tbaa !16
  %58 = add nuw nsw i64 %51, 1
  %59 = icmp eq i64 %58, %6
  br i1 %59, label %60, label %50, !llvm.loop !21

60:                                               ; preds = %50, %46, %3
  %61 = sext i32 %2 to i64
  %62 = getelementptr inbounds %struct.Comb, ptr %0, i64 %61, i32 2
  store i32 0, ptr %62, align 4, !tbaa !16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define i32 @calculate(ptr nocapture noundef readonly %0) local_unnamed_addr #6 {
  %2 = getelementptr inbounds i8, ptr %0, i64 8
  %3 = load i32, ptr %2, align 4, !tbaa !16
  switch i32 %3, label %24 [
    i32 1, label %4
    i32 2, label %9
    i32 3, label %14
    i32 4, label %19
  ]

4:                                                ; preds = %1
  %5 = load i32, ptr %0, align 4, !tbaa !22
  %6 = getelementptr inbounds i8, ptr %0, i64 4
  %7 = load i32, ptr %6, align 4, !tbaa !23
  %8 = add nsw i32 %7, %5
  br label %24

9:                                                ; preds = %1
  %10 = load i32, ptr %0, align 4, !tbaa !22
  %11 = getelementptr inbounds i8, ptr %0, i64 4
  %12 = load i32, ptr %11, align 4, !tbaa !23
  %13 = sub nsw i32 %10, %12
  br label %24

14:                                               ; preds = %1
  %15 = load i32, ptr %0, align 4, !tbaa !22
  %16 = getelementptr inbounds i8, ptr %0, i64 4
  %17 = load i32, ptr %16, align 4, !tbaa !23
  %18 = mul nsw i32 %17, %15
  br label %24

19:                                               ; preds = %1
  %20 = load i32, ptr %0, align 4, !tbaa !22
  %21 = getelementptr inbounds i8, ptr %0, i64 4
  %22 = load i32, ptr %21, align 4, !tbaa !23
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
  %6 = zext nneg i32 %5 to i64
  %7 = zext nneg i32 %1 to i64
  br label %8

8:                                                ; preds = %4, %51
  %9 = phi i64 [ 0, %4 ], [ %52, %51 ]
  %10 = getelementptr inbounds %struct.Comb, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !22
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %11)
  %13 = getelementptr inbounds i8, ptr %10, i64 8
  %14 = load i32, ptr %13, align 4, !tbaa !16
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
  %29 = load i32, ptr %28, align 4, !tbaa !23
  %30 = load i32, ptr %13, align 4, !tbaa !16
  switch i32 %30, label %43 [
    i32 1, label %31
    i32 2, label %34
    i32 3, label %37
    i32 4, label %40
  ]

31:                                               ; preds = %27
  %32 = load i32, ptr %10, align 4, !tbaa !22
  %33 = add nsw i32 %32, %29
  br label %43

34:                                               ; preds = %27
  %35 = load i32, ptr %10, align 4, !tbaa !22
  %36 = sub nsw i32 %35, %29
  br label %43

37:                                               ; preds = %27
  %38 = load i32, ptr %10, align 4, !tbaa !22
  %39 = mul nsw i32 %38, %29
  br label %43

40:                                               ; preds = %27
  %41 = load i32, ptr %10, align 4, !tbaa !22
  %42 = sdiv i32 %41, %29
  br label %43

43:                                               ; preds = %27, %31, %34, %37, %40
  %44 = phi i32 [ %42, %40 ], [ %39, %37 ], [ %36, %34 ], [ %33, %31 ], [ 0, %27 ]
  %45 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef %29, i32 noundef %44)
  %46 = icmp ult i64 %9, %6
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
  br i1 %53, label %54, label %8, !llvm.loop !24

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
  br i1 %19, label %20, label %7, !llvm.loop !25

20:                                               ; preds = %17, %3
  %21 = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @recSearch(i32 noundef %0, i32 noundef %1) local_unnamed_addr #7 {
  %3 = load i1, ptr @stopSearch, align 4
  br i1 %3, label %177, label %4

4:                                                ; preds = %2
  %5 = load i32, ptr @nbNodes, align 4, !tbaa !9
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr @nbNodes, align 4, !tbaa !9
  %7 = load i32, ptr @dmax, align 4, !tbaa !9
  %8 = icmp eq i32 %7, %0
  br i1 %8, label %13, label %9

9:                                                ; preds = %4
  %10 = sext i32 %0 to i64
  %11 = add nsw i32 %0, 1
  %12 = load i32, ptr @listLength, align 4, !tbaa !9
  br label %92

13:                                               ; preds = %4
  %14 = load ptr, ptr @workList, align 8, !tbaa !5
  %15 = load i32, ptr @listLength, align 4, !tbaa !9
  %16 = add nsw i32 %15, %0
  %17 = sext i32 %16 to i64
  %18 = getelementptr i32, ptr %14, i64 %17
  %19 = getelementptr i8, ptr %18, i64 -4
  %20 = load i32, ptr %19, align 4, !tbaa !9
  %21 = load i32, ptr @goal, align 4, !tbaa !9
  %22 = sub nsw i32 %20, %21
  %23 = tail call i32 @llvm.abs.i32(i32 %22, i1 true)
  %24 = load i32, ptr @best, align 4, !tbaa !9
  %25 = sub nsw i32 %24, %21
  %26 = tail call i32 @llvm.abs.i32(i32 %25, i1 true)
  %27 = icmp ult i32 %23, %26
  br i1 %27, label %28, label %177

28:                                               ; preds = %13
  store i32 %20, ptr @best, align 4, !tbaa !9
  store i32 %0, ptr @bestDepth, align 4, !tbaa !9
  %29 = load ptr, ptr @solution, align 8, !tbaa !5
  %30 = load ptr, ptr @combList, align 8, !tbaa !5
  %31 = icmp sgt i32 %0, 0
  br i1 %31, label %32, label %87

32:                                               ; preds = %28
  %33 = zext nneg i32 %0 to i64
  %34 = icmp ult i32 %0, 12
  br i1 %34, label %75, label %35

35:                                               ; preds = %32
  %36 = mul nuw nsw i64 %33, 12
  %37 = add nsw i64 %36, -8
  %38 = getelementptr i8, ptr %29, i64 %37
  %39 = getelementptr i8, ptr %30, i64 %37
  %40 = getelementptr i8, ptr %29, i64 4
  %41 = add nsw i64 %36, -4
  %42 = getelementptr i8, ptr %29, i64 %41
  %43 = getelementptr i8, ptr %30, i64 4
  %44 = getelementptr i8, ptr %30, i64 %41
  %45 = getelementptr i8, ptr %29, i64 8
  %46 = getelementptr i8, ptr %29, i64 %36
  %47 = getelementptr i8, ptr %30, i64 8
  %48 = getelementptr i8, ptr %30, i64 %36
  %49 = icmp ult ptr %29, %39
  %50 = icmp ult ptr %30, %38
  %51 = and i1 %49, %50
  %52 = icmp ult ptr %40, %44
  %53 = icmp ult ptr %43, %42
  %54 = and i1 %52, %53
  %55 = or i1 %51, %54
  %56 = icmp ult ptr %45, %48
  %57 = icmp ult ptr %47, %46
  %58 = and i1 %56, %57
  %59 = or i1 %55, %58
  br i1 %59, label %75, label %60

60:                                               ; preds = %35
  %61 = and i64 %33, 2147483640
  br label %62

62:                                               ; preds = %62, %60
  %63 = phi i64 [ 0, %60 ], [ %71, %62 ]
  %64 = or disjoint i64 %63, 4
  %65 = getelementptr inbounds %struct.Comb, ptr %30, i64 %63
  %66 = getelementptr inbounds %struct.Comb, ptr %30, i64 %64
  %67 = load <12 x i32>, ptr %65, align 4, !tbaa !9
  %68 = load <12 x i32>, ptr %66, align 4, !tbaa !9
  %69 = getelementptr inbounds %struct.Comb, ptr %29, i64 %63
  %70 = getelementptr inbounds %struct.Comb, ptr %29, i64 %64
  store <12 x i32> %67, ptr %69, align 4, !tbaa !9
  store <12 x i32> %68, ptr %70, align 4, !tbaa !9
  %71 = add nuw i64 %63, 8
  %72 = icmp eq i64 %71, %61
  br i1 %72, label %73, label %62, !llvm.loop !26

73:                                               ; preds = %62
  %74 = icmp eq i64 %61, %33
  br i1 %74, label %87, label %75

75:                                               ; preds = %73, %35, %32
  %76 = phi i64 [ 0, %35 ], [ 0, %32 ], [ %61, %73 ]
  br label %77

77:                                               ; preds = %75, %77
  %78 = phi i64 [ %85, %77 ], [ %76, %75 ]
  %79 = getelementptr inbounds %struct.Comb, ptr %30, i64 %78
  %80 = getelementptr inbounds %struct.Comb, ptr %29, i64 %78
  %81 = load <2 x i32>, ptr %79, align 4, !tbaa !9
  store <2 x i32> %81, ptr %80, align 4, !tbaa !9
  %82 = getelementptr inbounds i8, ptr %79, i64 8
  %83 = load i32, ptr %82, align 4, !tbaa !16
  %84 = getelementptr inbounds i8, ptr %80, i64 8
  store i32 %83, ptr %84, align 4, !tbaa !16
  %85 = add nuw nsw i64 %78, 1
  %86 = icmp eq i64 %85, %33
  br i1 %86, label %87, label %77, !llvm.loop !27

87:                                               ; preds = %77, %73, %28
  %88 = sext i32 %0 to i64
  %89 = getelementptr inbounds %struct.Comb, ptr %29, i64 %88, i32 2
  store i32 0, ptr %89, align 4, !tbaa !16
  %90 = icmp eq i32 %20, %21
  br i1 %90, label %91, label %177

91:                                               ; preds = %87
  tail call void @printSolution(ptr noundef %30, i32 noundef %0)
  store i1 true, ptr @stopSearch, align 4
  br label %177

92:                                               ; preds = %9, %172
  %93 = phi i32 [ %12, %9 ], [ %173, %172 ]
  %94 = phi i32 [ %12, %9 ], [ %174, %172 ]
  %95 = phi i32 [ 1, %9 ], [ %175, %172 ]
  %96 = add nsw i32 %94, %0
  %97 = icmp sgt i32 %96, 0
  br i1 %97, label %98, label %172

98:                                               ; preds = %92
  %99 = add nsw i32 %95, -3
  %100 = icmp ult i32 %99, 2
  br label %101

101:                                              ; preds = %98, %166
  %102 = phi i32 [ %93, %98 ], [ %167, %166 ]
  %103 = phi i64 [ 0, %98 ], [ %168, %166 ]
  %104 = trunc nuw nsw i64 %103 to i32
  %105 = shl nuw i32 1, %104
  %106 = and i32 %105, %1
  %107 = icmp eq i32 %106, 0
  %108 = icmp ne i64 %103, 0
  %109 = and i1 %107, %108
  br i1 %109, label %110, label %166

110:                                              ; preds = %101
  %111 = or i32 %105, %1
  br label %112

112:                                              ; preds = %110, %161
  %113 = phi i64 [ 0, %110 ], [ %162, %161 ]
  %114 = trunc nuw nsw i64 %113 to i32
  %115 = shl nuw i32 1, %114
  %116 = and i32 %115, %1
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %118, label %161

118:                                              ; preds = %112
  %119 = load ptr, ptr @workList, align 8, !tbaa !5
  %120 = getelementptr inbounds i32, ptr %119, i64 %103
  %121 = load i32, ptr %120, align 4, !tbaa !9
  %122 = getelementptr inbounds i32, ptr %119, i64 %113
  %123 = load i32, ptr %122, align 4, !tbaa !9
  br i1 %100, label %124, label %128

124:                                              ; preds = %118
  %125 = icmp eq i32 %121, 1
  %126 = icmp eq i32 %123, 1
  %127 = select i1 %125, i1 true, i1 %126
  br i1 %127, label %161, label %128

128:                                              ; preds = %124, %118
  %129 = icmp eq i32 %121, 0
  %130 = icmp eq i32 %123, 0
  %131 = select i1 %129, i1 true, i1 %130
  br i1 %131, label %161, label %132

132:                                              ; preds = %128
  switch i32 %95, label %139 [
    i32 4, label %133
    i32 2, label %136
  ]

133:                                              ; preds = %132
  %134 = srem i32 %121, %123
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %161

136:                                              ; preds = %133, %132
  %137 = tail call i32 @llvm.smax.i32(i32 %121, i32 %123)
  %138 = tail call i32 @llvm.smin.i32(i32 %121, i32 %123)
  br label %139

139:                                              ; preds = %136, %132
  %140 = phi i32 [ %137, %136 ], [ %121, %132 ]
  %141 = phi i32 [ %138, %136 ], [ %123, %132 ]
  %142 = or i32 %111, %115
  %143 = load ptr, ptr @combList, align 8, !tbaa !5
  %144 = getelementptr inbounds %struct.Comb, ptr %143, i64 %10
  store i32 %140, ptr %144, align 4, !tbaa !22
  %145 = getelementptr inbounds %struct.Comb, ptr %143, i64 %10, i32 1
  store i32 %141, ptr %145, align 4, !tbaa !23
  %146 = getelementptr inbounds %struct.Comb, ptr %143, i64 %10, i32 2
  store i32 %95, ptr %146, align 4, !tbaa !16
  switch i32 %95, label %155 [
    i32 1, label %147
    i32 2, label %149
    i32 3, label %151
    i32 4, label %153
  ]

147:                                              ; preds = %139
  %148 = add nsw i32 %141, %140
  br label %155

149:                                              ; preds = %139
  %150 = sub nsw i32 %140, %141
  br label %155

151:                                              ; preds = %139
  %152 = mul nsw i32 %141, %140
  br label %155

153:                                              ; preds = %139
  %154 = sdiv i32 %140, %141
  br label %155

155:                                              ; preds = %139, %147, %149, %151, %153
  %156 = phi i32 [ %154, %153 ], [ %152, %151 ], [ %150, %149 ], [ %148, %147 ], [ 0, %139 ]
  %157 = load i32, ptr @listLength, align 4, !tbaa !9
  %158 = add nsw i32 %157, %0
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %119, i64 %159
  store i32 %156, ptr %160, align 4, !tbaa !9
  tail call void @recSearch(i32 noundef %11, i32 noundef %142)
  br label %161

161:                                              ; preds = %133, %128, %124, %112, %155
  %162 = add nuw nsw i64 %113, 1
  %163 = icmp eq i64 %162, %103
  br i1 %163, label %164, label %112, !llvm.loop !28

164:                                              ; preds = %161
  %165 = load i32, ptr @listLength, align 4, !tbaa !9
  br label %166

166:                                              ; preds = %164, %101
  %167 = phi i32 [ %165, %164 ], [ %102, %101 ]
  %168 = add nuw nsw i64 %103, 1
  %169 = add nsw i32 %167, %0
  %170 = sext i32 %169 to i64
  %171 = icmp slt i64 %168, %170
  br i1 %171, label %101, label %172, !llvm.loop !29

172:                                              ; preds = %166, %92
  %173 = phi i32 [ %93, %92 ], [ %167, %166 ]
  %174 = phi i32 [ %94, %92 ], [ %167, %166 ]
  %175 = add nuw nsw i32 %95, 1
  %176 = icmp eq i32 %175, 5
  br i1 %176, label %177, label %92, !llvm.loop !30

177:                                              ; preds = %172, %87, %91, %13, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #9

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @doSearch() local_unnamed_addr #7 {
  %1 = load i32, ptr @listLength, align 4, !tbaa !9
  %2 = icmp sgt i32 %1, 0
  %3 = load i32, ptr @best, align 4, !tbaa !9
  br i1 %2, label %6, label %4

4:                                                ; preds = %0
  %5 = load i32, ptr @goal, align 4, !tbaa !9
  br label %25

6:                                                ; preds = %0
  %7 = load ptr, ptr @workList, align 8, !tbaa !5
  %8 = load i32, ptr @goal, align 4, !tbaa !9
  %9 = zext nneg i32 %1 to i64
  br label %10

10:                                               ; preds = %6, %21
  %11 = phi i64 [ 0, %6 ], [ %23, %21 ]
  %12 = phi i32 [ %3, %6 ], [ %22, %21 ]
  %13 = getelementptr inbounds i32, ptr %7, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !9
  %15 = sub nsw i32 %14, %8
  %16 = tail call i32 @llvm.abs.i32(i32 %15, i1 true)
  %17 = sub nsw i32 %12, %8
  %18 = tail call i32 @llvm.abs.i32(i32 %17, i1 true)
  %19 = icmp ult i32 %16, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %10
  store i32 %14, ptr @best, align 4, !tbaa !9
  br label %21

21:                                               ; preds = %10, %20
  %22 = phi i32 [ %12, %10 ], [ %14, %20 ]
  %23 = add nuw nsw i64 %11, 1
  %24 = icmp eq i64 %23, %9
  br i1 %24, label %25, label %10, !llvm.loop !31

25:                                               ; preds = %21, %4
  %26 = phi i32 [ %5, %4 ], [ %8, %21 ]
  %27 = phi i32 [ %3, %4 ], [ %22, %21 ]
  %28 = icmp eq i32 %27, %26
  br i1 %28, label %31, label %29

29:                                               ; preds = %25
  store i32 1, ptr @dmax, align 4, !tbaa !9
  %30 = icmp sgt i32 %1, 1
  br i1 %30, label %33, label %40

31:                                               ; preds = %25
  %32 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14)
  br label %45

33:                                               ; preds = %29, %35
  tail call void @recSearch(i32 noundef 0, i32 noundef 0)
  %34 = load i1, ptr @stopSearch, align 4
  br i1 %34, label %45, label %35

35:                                               ; preds = %33
  %36 = load i32, ptr @dmax, align 4, !tbaa !9
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr @dmax, align 4, !tbaa !9
  %38 = load i32, ptr @listLength, align 4, !tbaa !9
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %33, label %42, !llvm.loop !32

40:                                               ; preds = %29
  %41 = load i1, ptr @stopSearch, align 4
  br i1 %41, label %45, label %42

42:                                               ; preds = %35, %40
  %43 = load ptr, ptr @solution, align 8, !tbaa !5
  %44 = load i32, ptr @bestDepth, align 4, !tbaa !9
  tail call void @printSolution(ptr noundef %43, i32 noundef %44)
  br label %45

45:                                               ; preds = %33, %40, %42, %31
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define range(i32 -2147483648, 2147483647) i32 @getInput() local_unnamed_addr #0 {
  %1 = alloca [16 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %1) #15
  store <4 x i32> <i32 13, i32 32, i32 14, i32 1412>, ptr %1, align 16, !tbaa !9
  br label %2

2:                                                ; preds = %5, %0
  %3 = phi i64 [ %11, %5 ], [ 0, %0 ]
  %4 = call i32 @getchar()
  switch i32 %4, label %5 [
    i32 -1, label %12
    i32 10, label %12
  ]

5:                                                ; preds = %2
  %6 = load ptr, ptr @__stdinp, align 8, !tbaa !5
  %7 = call i32 @ungetc(i32 noundef %4, ptr noundef %6)
  %8 = load ptr, ptr @__stdinp, align 8, !tbaa !5
  %9 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %3
  %10 = call i32 (ptr, ptr, ...) @fscanf(ptr noundef %8, ptr noundef nonnull @.str.2, ptr noundef nonnull %9)
  %11 = add nuw nsw i64 %3, 1
  br label %2, !llvm.loop !33

12:                                               ; preds = %2, %2
  %13 = trunc nuw nsw i64 %3 to i32
  %14 = icmp eq i64 %3, 0
  %15 = add nsw i32 %13, -1
  %16 = select i1 %14, i32 3, i32 %15
  store i32 %16, ptr @listLength, align 4, !tbaa !9
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4, !tbaa !9
  store i32 %19, ptr @goal, align 4, !tbaa !9
  %20 = shl nsw i32 %16, 1
  %21 = sext i32 %20 to i64
  %22 = call ptr @calloc(i64 noundef %21, i64 noundef 4) #13
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %27

24:                                               ; preds = %12
  %25 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %26 = call i64 @fwrite(ptr nonnull @.str, i64 28, i64 1, ptr %25)
  call void @exit(i32 noundef 1) #14
  unreachable

27:                                               ; preds = %12
  store ptr %22, ptr @workList, align 8, !tbaa !5
  %28 = call ptr @calloc(i64 noundef %17, i64 noundef 12) #13
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %32 = call i64 @fwrite(ptr nonnull @.str.1, i64 35, i64 1, ptr %31)
  call void @exit(i32 noundef 1) #14
  unreachable

33:                                               ; preds = %27
  store ptr %28, ptr @combList, align 8, !tbaa !5
  %34 = call ptr @calloc(i64 noundef %17, i64 noundef 12) #13
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = load ptr, ptr @__stderrp, align 8, !tbaa !5
  %38 = call i64 @fwrite(ptr nonnull @.str.1, i64 35, i64 1, ptr %37)
  call void @exit(i32 noundef 1) #14
  unreachable

39:                                               ; preds = %33
  store ptr %34, ptr @solution, align 8, !tbaa !5
  %40 = icmp sgt i32 %16, 0
  br i1 %40, label %41, label %91

41:                                               ; preds = %39
  %42 = zext nneg i32 %16 to i64
  %43 = shl nuw nsw i64 %42, 2
  call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 4 %22, ptr nonnull align 16 %1, i64 %43, i1 false), !tbaa !9
  %44 = icmp ult i32 %16, 4
  br i1 %44, label %60, label %45

45:                                               ; preds = %41
  %46 = and i64 %42, 2147483644
  br label %47

47:                                               ; preds = %47, %45
  %48 = phi i64 [ 0, %45 ], [ %56, %47 ]
  %49 = or disjoint i64 %48, 1
  %50 = or disjoint i64 %48, 2
  %51 = or disjoint i64 %48, 3
  %52 = getelementptr inbounds %struct.Comb, ptr %28, i64 %48, i32 2
  %53 = getelementptr inbounds %struct.Comb, ptr %28, i64 %49, i32 2
  %54 = getelementptr inbounds %struct.Comb, ptr %28, i64 %50, i32 2
  %55 = getelementptr inbounds %struct.Comb, ptr %28, i64 %51, i32 2
  store i32 0, ptr %52, align 4, !tbaa !16
  store i32 0, ptr %53, align 4, !tbaa !16
  store i32 0, ptr %54, align 4, !tbaa !16
  store i32 0, ptr %55, align 4, !tbaa !16
  %56 = add nuw i64 %48, 4
  %57 = icmp eq i64 %56, %46
  br i1 %57, label %58, label %47, !llvm.loop !34

58:                                               ; preds = %47
  %59 = icmp eq i64 %46, %42
  br i1 %59, label %67, label %60

60:                                               ; preds = %58, %41
  %61 = phi i64 [ 0, %41 ], [ %46, %58 ]
  br label %62

62:                                               ; preds = %60, %62
  %63 = phi i64 [ %65, %62 ], [ %61, %60 ]
  %64 = getelementptr inbounds %struct.Comb, ptr %28, i64 %63, i32 2
  store i32 0, ptr %64, align 4, !tbaa !16
  %65 = add nuw nsw i64 %63, 1
  %66 = icmp eq i64 %65, %42
  br i1 %66, label %67, label %62, !llvm.loop !35

67:                                               ; preds = %62, %58
  %68 = icmp ult i32 %16, 4
  br i1 %68, label %84, label %69

69:                                               ; preds = %67
  %70 = and i64 %42, 2147483644
  br label %71

71:                                               ; preds = %71, %69
  %72 = phi i64 [ 0, %69 ], [ %80, %71 ]
  %73 = or disjoint i64 %72, 1
  %74 = or disjoint i64 %72, 2
  %75 = or disjoint i64 %72, 3
  %76 = getelementptr inbounds %struct.Comb, ptr %34, i64 %72, i32 2
  %77 = getelementptr inbounds %struct.Comb, ptr %34, i64 %73, i32 2
  %78 = getelementptr inbounds %struct.Comb, ptr %34, i64 %74, i32 2
  %79 = getelementptr inbounds %struct.Comb, ptr %34, i64 %75, i32 2
  store i32 0, ptr %76, align 4, !tbaa !16
  store i32 0, ptr %77, align 4, !tbaa !16
  store i32 0, ptr %78, align 4, !tbaa !16
  store i32 0, ptr %79, align 4, !tbaa !16
  %80 = add nuw i64 %72, 4
  %81 = icmp eq i64 %80, %70
  br i1 %81, label %82, label %71, !llvm.loop !36

82:                                               ; preds = %71
  %83 = icmp eq i64 %70, %42
  br i1 %83, label %91, label %84

84:                                               ; preds = %82, %67
  %85 = phi i64 [ 0, %67 ], [ %70, %82 ]
  br label %86

86:                                               ; preds = %84, %86
  %87 = phi i64 [ %89, %86 ], [ %85, %84 ]
  %88 = getelementptr inbounds %struct.Comb, ptr %34, i64 %87, i32 2
  store i32 0, ptr %88, align 4, !tbaa !16
  %89 = add nuw nsw i64 %87, 1
  %90 = icmp eq i64 %89, %42
  br i1 %90, label %91, label %86, !llvm.loop !37

91:                                               ; preds = %86, %82, %39
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %1) #15
  ret i32 %16
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
!11 = distinct !{!11, !12, !13, !14}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!"llvm.loop.isvectorized", i32 1}
!14 = !{!"llvm.loop.unroll.runtime.disable"}
!15 = distinct !{!15, !12, !13}
!16 = !{!17, !10, i64 8}
!17 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8}
!18 = distinct !{!18, !12, !13, !14}
!19 = distinct !{!19, !12, !13}
!20 = distinct !{!20, !12, !13, !14}
!21 = distinct !{!21, !12, !13}
!22 = !{!17, !10, i64 0}
!23 = !{!17, !10, i64 4}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
!26 = distinct !{!26, !12, !13, !14}
!27 = distinct !{!27, !12, !13}
!28 = distinct !{!28, !12}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !12}
!31 = distinct !{!31, !12}
!32 = distinct !{!32, !12}
!33 = distinct !{!33, !12}
!34 = distinct !{!34, !12, !13, !14}
!35 = distinct !{!35, !12, !13}
!36 = distinct !{!36, !12, !13, !14}
!37 = distinct !{!37, !12, !13}
