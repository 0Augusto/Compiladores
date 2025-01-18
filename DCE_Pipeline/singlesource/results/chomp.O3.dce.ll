; ModuleID = 'chomp.O3.ll'
source_filename = "../chomp.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

@ncol = local_unnamed_addr global i32 0, align 4
@nrow = local_unnamed_addr global i32 0, align 4
@game_tree = local_unnamed_addr global ptr null, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"  value = %d\0A\00", align 1
@wanted = local_unnamed_addr global ptr null, align 8
@.str.8 = private unnamed_addr constant [14 x i8] c" Selection : \00", align 1
@.str.13 = private unnamed_addr constant [27 x i8] c"Enter number of Columns : \00", align 1
@.str.14 = private unnamed_addr constant [27 x i8] c"Enter number of Rows    : \00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"player %d plays at (%d,%d)\0A\00", align 1
@.str.16 = private unnamed_addr constant [17 x i8] c"player %d loses\0A\00", align 1
@str = private unnamed_addr constant [2 x i8] c")\00", align 1
@str.18 = private unnamed_addr constant [12 x i8] c"For state :\00", align 1
@str.19 = private unnamed_addr constant [19 x i8] c"We get, in order :\00", align 1
@str.20 = private unnamed_addr constant [33 x i8] c"Mode : 1 -> multiple first moves\00", align 1
@str.21 = private unnamed_addr constant [24 x i8] c"       2 -> report game\00", align 1
@str.22 = private unnamed_addr constant [27 x i8] c"       3 -> good positions\00", align 1

; Function Attrs: mustprogress nofree nounwind ssp willreturn uwtable(sync)
define noalias noundef ptr @copy_data(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = sext i32 %2 to i64
  %4 = shl nsw i64 %3, 2
  %5 = tail call ptr @malloc(i64 noundef %4) #14
  %6 = icmp eq i32 %2, 0
  br i1 %6, label %17, label %7

7:                                                ; preds = %1
  %8 = add i32 %2, -1
  %9 = sext i32 %8 to i64
  %10 = zext i32 %8 to i64
  %11 = sub nsw i64 %9, %10
  %12 = shl nsw i64 %11, 2
  %13 = getelementptr i8, ptr %5, i64 %12
  %14 = getelementptr i8, ptr %0, i64 %12
  %15 = zext i32 %2 to i64
  %16 = shl nuw nsw i64 %15, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %13, ptr align 4 %14, i64 %16, i1 false), !tbaa !5
  br label %17

17:                                               ; preds = %7, %1
  ret ptr %5
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, argmem: readwrite, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @next_data(ptr nocapture noundef %0) local_unnamed_addr #3 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %18, label %4

4:                                                ; preds = %13, %1
  %5 = phi i32 [ %14, %13 ], [ 0, %1 ]
  %6 = zext nneg i32 %5 to i64
  %7 = getelementptr inbounds i32, ptr %0, i64 %6
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = load i32, ptr @nrow, align 4, !tbaa !5
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %13, label %11

11:                                               ; preds = %4
  %12 = add nsw i32 %8, 1
  store i32 %12, ptr %7, align 4
  br label %18

13:                                               ; preds = %4
  %14 = add nuw nsw i32 %5, 1
  store i32 0, ptr %7, align 4
  %15 = load i32, ptr @ncol, align 4, !tbaa !5
  %16 = icmp ne i32 %14, %15
  %17 = and i1 %10, %16
  br i1 %17, label %4, label %18, !llvm.loop !9

18:                                               ; preds = %13, %11, %1
  %19 = phi i32 [ 0, %1 ], [ 1, %11 ], [ 0, %13 ]
  ret i32 %19
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, argmem: readwrite, inaccessiblemem: none) uwtable(sync)
define void @melt_data(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #3 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %70, label %5

5:                                                ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = icmp ult i32 %3, 8
  br i1 %7, label %57, label %8

8:                                                ; preds = %5
  %9 = shl nsw i64 %6, 2
  %10 = getelementptr i8, ptr %0, i64 %9
  %11 = getelementptr i8, ptr %1, i64 %9
  %12 = icmp ugt ptr %11, %0
  %13 = icmp ugt ptr %10, %1
  %14 = and i1 %12, %13
  br i1 %14, label %57, label %15

15:                                               ; preds = %8
  %16 = and i64 %6, -4
  %17 = and i64 %6, 3
  %18 = getelementptr i8, ptr %0, i64 -12
  %19 = getelementptr i8, ptr %1, i64 -12
  %20 = getelementptr i8, ptr %0, i64 -4
  %21 = getelementptr i8, ptr %0, i64 -8
  %22 = getelementptr i8, ptr %0, i64 -12
  %23 = getelementptr i8, ptr %0, i64 -16
  br label %24

24:                                               ; preds = %52, %15
  %25 = phi i64 [ 0, %15 ], [ %53, %52 ]
  %26 = sub i64 %6, %25
  %27 = add nsw i64 %26, -1
  %28 = getelementptr i32, ptr %18, i64 %27
  %29 = load <4 x i32>, ptr %28, align 4, !tbaa !5, !alias.scope !11, !noalias !14
  %30 = getelementptr i32, ptr %19, i64 %27
  %31 = load <4 x i32>, ptr %30, align 4, !tbaa !5, !alias.scope !14
  %32 = icmp sgt <4 x i32> %29, %31
  %33 = extractelement <4 x i1> %32, i64 3
  br i1 %33, label %34, label %37

34:                                               ; preds = %24
  %35 = getelementptr i32, ptr %20, i64 %26
  %36 = extractelement <4 x i32> %31, i64 3
  store i32 %36, ptr %35, align 4, !tbaa !5, !alias.scope !11, !noalias !14
  br label %37

37:                                               ; preds = %34, %24
  %38 = extractelement <4 x i1> %32, i64 2
  br i1 %38, label %39, label %42

39:                                               ; preds = %37
  %40 = getelementptr i32, ptr %21, i64 %26
  %41 = extractelement <4 x i32> %31, i64 2
  store i32 %41, ptr %40, align 4, !tbaa !5, !alias.scope !11, !noalias !14
  br label %42

42:                                               ; preds = %39, %37
  %43 = extractelement <4 x i1> %32, i64 1
  br i1 %43, label %44, label %47

44:                                               ; preds = %42
  %45 = getelementptr i32, ptr %22, i64 %26
  %46 = extractelement <4 x i32> %31, i64 1
  store i32 %46, ptr %45, align 4, !tbaa !5, !alias.scope !11, !noalias !14
  br label %47

47:                                               ; preds = %44, %42
  %48 = extractelement <4 x i1> %32, i64 0
  br i1 %48, label %49, label %52

49:                                               ; preds = %47
  %50 = getelementptr i32, ptr %23, i64 %26
  %51 = extractelement <4 x i32> %31, i64 0
  store i32 %51, ptr %50, align 4, !tbaa !5, !alias.scope !11, !noalias !14
  br label %52

52:                                               ; preds = %49, %47
  %53 = add nuw i64 %25, 4
  %54 = icmp eq i64 %53, %16
  br i1 %54, label %55, label %24, !llvm.loop !16

55:                                               ; preds = %52
  %56 = icmp eq i64 %16, %6
  br i1 %56, label %70, label %57

57:                                               ; preds = %55, %8, %5
  %58 = phi i64 [ %6, %8 ], [ %6, %5 ], [ %17, %55 ]
  br label %59

59:                                               ; preds = %68, %57
  %60 = phi i64 [ %61, %68 ], [ %58, %57 ]
  %61 = add nsw i64 %60, -1
  %62 = getelementptr inbounds i32, ptr %0, i64 %61
  %63 = load i32, ptr %62, align 4, !tbaa !5
  %64 = getelementptr inbounds i32, ptr %1, i64 %61
  %65 = load i32, ptr %64, align 4, !tbaa !5
  %66 = icmp sgt i32 %63, %65
  br i1 %66, label %67, label %68

67:                                               ; preds = %59
  store i32 %65, ptr %62, align 4, !tbaa !5
  br label %68

68:                                               ; preds = %67, %59
  %69 = icmp eq i64 %61, 0
  br i1 %69, label %70, label %59, !llvm.loop !19

70:                                               ; preds = %68, %55, %2
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @equal_data(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  br label %5

5:                                                ; preds = %8, %2
  %6 = phi i64 [ %9, %8 ], [ %4, %2 ]
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %18, label %8

8:                                                ; preds = %5
  %9 = add nsw i64 %6, -1
  %10 = getelementptr inbounds i32, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, ptr %1, i64 %9
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = icmp eq i32 %11, %13
  br i1 %14, label %5, label %15, !llvm.loop !20

15:                                               ; preds = %8
  %16 = icmp slt i64 %6, 1
  %17 = zext i1 %16 to i32
  br label %18

18:                                               ; preds = %15, %5
  %19 = phi i32 [ %17, %15 ], [ 1, %5 ]
  ret i32 %19
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @valid_data(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %18, label %4

4:                                                ; preds = %1
  %5 = load i32, ptr @nrow, align 4, !tbaa !5
  %6 = zext i32 %2 to i64
  br label %7

7:                                                ; preds = %7, %4
  %8 = phi i64 [ 0, %4 ], [ %13, %7 ]
  %9 = phi i32 [ %5, %4 ], [ %11, %7 ]
  %10 = getelementptr inbounds i32, ptr %0, i64 %8
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = icmp sle i32 %11, %9
  %13 = add nuw nsw i64 %8, 1
  %14 = icmp ne i64 %13, %6
  %15 = select i1 %12, i1 %14, i1 false
  br i1 %15, label %7, label %16, !llvm.loop !21

16:                                               ; preds = %7
  %17 = zext i1 %12 to i32
  br label %18

18:                                               ; preds = %16, %1
  %19 = phi i32 [ 1, %1 ], [ %17, %16 ]
  ret i32 %19
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @dump_list(ptr noundef %0) local_unnamed_addr #5 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %4, %1
  ret void

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, ptr %0, i64 8
  %6 = load ptr, ptr %5, align 8, !tbaa !22
  tail call void @dump_list(ptr noundef %6)
  %7 = load ptr, ptr %0, align 8, !tbaa !25
  tail call void @free(ptr noundef %7)
  tail call void @free(ptr noundef nonnull %0)
  br label %3
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable(sync)
define void @dump_play(ptr noundef %0) local_unnamed_addr #5 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %4, %1
  ret void

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, ptr %0, i64 24
  %6 = load ptr, ptr %5, align 8, !tbaa !26
  tail call void @dump_play(ptr noundef %6)
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  %8 = load ptr, ptr %7, align 8, !tbaa !28
  tail call void @dump_list(ptr noundef %8)
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8, !tbaa !29
  tail call void @free(ptr noundef %10)
  tail call void @free(ptr noundef nonnull %0)
  br label %3
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define i32 @get_value(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = sext i32 %2 to i64
  br label %4

4:                                                ; preds = %21, %1
  %5 = phi ptr [ @game_tree, %1 ], [ %22, %21 ]
  %6 = load ptr, ptr %5, align 8, !tbaa !30
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %8 = load ptr, ptr %7, align 8, !tbaa !29
  br label %9

9:                                                ; preds = %12, %4
  %10 = phi i64 [ %13, %12 ], [ %3, %4 ]
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %23, label %12

12:                                               ; preds = %9
  %13 = add nsw i64 %10, -1
  %14 = getelementptr inbounds i32, ptr %8, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = getelementptr inbounds i32, ptr %0, i64 %13
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %9, label %19, !llvm.loop !20

19:                                               ; preds = %12
  %20 = icmp sgt i64 %10, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = getelementptr inbounds i8, ptr %6, i64 24
  br label %4, !llvm.loop !31

23:                                               ; preds = %19, %9
  %24 = load i32, ptr %6, align 8, !tbaa !32
  ret i32 %24
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_data(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %20, label %4

4:                                                ; preds = %17, %1
  %5 = phi i64 [ %6, %17 ], [ 0, %1 ]
  %6 = add nuw nsw i64 %5, 1
  %7 = getelementptr inbounds i32, ptr %0, i64 %5
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %8)
  %10 = load i32, ptr @ncol, align 4, !tbaa !5
  %11 = zext i32 %10 to i64
  %12 = icmp eq i64 %6, %11
  br i1 %12, label %17, label %13

13:                                               ; preds = %4
  %14 = tail call i32 @putchar(i32 noundef 44)
  %15 = load i32, ptr @ncol, align 4, !tbaa !5
  %16 = zext i32 %15 to i64
  br label %17

17:                                               ; preds = %13, %4
  %18 = phi i64 [ %16, %13 ], [ %11, %4 ]
  %19 = icmp eq i64 %6, %18
  br i1 %19, label %20, label %4, !llvm.loop !33

20:                                               ; preds = %17, %1
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_move(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  %2 = tail call i32 @putchar(i32 noundef 40)
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %19, label %5

5:                                                ; preds = %14, %1
  %6 = phi i64 [ %7, %14 ], [ 0, %1 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = getelementptr inbounds i32, ptr %0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9)
  %11 = load i32, ptr @ncol, align 4, !tbaa !5
  %12 = zext i32 %11 to i64
  %13 = icmp eq i64 %7, %12
  br i1 %13, label %19, label %14

14:                                               ; preds = %5
  %15 = tail call i32 @putchar(i32 noundef 44)
  %16 = load i32, ptr @ncol, align 4, !tbaa !5
  %17 = zext i32 %16 to i64
  %18 = icmp eq i64 %7, %17
  br i1 %18, label %19, label %5, !llvm.loop !33

19:                                               ; preds = %14, %5, %1
  %20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_list(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %28, label %3

3:                                                ; preds = %23, %1
  %4 = phi ptr [ %26, %23 ], [ %0, %1 ]
  %5 = load ptr, ptr %4, align 8, !tbaa !25
  %6 = tail call i32 @putchar(i32 noundef 40)
  %7 = load i32, ptr @ncol, align 4, !tbaa !5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %23, label %9

9:                                                ; preds = %18, %3
  %10 = phi i64 [ %11, %18 ], [ 0, %3 ]
  %11 = add nuw nsw i64 %10, 1
  %12 = getelementptr inbounds i32, ptr %5, i64 %10
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13)
  %15 = load i32, ptr @ncol, align 4, !tbaa !5
  %16 = zext i32 %15 to i64
  %17 = icmp eq i64 %11, %16
  br i1 %17, label %23, label %18

18:                                               ; preds = %9
  %19 = tail call i32 @putchar(i32 noundef 44)
  %20 = load i32, ptr @ncol, align 4, !tbaa !5
  %21 = zext i32 %20 to i64
  %22 = icmp eq i64 %11, %21
  br i1 %22, label %23, label %9, !llvm.loop !33

23:                                               ; preds = %18, %9, %3
  %24 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %25 = getelementptr inbounds i8, ptr %4, i64 8
  %26 = load ptr, ptr %25, align 8, !tbaa !22
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %3, !llvm.loop !34

28:                                               ; preds = %23, %1
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_play(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %60, label %3

3:                                                ; preds = %56, %1
  %4 = phi ptr [ %58, %56 ], [ %0, %1 ]
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.18)
  %6 = getelementptr inbounds i8, ptr %4, i64 8
  %7 = load ptr, ptr %6, align 8, !tbaa !29
  %8 = load i32, ptr @ncol, align 4, !tbaa !5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %24, label %10

10:                                               ; preds = %19, %3
  %11 = phi i64 [ %12, %19 ], [ 0, %3 ]
  %12 = add nuw nsw i64 %11, 1
  %13 = getelementptr inbounds i32, ptr %7, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %14)
  %16 = load i32, ptr @ncol, align 4, !tbaa !5
  %17 = zext i32 %16 to i64
  %18 = icmp eq i64 %12, %17
  br i1 %18, label %24, label %19

19:                                               ; preds = %10
  %20 = tail call i32 @putchar(i32 noundef 44)
  %21 = load i32, ptr @ncol, align 4, !tbaa !5
  %22 = zext i32 %21 to i64
  %23 = icmp eq i64 %12, %22
  br i1 %23, label %24, label %10, !llvm.loop !33

24:                                               ; preds = %19, %10, %3
  %25 = load i32, ptr %4, align 8, !tbaa !32
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %25)
  %27 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.19)
  %28 = getelementptr inbounds i8, ptr %4, i64 16
  %29 = load ptr, ptr %28, align 8, !tbaa !28
  %30 = icmp eq ptr %29, null
  br i1 %30, label %56, label %31

31:                                               ; preds = %51, %24
  %32 = phi ptr [ %54, %51 ], [ %29, %24 ]
  %33 = load ptr, ptr %32, align 8, !tbaa !25
  %34 = tail call i32 @putchar(i32 noundef 40)
  %35 = load i32, ptr @ncol, align 4, !tbaa !5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %51, label %37

37:                                               ; preds = %46, %31
  %38 = phi i64 [ %39, %46 ], [ 0, %31 ]
  %39 = add nuw nsw i64 %38, 1
  %40 = getelementptr inbounds i32, ptr %33, i64 %38
  %41 = load i32, ptr %40, align 4, !tbaa !5
  %42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %41)
  %43 = load i32, ptr @ncol, align 4, !tbaa !5
  %44 = zext i32 %43 to i64
  %45 = icmp eq i64 %39, %44
  br i1 %45, label %51, label %46

46:                                               ; preds = %37
  %47 = tail call i32 @putchar(i32 noundef 44)
  %48 = load i32, ptr @ncol, align 4, !tbaa !5
  %49 = zext i32 %48 to i64
  %50 = icmp eq i64 %39, %49
  br i1 %50, label %51, label %37, !llvm.loop !33

51:                                               ; preds = %46, %37, %31
  %52 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %53 = getelementptr inbounds i8, ptr %32, i64 8
  %54 = load ptr, ptr %53, align 8, !tbaa !22
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %31, !llvm.loop !34

56:                                               ; preds = %51, %24
  %57 = getelementptr inbounds i8, ptr %4, i64 24
  %58 = load ptr, ptr %57, align 8, !tbaa !26
  %59 = icmp eq ptr %58, null
  br i1 %59, label %60, label %3, !llvm.loop !35

60:                                               ; preds = %56, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @in_wanted(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load ptr, ptr @wanted, align 8, !tbaa !30
  %3 = icmp eq ptr %2, null
  br i1 %3, label %26, label %4

4:                                                ; preds = %1
  %5 = load i32, ptr @ncol, align 4, !tbaa !5
  %6 = sext i32 %5 to i64
  br label %11

7:                                                ; preds = %24
  %8 = getelementptr inbounds i8, ptr %12, i64 8
  %9 = load ptr, ptr %8, align 8, !tbaa !30
  %10 = icmp eq ptr %9, null
  br i1 %10, label %26, label %11, !llvm.loop !36

11:                                               ; preds = %7, %4
  %12 = phi ptr [ %2, %4 ], [ %9, %7 ]
  %13 = load ptr, ptr %12, align 8, !tbaa !25
  br label %14

14:                                               ; preds = %17, %11
  %15 = phi i64 [ %18, %17 ], [ %6, %11 ]
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %26, label %17

17:                                               ; preds = %14
  %18 = add nsw i64 %15, -1
  %19 = getelementptr inbounds i32, ptr %13, i64 %18
  %20 = load i32, ptr %19, align 4, !tbaa !5
  %21 = getelementptr inbounds i32, ptr %0, i64 %18
  %22 = load i32, ptr %21, align 4, !tbaa !5
  %23 = icmp eq i32 %20, %22
  br i1 %23, label %14, label %24, !llvm.loop !20

24:                                               ; preds = %17
  %25 = icmp sgt i64 %15, 0
  br i1 %25, label %7, label %26

26:                                               ; preds = %24, %14, %7, %1
  %27 = phi i32 [ 0, %1 ], [ 1, %14 ], [ 0, %7 ], [ 1, %24 ]
  ret i32 %27
}

; Function Attrs: nofree nounwind ssp memory(readwrite, argmem: none) uwtable(sync)
define noalias noundef ptr @make_data(i32 noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  %5 = shl nsw i64 %4, 2
  %6 = tail call ptr @malloc(i64 noundef %5) #14
  %7 = icmp eq i32 %1, 0
  br i1 %7, label %28, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr @nrow, align 4, !tbaa !5
  %10 = zext i32 %1 to i64
  %11 = icmp ult i32 %1, 16
  br i1 %11, label %12, label %14

12:                                               ; preds = %26, %8
  %13 = phi i64 [ 0, %8 ], [ %15, %26 ]
  br label %53

14:                                               ; preds = %8
  %15 = and i64 %10, 4294967280
  %16 = insertelement <4 x i32> poison, i32 %9, i64 0
  %17 = shufflevector <4 x i32> %16, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %18

18:                                               ; preds = %18, %14
  %19 = phi i64 [ 0, %14 ], [ %24, %18 ]
  %20 = getelementptr inbounds i32, ptr %6, i64 %19
  %21 = getelementptr inbounds i8, ptr %20, i64 16
  %22 = getelementptr inbounds i8, ptr %20, i64 32
  %23 = getelementptr inbounds i8, ptr %20, i64 48
  store <4 x i32> %17, ptr %20, align 4, !tbaa !5
  store <4 x i32> %17, ptr %21, align 4, !tbaa !5
  store <4 x i32> %17, ptr %22, align 4, !tbaa !5
  store <4 x i32> %17, ptr %23, align 4, !tbaa !5
  %24 = add nuw i64 %19, 16
  %25 = icmp eq i64 %24, %15
  br i1 %25, label %26, label %18, !llvm.loop !37

26:                                               ; preds = %18
  %27 = icmp eq i64 %15, %10
  br i1 %27, label %28, label %12

28:                                               ; preds = %53, %26, %2
  %29 = icmp eq i32 %3, %1
  br i1 %29, label %63, label %30

30:                                               ; preds = %28
  %31 = zext i32 %1 to i64
  %32 = zext i32 %3 to i64
  %33 = sub nsw i64 %32, %31
  %34 = icmp ult i64 %33, 16
  br i1 %34, label %35, label %37

35:                                               ; preds = %51, %30
  %36 = phi i64 [ %31, %30 ], [ %39, %51 ]
  br label %58

37:                                               ; preds = %30
  %38 = and i64 %33, -16
  %39 = add nsw i64 %38, %31
  %40 = insertelement <4 x i32> poison, i32 %0, i64 0
  %41 = shufflevector <4 x i32> %40, <4 x i32> poison, <4 x i32> zeroinitializer
  %42 = getelementptr i32, ptr %6, i64 %31
  br label %43

43:                                               ; preds = %43, %37
  %44 = phi i64 [ 0, %37 ], [ %49, %43 ]
  %45 = getelementptr i32, ptr %42, i64 %44
  %46 = getelementptr inbounds i8, ptr %45, i64 16
  %47 = getelementptr inbounds i8, ptr %45, i64 32
  %48 = getelementptr inbounds i8, ptr %45, i64 48
  store <4 x i32> %41, ptr %45, align 4, !tbaa !5
  store <4 x i32> %41, ptr %46, align 4, !tbaa !5
  store <4 x i32> %41, ptr %47, align 4, !tbaa !5
  store <4 x i32> %41, ptr %48, align 4, !tbaa !5
  %49 = add nuw i64 %44, 16
  %50 = icmp eq i64 %49, %38
  br i1 %50, label %51, label %43, !llvm.loop !38

51:                                               ; preds = %43
  %52 = icmp eq i64 %33, %38
  br i1 %52, label %63, label %35

53:                                               ; preds = %53, %12
  %54 = phi i64 [ %56, %53 ], [ %13, %12 ]
  %55 = getelementptr inbounds i32, ptr %6, i64 %54
  store i32 %9, ptr %55, align 4, !tbaa !5
  %56 = add nuw nsw i64 %54, 1
  %57 = icmp eq i64 %56, %10
  br i1 %57, label %28, label %53, !llvm.loop !39

58:                                               ; preds = %58, %35
  %59 = phi i64 [ %61, %58 ], [ %36, %35 ]
  %60 = getelementptr inbounds i32, ptr %6, i64 %59
  store i32 %0, ptr %60, align 4, !tbaa !5
  %61 = add nuw nsw i64 %59, 1
  %62 = icmp eq i64 %61, %32
  br i1 %62, label %63, label %58, !llvm.loop !40

63:                                               ; preds = %58, %51, %28
  ret ptr %6
}

; Function Attrs: nounwind ssp uwtable(sync)
define ptr @make_list(ptr nocapture noundef readonly %0, ptr nocapture noundef %1, ptr nocapture noundef %2) local_unnamed_addr #5 {
  store i32 1, ptr %1, align 4, !tbaa !5
  %4 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  store ptr null, ptr %5, align 8, !tbaa !22
  %6 = load i32, ptr @nrow, align 4, !tbaa !5
  %7 = icmp eq i32 %6, 0
  %8 = load i32, ptr @ncol, align 4
  %9 = icmp eq i32 %8, 0
  %10 = select i1 %7, i1 true, i1 %9
  br i1 %10, label %244, label %11

11:                                               ; preds = %3
  %12 = getelementptr i8, ptr %0, i64 -12
  br label %13

13:                                               ; preds = %237, %11
  %14 = phi i32 [ %238, %237 ], [ %6, %11 ]
  %15 = phi i32 [ %239, %237 ], [ %8, %11 ]
  %16 = phi ptr [ %241, %237 ], [ %4, %11 ]
  %17 = phi i32 [ %242, %237 ], [ 0, %11 ]
  %18 = icmp eq i32 %15, 0
  br i1 %18, label %237, label %19

19:                                               ; preds = %13
  %20 = load ptr, ptr @wanted, align 8
  %21 = icmp eq ptr %20, null
  br label %22

22:                                               ; preds = %228, %19
  %23 = phi i32 [ %15, %19 ], [ %233, %228 ]
  %24 = phi ptr [ %16, %19 ], [ %231, %228 ]
  %25 = phi i32 [ %17, %19 ], [ %230, %228 ]
  %26 = phi i32 [ 0, %19 ], [ %232, %228 ]
  %27 = sext i32 %23 to i64
  %28 = shl nsw i64 %27, 2
  %29 = tail call ptr @malloc(i64 noundef %28) #14
  %30 = icmp eq i32 %26, 0
  br i1 %30, label %51, label %31

31:                                               ; preds = %22
  %32 = load i32, ptr @nrow, align 4, !tbaa !5
  %33 = zext i32 %26 to i64
  %34 = icmp ult i32 %26, 16
  br i1 %34, label %35, label %37

35:                                               ; preds = %49, %31
  %36 = phi i64 [ 0, %31 ], [ %38, %49 ]
  br label %74

37:                                               ; preds = %31
  %38 = and i64 %33, 4294967280
  %39 = insertelement <4 x i32> poison, i32 %32, i64 0
  %40 = shufflevector <4 x i32> %39, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %41

41:                                               ; preds = %41, %37
  %42 = phi i64 [ 0, %37 ], [ %47, %41 ]
  %43 = getelementptr inbounds i32, ptr %29, i64 %42
  %44 = getelementptr inbounds i8, ptr %43, i64 16
  %45 = getelementptr inbounds i8, ptr %43, i64 32
  %46 = getelementptr inbounds i8, ptr %43, i64 48
  store <4 x i32> %40, ptr %43, align 4, !tbaa !5
  store <4 x i32> %40, ptr %44, align 4, !tbaa !5
  store <4 x i32> %40, ptr %45, align 4, !tbaa !5
  store <4 x i32> %40, ptr %46, align 4, !tbaa !5
  %47 = add nuw i64 %42, 16
  %48 = icmp eq i64 %47, %38
  br i1 %48, label %49, label %41, !llvm.loop !41

49:                                               ; preds = %41
  %50 = icmp eq i64 %38, %33
  br i1 %50, label %51, label %35

51:                                               ; preds = %74, %49, %22
  %52 = phi i64 [ 0, %22 ], [ %33, %49 ], [ %33, %74 ]
  %53 = zext i32 %23 to i64
  %54 = sub nsw i64 %53, %52
  %55 = icmp ult i64 %54, 16
  br i1 %55, label %56, label %58

56:                                               ; preds = %72, %51
  %57 = phi i64 [ %52, %51 ], [ %60, %72 ]
  br label %79

58:                                               ; preds = %51
  %59 = and i64 %54, -16
  %60 = add nsw i64 %52, %59
  %61 = insertelement <4 x i32> poison, i32 %25, i64 0
  %62 = shufflevector <4 x i32> %61, <4 x i32> poison, <4 x i32> zeroinitializer
  %63 = getelementptr i32, ptr %29, i64 %52
  br label %64

64:                                               ; preds = %64, %58
  %65 = phi i64 [ 0, %58 ], [ %70, %64 ]
  %66 = getelementptr i32, ptr %63, i64 %65
  %67 = getelementptr inbounds i8, ptr %66, i64 16
  %68 = getelementptr inbounds i8, ptr %66, i64 32
  %69 = getelementptr inbounds i8, ptr %66, i64 48
  store <4 x i32> %62, ptr %66, align 4, !tbaa !5
  store <4 x i32> %62, ptr %67, align 4, !tbaa !5
  store <4 x i32> %62, ptr %68, align 4, !tbaa !5
  store <4 x i32> %62, ptr %69, align 4, !tbaa !5
  %70 = add nuw i64 %65, 16
  %71 = icmp eq i64 %70, %59
  br i1 %71, label %72, label %64, !llvm.loop !42

72:                                               ; preds = %64
  %73 = icmp eq i64 %54, %59
  br i1 %73, label %84, label %56

74:                                               ; preds = %74, %35
  %75 = phi i64 [ %77, %74 ], [ %36, %35 ]
  %76 = getelementptr inbounds i32, ptr %29, i64 %75
  store i32 %32, ptr %76, align 4, !tbaa !5
  %77 = add nuw nsw i64 %75, 1
  %78 = icmp eq i64 %77, %33
  br i1 %78, label %51, label %74, !llvm.loop !43

79:                                               ; preds = %79, %56
  %80 = phi i64 [ %82, %79 ], [ %57, %56 ]
  %81 = getelementptr inbounds i32, ptr %29, i64 %80
  store i32 %25, ptr %81, align 4, !tbaa !5
  %82 = add nuw nsw i64 %80, 1
  %83 = icmp eq i64 %82, %53
  br i1 %83, label %84, label %79, !llvm.loop !44

84:                                               ; preds = %79, %72
  %85 = icmp ult i32 %23, 4
  br i1 %85, label %127, label %86

86:                                               ; preds = %84
  %87 = and i64 %27, -4
  %88 = and i64 %27, 3
  %89 = getelementptr i8, ptr %29, i64 -12
  %90 = getelementptr i8, ptr %29, i64 -4
  %91 = getelementptr i8, ptr %29, i64 -8
  %92 = getelementptr i8, ptr %29, i64 -12
  %93 = getelementptr i8, ptr %29, i64 -16
  br label %94

94:                                               ; preds = %122, %86
  %95 = phi i64 [ 0, %86 ], [ %123, %122 ]
  %96 = sub i64 %27, %95
  %97 = add nsw i64 %96, -1
  %98 = getelementptr i32, ptr %89, i64 %97
  %99 = load <4 x i32>, ptr %98, align 4, !tbaa !5
  %100 = getelementptr i32, ptr %12, i64 %97
  %101 = load <4 x i32>, ptr %100, align 4, !tbaa !5
  %102 = icmp sgt <4 x i32> %99, %101
  %103 = extractelement <4 x i1> %102, i64 3
  br i1 %103, label %104, label %107

104:                                              ; preds = %94
  %105 = getelementptr i32, ptr %90, i64 %96
  %106 = extractelement <4 x i32> %101, i64 3
  store i32 %106, ptr %105, align 4, !tbaa !5
  br label %107

107:                                              ; preds = %104, %94
  %108 = extractelement <4 x i1> %102, i64 2
  br i1 %108, label %109, label %112

109:                                              ; preds = %107
  %110 = getelementptr i32, ptr %91, i64 %96
  %111 = extractelement <4 x i32> %101, i64 2
  store i32 %111, ptr %110, align 4, !tbaa !5
  br label %112

112:                                              ; preds = %109, %107
  %113 = extractelement <4 x i1> %102, i64 1
  br i1 %113, label %114, label %117

114:                                              ; preds = %112
  %115 = getelementptr i32, ptr %92, i64 %96
  %116 = extractelement <4 x i32> %101, i64 1
  store i32 %116, ptr %115, align 4, !tbaa !5
  br label %117

117:                                              ; preds = %114, %112
  %118 = extractelement <4 x i1> %102, i64 0
  br i1 %118, label %119, label %122

119:                                              ; preds = %117
  %120 = getelementptr i32, ptr %93, i64 %96
  %121 = extractelement <4 x i32> %101, i64 0
  store i32 %121, ptr %120, align 4, !tbaa !5
  br label %122

122:                                              ; preds = %119, %117
  %123 = add nuw i64 %95, 4
  %124 = icmp eq i64 %123, %87
  br i1 %124, label %125, label %94, !llvm.loop !45

125:                                              ; preds = %122
  %126 = icmp eq i64 %87, %27
  br i1 %126, label %140, label %127

127:                                              ; preds = %125, %84
  %128 = phi i64 [ %27, %84 ], [ %88, %125 ]
  br label %129

129:                                              ; preds = %138, %127
  %130 = phi i64 [ %131, %138 ], [ %128, %127 ]
  %131 = add nsw i64 %130, -1
  %132 = getelementptr inbounds i32, ptr %29, i64 %131
  %133 = load i32, ptr %132, align 4, !tbaa !5
  %134 = getelementptr inbounds i32, ptr %0, i64 %131
  %135 = load i32, ptr %134, align 4, !tbaa !5
  %136 = icmp sgt i32 %133, %135
  br i1 %136, label %137, label %138

137:                                              ; preds = %129
  store i32 %135, ptr %132, align 4, !tbaa !5
  br label %138

138:                                              ; preds = %137, %129
  %139 = icmp eq i64 %131, 0
  br i1 %139, label %140, label %129, !llvm.loop !46

140:                                              ; preds = %138, %125
  br label %141

141:                                              ; preds = %144, %140
  %142 = phi i64 [ %145, %144 ], [ %27, %140 ]
  %143 = icmp eq i64 %142, 0
  br i1 %143, label %223, label %144

144:                                              ; preds = %141
  %145 = add nsw i64 %142, -1
  %146 = getelementptr inbounds i32, ptr %29, i64 %145
  %147 = load i32, ptr %146, align 4, !tbaa !5
  %148 = getelementptr inbounds i32, ptr %0, i64 %145
  %149 = load i32, ptr %148, align 4, !tbaa !5
  %150 = icmp eq i32 %147, %149
  br i1 %150, label %141, label %151, !llvm.loop !20

151:                                              ; preds = %144
  %152 = icmp sgt i64 %142, 0
  br i1 %152, label %153, label %223

153:                                              ; preds = %151
  %154 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %155 = getelementptr inbounds i8, ptr %24, i64 8
  store ptr %154, ptr %155, align 8, !tbaa !22
  %156 = tail call ptr @malloc(i64 noundef %28) #14
  %157 = add i32 %23, -1
  %158 = sext i32 %157 to i64
  %159 = zext i32 %157 to i64
  %160 = sub nsw i64 %158, %159
  %161 = shl nsw i64 %160, 2
  %162 = getelementptr i8, ptr %156, i64 %161
  %163 = getelementptr i8, ptr %29, i64 %161
  %164 = shl nuw nsw i64 %53, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %162, ptr readonly align 4 %163, i64 %164, i1 false), !tbaa !5
  store ptr %156, ptr %154, align 8, !tbaa !25
  %165 = getelementptr inbounds i8, ptr %154, i64 8
  store ptr null, ptr %165, align 8, !tbaa !22
  %166 = load ptr, ptr %155, align 8, !tbaa !22
  %167 = load i32, ptr %1, align 4, !tbaa !5
  %168 = icmp eq i32 %167, 1
  br i1 %168, label %169, label %190

169:                                              ; preds = %186, %153
  %170 = phi ptr [ %187, %186 ], [ @game_tree, %153 ]
  %171 = load ptr, ptr %170, align 8, !tbaa !30
  %172 = getelementptr inbounds i8, ptr %171, i64 8
  %173 = load ptr, ptr %172, align 8, !tbaa !29
  br label %174

174:                                              ; preds = %177, %169
  %175 = phi i64 [ %178, %177 ], [ %27, %169 ]
  %176 = icmp eq i64 %175, 0
  br i1 %176, label %188, label %177

177:                                              ; preds = %174
  %178 = add nsw i64 %175, -1
  %179 = getelementptr inbounds i32, ptr %173, i64 %178
  %180 = load i32, ptr %179, align 4, !tbaa !5
  %181 = getelementptr inbounds i32, ptr %29, i64 %178
  %182 = load i32, ptr %181, align 4, !tbaa !5
  %183 = icmp eq i32 %180, %182
  br i1 %183, label %174, label %184, !llvm.loop !20

184:                                              ; preds = %177
  %185 = icmp sgt i64 %175, 0
  br i1 %185, label %186, label %188

186:                                              ; preds = %184
  %187 = getelementptr inbounds i8, ptr %171, i64 24
  br label %169, !llvm.loop !31

188:                                              ; preds = %184, %174
  %189 = load i32, ptr %171, align 8, !tbaa !32
  store i32 %189, ptr %1, align 4, !tbaa !5
  br label %190

190:                                              ; preds = %188, %153
  %191 = phi i32 [ %189, %188 ], [ %167, %153 ]
  %192 = load i32, ptr %2, align 4, !tbaa !5
  %193 = icmp eq i32 %192, 0
  %194 = icmp eq i32 %191, 0
  %195 = select i1 %193, i1 %194, i1 false
  br i1 %195, label %196, label %228

196:                                              ; preds = %190
  %197 = load i32, ptr @ncol, align 4, !tbaa !5
  %198 = add nsw i32 %197, -1
  %199 = load i32, ptr @nrow, align 4, !tbaa !5
  %200 = add nsw i32 %199, -1
  br i1 %21, label %228, label %201

201:                                              ; preds = %196
  %202 = sext i32 %197 to i64
  br label %207

203:                                              ; preds = %220
  %204 = getelementptr inbounds i8, ptr %208, i64 8
  %205 = load ptr, ptr %204, align 8, !tbaa !30
  %206 = icmp eq ptr %205, null
  br i1 %206, label %228, label %207, !llvm.loop !36

207:                                              ; preds = %203, %201
  %208 = phi ptr [ %20, %201 ], [ %205, %203 ]
  %209 = load ptr, ptr %208, align 8, !tbaa !25
  br label %210

210:                                              ; preds = %213, %207
  %211 = phi i64 [ %214, %213 ], [ %202, %207 ]
  %212 = icmp eq i64 %211, 0
  br i1 %212, label %222, label %213

213:                                              ; preds = %210
  %214 = add nsw i64 %211, -1
  %215 = getelementptr inbounds i32, ptr %209, i64 %214
  %216 = load i32, ptr %215, align 4, !tbaa !5
  %217 = getelementptr inbounds i32, ptr %29, i64 %214
  %218 = load i32, ptr %217, align 4, !tbaa !5
  %219 = icmp eq i32 %216, %218
  br i1 %219, label %210, label %220, !llvm.loop !20

220:                                              ; preds = %213
  %221 = icmp sgt i64 %211, 0
  br i1 %221, label %203, label %222

222:                                              ; preds = %220, %210
  store i32 2, ptr %2, align 4, !tbaa !5
  br label %228

223:                                              ; preds = %151, %141
  %224 = load i32, ptr @nrow, align 4
  %225 = add nsw i32 %224, -1
  %226 = select i1 %30, i32 %225, i32 %25
  %227 = add nsw i32 %23, -1
  br label %228

228:                                              ; preds = %223, %222, %203, %196, %190
  %229 = phi i32 [ %227, %223 ], [ %26, %190 ], [ %198, %222 ], [ %198, %196 ], [ %198, %203 ]
  %230 = phi i32 [ %226, %223 ], [ %25, %190 ], [ %200, %222 ], [ %200, %196 ], [ %200, %203 ]
  %231 = phi ptr [ %24, %223 ], [ %166, %190 ], [ %166, %222 ], [ %166, %196 ], [ %166, %203 ]
  tail call void @free(ptr noundef %29)
  %232 = add nsw i32 %229, 1
  %233 = load i32, ptr @ncol, align 4, !tbaa !5
  %234 = icmp eq i32 %232, %233
  br i1 %234, label %235, label %22, !llvm.loop !47

235:                                              ; preds = %228
  %236 = load i32, ptr @nrow, align 4, !tbaa !5
  br label %237

237:                                              ; preds = %235, %13
  %238 = phi i32 [ %14, %13 ], [ %236, %235 ]
  %239 = phi i32 [ 0, %13 ], [ %232, %235 ]
  %240 = phi i32 [ %17, %13 ], [ %230, %235 ]
  %241 = phi ptr [ %16, %13 ], [ %231, %235 ]
  %242 = add nsw i32 %240, 1
  %243 = icmp eq i32 %242, %238
  br i1 %243, label %245, label %13, !llvm.loop !48

244:                                              ; preds = %3
  tail call void @free(ptr noundef nonnull %4)
  br label %251

245:                                              ; preds = %237
  %246 = load ptr, ptr %5, align 8, !tbaa !22
  tail call void @free(ptr noundef %4)
  %247 = icmp eq ptr %246, null
  br i1 %247, label %251, label %248

248:                                              ; preds = %245
  %249 = load i32, ptr %1, align 4, !tbaa !5
  %250 = sub nsw i32 1, %249
  store i32 %250, ptr %1, align 4, !tbaa !5
  br label %251

251:                                              ; preds = %248, %245, %244
  %252 = phi ptr [ null, %244 ], [ %246, %248 ], [ null, %245 ]
  ret ptr %252
}

; Function Attrs: nounwind ssp uwtable(sync)
define ptr @make_play(i32 noundef %0) local_unnamed_addr #5 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #15
  %4 = tail call dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #14
  store ptr null, ptr @game_tree, align 8, !tbaa !30
  %5 = load i32, ptr @ncol, align 4, !tbaa !5
  %6 = sext i32 %5 to i64
  %7 = shl nsw i64 %6, 2
  %8 = tail call ptr @malloc(i64 noundef %7) #14
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %114, label %10

10:                                               ; preds = %1
  %11 = zext i32 %5 to i64
  %12 = shl nuw nsw i64 %11, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 %12, i1 false), !tbaa !5
  %13 = load i32, ptr %8, align 4, !tbaa !5
  %14 = add nsw i32 %13, -1
  store i32 %14, ptr %8, align 4, !tbaa !5
  br label %15

15:                                               ; preds = %109, %10
  %16 = phi ptr [ %112, %109 ], [ %4, %10 ]
  %17 = phi ptr [ %111, %109 ], [ %8, %10 ]
  br label %18

18:                                               ; preds = %24, %15
  %19 = phi i64 [ 0, %15 ], [ %25, %24 ]
  %20 = getelementptr inbounds i32, ptr %17, i64 %19
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = load i32, ptr @nrow, align 4, !tbaa !5
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %29

24:                                               ; preds = %18
  %25 = add nuw nsw i64 %19, 1
  store i32 0, ptr %20, align 4
  %26 = load i32, ptr @ncol, align 4, !tbaa !5
  %27 = zext i32 %26 to i64
  %28 = icmp eq i64 %25, %27
  br i1 %28, label %114, label %18, !llvm.loop !9

29:                                               ; preds = %18
  %30 = add nsw i32 %21, 1
  store i32 %30, ptr %20, align 4
  %31 = load i32, ptr @ncol, align 4, !tbaa !5
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %46, label %33

33:                                               ; preds = %29
  %34 = load i32, ptr @nrow, align 4, !tbaa !5
  %35 = zext i32 %31 to i64
  br label %36

36:                                               ; preds = %36, %33
  %37 = phi i64 [ 0, %33 ], [ %42, %36 ]
  %38 = phi i32 [ %34, %33 ], [ %40, %36 ]
  %39 = getelementptr inbounds i32, ptr %17, i64 %37
  %40 = load i32, ptr %39, align 4, !tbaa !5
  %41 = icmp sle i32 %40, %38
  %42 = add nuw nsw i64 %37, 1
  %43 = icmp ne i64 %42, %35
  %44 = select i1 %41, i1 %43, i1 false
  br i1 %44, label %36, label %45, !llvm.loop !21

45:                                               ; preds = %36
  br i1 %41, label %46, label %109

46:                                               ; preds = %45, %29
  %47 = tail call dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #14
  %48 = getelementptr inbounds i8, ptr %16, i64 24
  store ptr %47, ptr %48, align 8, !tbaa !26
  %49 = load ptr, ptr @game_tree, align 8, !tbaa !30
  %50 = icmp eq ptr %49, null
  br i1 %50, label %51, label %52

51:                                               ; preds = %46
  store ptr %47, ptr @game_tree, align 8, !tbaa !30
  br label %52

52:                                               ; preds = %51, %46
  %53 = sext i32 %31 to i64
  %54 = shl nsw i64 %53, 2
  %55 = tail call ptr @malloc(i64 noundef %54) #14
  br i1 %32, label %66, label %56

56:                                               ; preds = %52
  %57 = add i32 %31, -1
  %58 = sext i32 %57 to i64
  %59 = zext i32 %57 to i64
  %60 = sub nsw i64 %58, %59
  %61 = shl nsw i64 %60, 2
  %62 = getelementptr i8, ptr %55, i64 %61
  %63 = getelementptr i8, ptr %17, i64 %61
  %64 = zext i32 %31 to i64
  %65 = shl nuw nsw i64 %64, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %62, ptr readonly align 4 %63, i64 %65, i1 false), !tbaa !5
  br label %66

66:                                               ; preds = %56, %52
  %67 = getelementptr inbounds i8, ptr %47, i64 8
  store ptr %55, ptr %67, align 8, !tbaa !29
  %68 = call ptr @make_list(ptr noundef nonnull %17, ptr noundef nonnull %3, ptr noundef nonnull %2)
  %69 = load ptr, ptr %48, align 8, !tbaa !26
  %70 = getelementptr inbounds i8, ptr %69, i64 16
  store ptr %68, ptr %70, align 8, !tbaa !28
  %71 = load i32, ptr %3, align 4, !tbaa !5
  store i32 %71, ptr %69, align 8, !tbaa !32
  %72 = getelementptr inbounds i8, ptr %69, i64 24
  store ptr null, ptr %72, align 8, !tbaa !26
  %73 = load ptr, ptr %48, align 8, !tbaa !26
  %74 = load i32, ptr %2, align 4, !tbaa !5
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %78, label %76

76:                                               ; preds = %66
  %77 = load i32, ptr @ncol, align 4, !tbaa !5
  br label %109

78:                                               ; preds = %66
  tail call void @free(ptr noundef nonnull %17)
  %79 = load i32, ptr @nrow, align 4, !tbaa !5
  %80 = load i32, ptr @ncol, align 4, !tbaa !5
  %81 = sext i32 %80 to i64
  %82 = shl nsw i64 %81, 2
  %83 = tail call ptr @malloc(i64 noundef %82) #14
  %84 = icmp eq i32 %80, 0
  br i1 %84, label %114, label %85

85:                                               ; preds = %78
  %86 = zext i32 %80 to i64
  %87 = icmp ult i32 %80, 16
  br i1 %87, label %102, label %88

88:                                               ; preds = %85
  %89 = and i64 %86, 4294967280
  %90 = insertelement <4 x i32> poison, i32 %79, i64 0
  %91 = shufflevector <4 x i32> %90, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %92

92:                                               ; preds = %92, %88
  %93 = phi i64 [ 0, %88 ], [ %98, %92 ]
  %94 = getelementptr inbounds i32, ptr %83, i64 %93
  %95 = getelementptr inbounds i8, ptr %94, i64 16
  %96 = getelementptr inbounds i8, ptr %94, i64 32
  %97 = getelementptr inbounds i8, ptr %94, i64 48
  store <4 x i32> %91, ptr %94, align 4, !tbaa !5
  store <4 x i32> %91, ptr %95, align 4, !tbaa !5
  store <4 x i32> %91, ptr %96, align 4, !tbaa !5
  store <4 x i32> %91, ptr %97, align 4, !tbaa !5
  %98 = add nuw i64 %93, 16
  %99 = icmp eq i64 %98, %89
  br i1 %99, label %100, label %92, !llvm.loop !50

100:                                              ; preds = %92
  %101 = icmp eq i64 %89, %86
  br i1 %101, label %109, label %102

102:                                              ; preds = %100, %85
  %103 = phi i64 [ 0, %85 ], [ %89, %100 ]
  br label %104

104:                                              ; preds = %104, %102
  %105 = phi i64 [ %107, %104 ], [ %103, %102 ]
  %106 = getelementptr inbounds i32, ptr %83, i64 %105
  store i32 %79, ptr %106, align 4, !tbaa !5
  %107 = add nuw nsw i64 %105, 1
  %108 = icmp eq i64 %107, %86
  br i1 %108, label %109, label %104, !llvm.loop !51

109:                                              ; preds = %104, %100, %76, %45
  %110 = phi i32 [ %77, %76 ], [ 1, %45 ], [ 1, %100 ], [ 1, %104 ]
  %111 = phi ptr [ %17, %76 ], [ %17, %45 ], [ %83, %100 ], [ %83, %104 ]
  %112 = phi ptr [ %73, %76 ], [ %16, %45 ], [ %73, %100 ], [ %73, %104 ]
  %113 = icmp eq i32 %110, 0
  br i1 %113, label %114, label %15, !llvm.loop !52

114:                                              ; preds = %109, %78, %24, %1
  %115 = getelementptr inbounds i8, ptr %4, i64 24
  %116 = load ptr, ptr %115, align 8, !tbaa !26
  tail call void @free(ptr noundef %4)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #15
  ret ptr %116
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @make_wanted(ptr nocapture noundef readonly %0) local_unnamed_addr #5 {
  %2 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %3 = getelementptr inbounds i8, ptr %2, i64 8
  store ptr null, ptr %3, align 8, !tbaa !22
  %4 = load i32, ptr @nrow, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %171, label %6

6:                                                ; preds = %1
  %7 = load i32, ptr @ncol, align 4, !tbaa !5
  %8 = icmp eq i32 %7, 0
  %9 = sext i32 %7 to i64
  %10 = shl nsw i64 %9, 2
  %11 = zext i32 %7 to i64
  %12 = add i32 %7, -1
  %13 = sext i32 %12 to i64
  %14 = zext i32 %12 to i64
  %15 = sub nsw i64 %13, %14
  %16 = shl nsw i64 %15, 2
  %17 = shl nuw nsw i64 %11, 2
  %18 = add nsw i32 %4, -1
  br i1 %8, label %171, label %19

19:                                               ; preds = %6
  %20 = insertelement <4 x i32> poison, i32 %4, i64 0
  %21 = shufflevector <4 x i32> %20, <4 x i32> poison, <4 x i32> zeroinitializer
  %22 = icmp ult i32 %7, 4
  %23 = and i64 %9, -4
  %24 = and i64 %9, 3
  %25 = getelementptr i8, ptr %0, i64 -12
  %26 = icmp eq i64 %23, %9
  br label %27

27:                                               ; preds = %163, %19
  %28 = phi ptr [ %2, %19 ], [ %160, %163 ]
  %29 = phi i32 [ 0, %19 ], [ %164, %163 ]
  %30 = phi i32 [ 0, %19 ], [ %165, %163 ]
  %31 = tail call ptr @malloc(i64 noundef %10) #14
  %32 = icmp eq i32 %30, 0
  br i1 %32, label %50, label %33

33:                                               ; preds = %27
  %34 = zext i32 %30 to i64
  %35 = icmp ult i32 %30, 16
  br i1 %35, label %36, label %38

36:                                               ; preds = %48, %33
  %37 = phi i64 [ 0, %33 ], [ %39, %48 ]
  br label %72

38:                                               ; preds = %33
  %39 = and i64 %34, 4294967280
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi i64 [ 0, %38 ], [ %46, %40 ]
  %42 = getelementptr inbounds i32, ptr %31, i64 %41
  %43 = getelementptr inbounds i8, ptr %42, i64 16
  %44 = getelementptr inbounds i8, ptr %42, i64 32
  %45 = getelementptr inbounds i8, ptr %42, i64 48
  store <4 x i32> %21, ptr %42, align 4, !tbaa !5
  store <4 x i32> %21, ptr %43, align 4, !tbaa !5
  store <4 x i32> %21, ptr %44, align 4, !tbaa !5
  store <4 x i32> %21, ptr %45, align 4, !tbaa !5
  %46 = add nuw i64 %41, 16
  %47 = icmp eq i64 %46, %39
  br i1 %47, label %48, label %40, !llvm.loop !53

48:                                               ; preds = %40
  %49 = icmp eq i64 %39, %34
  br i1 %49, label %50, label %36

50:                                               ; preds = %72, %48, %27
  %51 = phi i64 [ 0, %27 ], [ %34, %48 ], [ %34, %72 ]
  %52 = sub nsw i64 %11, %51
  %53 = icmp ult i64 %52, 16
  br i1 %53, label %54, label %56

54:                                               ; preds = %70, %50
  %55 = phi i64 [ %51, %50 ], [ %58, %70 ]
  br label %77

56:                                               ; preds = %50
  %57 = and i64 %52, -16
  %58 = add nsw i64 %51, %57
  %59 = insertelement <4 x i32> poison, i32 %29, i64 0
  %60 = shufflevector <4 x i32> %59, <4 x i32> poison, <4 x i32> zeroinitializer
  %61 = getelementptr i32, ptr %31, i64 %51
  br label %62

62:                                               ; preds = %62, %56
  %63 = phi i64 [ 0, %56 ], [ %68, %62 ]
  %64 = getelementptr i32, ptr %61, i64 %63
  %65 = getelementptr inbounds i8, ptr %64, i64 16
  %66 = getelementptr inbounds i8, ptr %64, i64 32
  %67 = getelementptr inbounds i8, ptr %64, i64 48
  store <4 x i32> %60, ptr %64, align 4, !tbaa !5
  store <4 x i32> %60, ptr %65, align 4, !tbaa !5
  store <4 x i32> %60, ptr %66, align 4, !tbaa !5
  store <4 x i32> %60, ptr %67, align 4, !tbaa !5
  %68 = add nuw i64 %63, 16
  %69 = icmp eq i64 %68, %57
  br i1 %69, label %70, label %62, !llvm.loop !54

70:                                               ; preds = %62
  %71 = icmp eq i64 %52, %57
  br i1 %71, label %82, label %54

72:                                               ; preds = %72, %36
  %73 = phi i64 [ %75, %72 ], [ %37, %36 ]
  %74 = getelementptr inbounds i32, ptr %31, i64 %73
  store i32 %4, ptr %74, align 4, !tbaa !5
  %75 = add nuw nsw i64 %73, 1
  %76 = icmp eq i64 %75, %34
  br i1 %76, label %50, label %72, !llvm.loop !55

77:                                               ; preds = %77, %54
  %78 = phi i64 [ %80, %77 ], [ %55, %54 ]
  %79 = getelementptr inbounds i32, ptr %31, i64 %78
  store i32 %29, ptr %79, align 4, !tbaa !5
  %80 = add nuw nsw i64 %78, 1
  %81 = icmp eq i64 %80, %11
  br i1 %81, label %82, label %77, !llvm.loop !56

82:                                               ; preds = %77, %70
  br i1 %22, label %121, label %83

83:                                               ; preds = %82
  %84 = getelementptr i8, ptr %31, i64 -12
  %85 = getelementptr i8, ptr %31, i64 -4
  %86 = getelementptr i8, ptr %31, i64 -8
  %87 = getelementptr i8, ptr %31, i64 -12
  %88 = getelementptr i8, ptr %31, i64 -16
  br label %89

89:                                               ; preds = %117, %83
  %90 = phi i64 [ 0, %83 ], [ %118, %117 ]
  %91 = sub i64 %9, %90
  %92 = add nsw i64 %91, -1
  %93 = getelementptr i32, ptr %84, i64 %92
  %94 = load <4 x i32>, ptr %93, align 4, !tbaa !5
  %95 = getelementptr i32, ptr %25, i64 %92
  %96 = load <4 x i32>, ptr %95, align 4, !tbaa !5
  %97 = icmp sgt <4 x i32> %94, %96
  %98 = extractelement <4 x i1> %97, i64 3
  br i1 %98, label %99, label %102

99:                                               ; preds = %89
  %100 = getelementptr i32, ptr %85, i64 %91
  %101 = extractelement <4 x i32> %96, i64 3
  store i32 %101, ptr %100, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %99, %89
  %103 = extractelement <4 x i1> %97, i64 2
  br i1 %103, label %104, label %107

104:                                              ; preds = %102
  %105 = getelementptr i32, ptr %86, i64 %91
  %106 = extractelement <4 x i32> %96, i64 2
  store i32 %106, ptr %105, align 4, !tbaa !5
  br label %107

107:                                              ; preds = %104, %102
  %108 = extractelement <4 x i1> %97, i64 1
  br i1 %108, label %109, label %112

109:                                              ; preds = %107
  %110 = getelementptr i32, ptr %87, i64 %91
  %111 = extractelement <4 x i32> %96, i64 1
  store i32 %111, ptr %110, align 4, !tbaa !5
  br label %112

112:                                              ; preds = %109, %107
  %113 = extractelement <4 x i1> %97, i64 0
  br i1 %113, label %114, label %117

114:                                              ; preds = %112
  %115 = getelementptr i32, ptr %88, i64 %91
  %116 = extractelement <4 x i32> %96, i64 0
  store i32 %116, ptr %115, align 4, !tbaa !5
  br label %117

117:                                              ; preds = %114, %112
  %118 = add nuw i64 %90, 4
  %119 = icmp eq i64 %118, %23
  br i1 %119, label %120, label %89, !llvm.loop !57

120:                                              ; preds = %117
  br i1 %26, label %134, label %121

121:                                              ; preds = %120, %82
  %122 = phi i64 [ %9, %82 ], [ %24, %120 ]
  br label %123

123:                                              ; preds = %132, %121
  %124 = phi i64 [ %125, %132 ], [ %122, %121 ]
  %125 = add nsw i64 %124, -1
  %126 = getelementptr inbounds i32, ptr %31, i64 %125
  %127 = load i32, ptr %126, align 4, !tbaa !5
  %128 = getelementptr inbounds i32, ptr %0, i64 %125
  %129 = load i32, ptr %128, align 4, !tbaa !5
  %130 = icmp sgt i32 %127, %129
  br i1 %130, label %131, label %132

131:                                              ; preds = %123
  store i32 %129, ptr %126, align 4, !tbaa !5
  br label %132

132:                                              ; preds = %131, %123
  %133 = icmp eq i64 %125, 0
  br i1 %133, label %134, label %123, !llvm.loop !58

134:                                              ; preds = %132, %120
  br label %135

135:                                              ; preds = %138, %134
  %136 = phi i64 [ %139, %138 ], [ %9, %134 ]
  %137 = icmp eq i64 %136, 0
  br i1 %137, label %155, label %138

138:                                              ; preds = %135
  %139 = add nsw i64 %136, -1
  %140 = getelementptr inbounds i32, ptr %31, i64 %139
  %141 = load i32, ptr %140, align 4, !tbaa !5
  %142 = getelementptr inbounds i32, ptr %0, i64 %139
  %143 = load i32, ptr %142, align 4, !tbaa !5
  %144 = icmp eq i32 %141, %143
  br i1 %144, label %135, label %145, !llvm.loop !20

145:                                              ; preds = %138
  %146 = icmp sgt i64 %136, 0
  br i1 %146, label %147, label %155

147:                                              ; preds = %145
  %148 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %149 = getelementptr inbounds i8, ptr %28, i64 8
  store ptr %148, ptr %149, align 8, !tbaa !22
  %150 = tail call ptr @malloc(i64 noundef %10) #14
  %151 = getelementptr i8, ptr %150, i64 %16
  %152 = getelementptr i8, ptr %31, i64 %16
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %151, ptr readonly align 4 %152, i64 %17, i1 false), !tbaa !5
  store ptr %150, ptr %148, align 8, !tbaa !25
  %153 = getelementptr inbounds i8, ptr %148, i64 8
  store ptr null, ptr %153, align 8, !tbaa !22
  %154 = load ptr, ptr %149, align 8, !tbaa !22
  br label %157

155:                                              ; preds = %145, %135
  %156 = select i1 %32, i32 %18, i32 %29
  br label %157

157:                                              ; preds = %155, %147
  %158 = phi i32 [ %12, %155 ], [ %30, %147 ]
  %159 = phi i32 [ %156, %155 ], [ %29, %147 ]
  %160 = phi ptr [ %28, %155 ], [ %154, %147 ]
  tail call void @free(ptr noundef nonnull %31)
  %161 = add nsw i32 %158, 1
  %162 = icmp eq i32 %161, %7
  br i1 %162, label %166, label %163

163:                                              ; preds = %166, %157
  %164 = phi i32 [ %159, %157 ], [ %167, %166 ]
  %165 = phi i32 [ %161, %157 ], [ 0, %166 ]
  br label %27, !llvm.loop !59

166:                                              ; preds = %157
  %167 = add nsw i32 %159, 1
  %168 = icmp eq i32 %167, %4
  br i1 %168, label %169, label %163

169:                                              ; preds = %166
  %170 = load ptr, ptr %3, align 8, !tbaa !22
  br label %171

171:                                              ; preds = %169, %6, %1
  %172 = phi ptr [ %170, %169 ], [ null, %1 ], [ null, %6 ]
  tail call void @free(ptr noundef nonnull %2)
  store ptr %172, ptr @wanted, align 8, !tbaa !30
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define noalias noundef ptr @get_good_move(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %48, label %3

3:                                                ; preds = %1
  %4 = load i32, ptr @ncol, align 4
  %5 = sext i32 %4 to i64
  br label %6

6:                                                ; preds = %31, %3
  %7 = phi ptr [ %9, %31 ], [ %0, %3 ]
  %8 = getelementptr inbounds i8, ptr %7, i64 8
  %9 = load ptr, ptr %8, align 8, !tbaa !22
  %10 = icmp eq ptr %9, null
  %11 = load ptr, ptr %7, align 8, !tbaa !25
  br i1 %10, label %34, label %12

12:                                               ; preds = %29, %6
  %13 = phi ptr [ %30, %29 ], [ @game_tree, %6 ]
  %14 = load ptr, ptr %13, align 8, !tbaa !30
  %15 = getelementptr inbounds i8, ptr %14, i64 8
  %16 = load ptr, ptr %15, align 8, !tbaa !29
  br label %17

17:                                               ; preds = %20, %12
  %18 = phi i64 [ %21, %20 ], [ %5, %12 ]
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %31, label %20

20:                                               ; preds = %17
  %21 = add nsw i64 %18, -1
  %22 = getelementptr inbounds i32, ptr %16, i64 %21
  %23 = load i32, ptr %22, align 4, !tbaa !5
  %24 = getelementptr inbounds i32, ptr %11, i64 %21
  %25 = load i32, ptr %24, align 4, !tbaa !5
  %26 = icmp eq i32 %23, %25
  br i1 %26, label %17, label %27, !llvm.loop !20

27:                                               ; preds = %20
  %28 = icmp sgt i64 %18, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %27
  %30 = getelementptr inbounds i8, ptr %14, i64 24
  br label %12, !llvm.loop !31

31:                                               ; preds = %27, %17
  %32 = load i32, ptr %14, align 8, !tbaa !32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %6, !llvm.loop !60

34:                                               ; preds = %31, %6
  %35 = shl nsw i64 %5, 2
  %36 = tail call ptr @malloc(i64 noundef %35) #14
  %37 = icmp eq i32 %4, 0
  br i1 %37, label %48, label %38

38:                                               ; preds = %34
  %39 = add i32 %4, -1
  %40 = sext i32 %39 to i64
  %41 = zext i32 %39 to i64
  %42 = sub nsw i64 %40, %41
  %43 = shl nsw i64 %42, 2
  %44 = getelementptr i8, ptr %36, i64 %43
  %45 = getelementptr i8, ptr %11, i64 %43
  %46 = zext i32 %4 to i64
  %47 = shl nuw nsw i64 %46, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %44, ptr readonly align 4 %45, i64 %47, i1 false), !tbaa !5
  br label %48

48:                                               ; preds = %38, %34, %1
  %49 = phi ptr [ null, %1 ], [ %36, %34 ], [ %36, %38 ]
  ret ptr %49
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define noalias noundef ptr @get_winning_move(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi ptr [ %0, %1 ], [ %5, %2 ]
  %4 = getelementptr inbounds i8, ptr %3, i64 24
  %5 = load ptr, ptr %4, align 8, !tbaa !26
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %2, !llvm.loop !61

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, ptr %3, i64 16
  %9 = load ptr, ptr %8, align 8, !tbaa !28
  %10 = icmp eq ptr %9, null
  br i1 %10, label %56, label %11

11:                                               ; preds = %7
  %12 = load i32, ptr @ncol, align 4
  %13 = sext i32 %12 to i64
  br label %14

14:                                               ; preds = %39, %11
  %15 = phi ptr [ %17, %39 ], [ %9, %11 ]
  %16 = getelementptr inbounds i8, ptr %15, i64 8
  %17 = load ptr, ptr %16, align 8, !tbaa !22
  %18 = icmp eq ptr %17, null
  %19 = load ptr, ptr %15, align 8, !tbaa !25
  br i1 %18, label %42, label %20

20:                                               ; preds = %37, %14
  %21 = phi ptr [ %38, %37 ], [ @game_tree, %14 ]
  %22 = load ptr, ptr %21, align 8, !tbaa !30
  %23 = getelementptr inbounds i8, ptr %22, i64 8
  %24 = load ptr, ptr %23, align 8, !tbaa !29
  br label %25

25:                                               ; preds = %28, %20
  %26 = phi i64 [ %29, %28 ], [ %13, %20 ]
  %27 = icmp eq i64 %26, 0
  br i1 %27, label %39, label %28

28:                                               ; preds = %25
  %29 = add nsw i64 %26, -1
  %30 = getelementptr inbounds i32, ptr %24, i64 %29
  %31 = load i32, ptr %30, align 4, !tbaa !5
  %32 = getelementptr inbounds i32, ptr %19, i64 %29
  %33 = load i32, ptr %32, align 4, !tbaa !5
  %34 = icmp eq i32 %31, %33
  br i1 %34, label %25, label %35, !llvm.loop !20

35:                                               ; preds = %28
  %36 = icmp sgt i64 %26, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %35
  %38 = getelementptr inbounds i8, ptr %22, i64 24
  br label %20, !llvm.loop !31

39:                                               ; preds = %35, %25
  %40 = load i32, ptr %22, align 8, !tbaa !32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %14, !llvm.loop !60

42:                                               ; preds = %39, %14
  %43 = shl nsw i64 %13, 2
  %44 = tail call ptr @malloc(i64 noundef %43) #14
  %45 = icmp eq i32 %12, 0
  br i1 %45, label %56, label %46

46:                                               ; preds = %42
  %47 = add i32 %12, -1
  %48 = sext i32 %47 to i64
  %49 = zext i32 %47 to i64
  %50 = sub nsw i64 %48, %49
  %51 = shl nsw i64 %50, 2
  %52 = getelementptr i8, ptr %44, i64 %51
  %53 = getelementptr i8, ptr %19, i64 %51
  %54 = zext i32 %12 to i64
  %55 = shl nuw nsw i64 %54, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %52, ptr readonly align 4 %53, i64 %55, i1 false), !tbaa !5
  br label %56

56:                                               ; preds = %46, %42, %7
  %57 = phi ptr [ null, %7 ], [ %44, %42 ], [ %44, %46 ]
  ret ptr %57
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define ptr @where(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  br label %5

5:                                                ; preds = %21, %2
  %6 = phi ptr [ %1, %2 ], [ %23, %21 ]
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %8 = load ptr, ptr %7, align 8, !tbaa !29
  br label %9

9:                                                ; preds = %12, %5
  %10 = phi i64 [ %13, %12 ], [ %4, %5 ]
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %24, label %12

12:                                               ; preds = %9
  %13 = add nsw i64 %10, -1
  %14 = getelementptr inbounds i32, ptr %8, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = getelementptr inbounds i32, ptr %0, i64 %13
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %9, label %19, !llvm.loop !20

19:                                               ; preds = %12
  %20 = icmp sgt i64 %10, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds i8, ptr %6, i64 24
  %23 = load ptr, ptr %22, align 8, !tbaa !26
  br label %5, !llvm.loop !62

24:                                               ; preds = %19, %9
  %25 = getelementptr inbounds i8, ptr %6, i64 16
  %26 = load ptr, ptr %25, align 8, !tbaa !28
  ret ptr %26
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @get_real_move(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef writeonly %2, ptr nocapture noundef writeonly %3) local_unnamed_addr #10 {
  br label %5

5:                                                ; preds = %5, %4
  %6 = phi i64 [ %13, %5 ], [ 0, %4 ]
  %7 = trunc nuw nsw i64 %6 to i32
  store i32 %7, ptr %3, align 4, !tbaa !5
  %8 = getelementptr inbounds i32, ptr %0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = getelementptr inbounds i32, ptr %1, i64 %6
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = icmp eq i32 %9, %11
  %13 = add nuw nsw i64 %6, 1
  br i1 %12, label %5, label %14, !llvm.loop !63

14:                                               ; preds = %5
  store i32 %9, ptr %2, align 4, !tbaa !5
  ret void
}

; Function Attrs: nounwind ssp uwtable(sync)
define noundef i32 @main() local_unnamed_addr #5 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.20)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.21)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.22)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13)
  store i32 7, ptr @ncol, align 4, !tbaa !5
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14)
  store i32 8, ptr @nrow, align 4, !tbaa !5
  %7 = tail call ptr @make_play(i32 noundef 1)
  %8 = load i32, ptr @nrow, align 4, !tbaa !5
  %9 = load i32, ptr @ncol, align 4
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  %12 = tail call ptr @malloc(i64 noundef %11) #14
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %38, label %14

14:                                               ; preds = %0
  %15 = zext i32 %9 to i64
  %16 = icmp ult i32 %9, 16
  br i1 %16, label %31, label %17

17:                                               ; preds = %14
  %18 = and i64 %15, 4294967280
  %19 = insertelement <4 x i32> poison, i32 %8, i64 0
  %20 = shufflevector <4 x i32> %19, <4 x i32> poison, <4 x i32> zeroinitializer
  br label %21

21:                                               ; preds = %21, %17
  %22 = phi i64 [ 0, %17 ], [ %27, %21 ]
  %23 = getelementptr inbounds i32, ptr %12, i64 %22
  %24 = getelementptr inbounds i8, ptr %23, i64 16
  %25 = getelementptr inbounds i8, ptr %23, i64 32
  %26 = getelementptr inbounds i8, ptr %23, i64 48
  store <4 x i32> %20, ptr %23, align 4, !tbaa !5
  store <4 x i32> %20, ptr %24, align 4, !tbaa !5
  store <4 x i32> %20, ptr %25, align 4, !tbaa !5
  store <4 x i32> %20, ptr %26, align 4, !tbaa !5
  %27 = add nuw i64 %22, 16
  %28 = icmp eq i64 %27, %18
  br i1 %28, label %29, label %21, !llvm.loop !64

29:                                               ; preds = %21
  %30 = icmp eq i64 %18, %15
  br i1 %30, label %40, label %31

31:                                               ; preds = %29, %14
  %32 = phi i64 [ 0, %14 ], [ %18, %29 ]
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i64 [ %36, %33 ], [ %32, %31 ]
  %35 = getelementptr inbounds i32, ptr %12, i64 %34
  store i32 %8, ptr %35, align 4, !tbaa !5
  %36 = add nuw nsw i64 %34, 1
  %37 = icmp eq i64 %36, %15
  br i1 %37, label %40, label %33, !llvm.loop !65

38:                                               ; preds = %0
  %39 = icmp eq ptr %12, null
  br i1 %39, label %128, label %40

40:                                               ; preds = %38, %33, %29
  br label %41

41:                                               ; preds = %121, %40
  %42 = phi i32 [ %125, %121 ], [ %9, %40 ]
  %43 = phi i32 [ %124, %121 ], [ 0, %40 ]
  %44 = phi ptr [ %99, %121 ], [ %12, %40 ]
  %45 = sext i32 %42 to i64
  br label %46

46:                                               ; preds = %62, %41
  %47 = phi ptr [ %7, %41 ], [ %64, %62 ]
  %48 = getelementptr inbounds i8, ptr %47, i64 8
  %49 = load ptr, ptr %48, align 8, !tbaa !29
  br label %50

50:                                               ; preds = %53, %46
  %51 = phi i64 [ %54, %53 ], [ %45, %46 ]
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %65, label %53

53:                                               ; preds = %50
  %54 = add nsw i64 %51, -1
  %55 = getelementptr inbounds i32, ptr %49, i64 %54
  %56 = load i32, ptr %55, align 4, !tbaa !5
  %57 = getelementptr inbounds i32, ptr %44, i64 %54
  %58 = load i32, ptr %57, align 4, !tbaa !5
  %59 = icmp eq i32 %56, %58
  br i1 %59, label %50, label %60, !llvm.loop !20

60:                                               ; preds = %53
  %61 = icmp sgt i64 %51, 0
  br i1 %61, label %62, label %65

62:                                               ; preds = %60
  %63 = getelementptr inbounds i8, ptr %47, i64 24
  %64 = load ptr, ptr %63, align 8, !tbaa !26
  br label %46, !llvm.loop !62

65:                                               ; preds = %60, %50
  %66 = getelementptr inbounds i8, ptr %47, i64 16
  %67 = load ptr, ptr %66, align 8, !tbaa !28
  %68 = icmp eq ptr %67, null
  br i1 %68, label %126, label %69

69:                                               ; preds = %94, %65
  %70 = phi ptr [ %72, %94 ], [ %67, %65 ]
  %71 = getelementptr inbounds i8, ptr %70, i64 8
  %72 = load ptr, ptr %71, align 8, !tbaa !22
  %73 = icmp eq ptr %72, null
  %74 = load ptr, ptr %70, align 8, !tbaa !25
  br i1 %73, label %97, label %75

75:                                               ; preds = %92, %69
  %76 = phi ptr [ %93, %92 ], [ @game_tree, %69 ]
  %77 = load ptr, ptr %76, align 8, !tbaa !30
  %78 = getelementptr inbounds i8, ptr %77, i64 8
  %79 = load ptr, ptr %78, align 8, !tbaa !29
  br label %80

80:                                               ; preds = %83, %75
  %81 = phi i64 [ %84, %83 ], [ %45, %75 ]
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %94, label %83

83:                                               ; preds = %80
  %84 = add nsw i64 %81, -1
  %85 = getelementptr inbounds i32, ptr %79, i64 %84
  %86 = load i32, ptr %85, align 4, !tbaa !5
  %87 = getelementptr inbounds i32, ptr %74, i64 %84
  %88 = load i32, ptr %87, align 4, !tbaa !5
  %89 = icmp eq i32 %86, %88
  br i1 %89, label %80, label %90, !llvm.loop !20

90:                                               ; preds = %83
  %91 = icmp sgt i64 %81, 0
  br i1 %91, label %92, label %94

92:                                               ; preds = %90
  %93 = getelementptr inbounds i8, ptr %77, i64 24
  br label %75, !llvm.loop !31

94:                                               ; preds = %90, %80
  %95 = load i32, ptr %77, align 8, !tbaa !32
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %69, !llvm.loop !60

97:                                               ; preds = %94, %69
  %98 = shl nsw i64 %45, 2
  %99 = tail call ptr @malloc(i64 noundef %98) #14
  %100 = icmp eq i32 %42, 0
  br i1 %100, label %111, label %101

101:                                              ; preds = %97
  %102 = add i32 %42, -1
  %103 = sext i32 %102 to i64
  %104 = zext i32 %102 to i64
  %105 = sub nsw i64 %103, %104
  %106 = shl nsw i64 %105, 2
  %107 = getelementptr i8, ptr %99, i64 %106
  %108 = getelementptr i8, ptr %74, i64 %106
  %109 = zext i32 %42 to i64
  %110 = shl nuw nsw i64 %109, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %107, ptr readonly align 4 %108, i64 %110, i1 false), !tbaa !5
  br label %111

111:                                              ; preds = %101, %97
  %112 = icmp eq ptr %99, null
  br i1 %112, label %126, label %113

113:                                              ; preds = %113, %111
  %114 = phi i64 [ %120, %113 ], [ 0, %111 ]
  %115 = getelementptr inbounds i32, ptr %99, i64 %114
  %116 = load i32, ptr %115, align 4, !tbaa !5
  %117 = getelementptr inbounds i32, ptr %44, i64 %114
  %118 = load i32, ptr %117, align 4, !tbaa !5
  %119 = icmp eq i32 %116, %118
  %120 = add nuw nsw i64 %114, 1
  br i1 %119, label %113, label %121, !llvm.loop !63

121:                                              ; preds = %113
  %122 = trunc nuw nsw i64 %114 to i32
  %123 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, i32 noundef %43, i32 noundef %116, i32 noundef %122)
  %124 = xor i32 %43, 1
  tail call void @free(ptr noundef nonnull %44)
  %125 = load i32, ptr @ncol, align 4
  br label %41, !llvm.loop !66

126:                                              ; preds = %111, %65
  %127 = sub nuw nsw i32 1, %43
  br label %128

128:                                              ; preds = %126, %38
  %129 = phi i32 [ 1, %38 ], [ %127, %126 ]
  tail call void @dump_play(ptr noundef %7)
  %130 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, i32 noundef %129)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #12

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #13

attributes #0 = { mustprogress nofree nounwind ssp willreturn uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nofree norecurse nosync nounwind ssp memory(read, argmem: readwrite, inaccessiblemem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #8 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #9 = { nofree nounwind ssp memory(readwrite, argmem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #10 = { nofree norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #11 = { nofree nounwind }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #14 = { allocsize(0) }
attributes #15 = { nounwind }

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !10, !17, !18}
!17 = !{!"llvm.loop.isvectorized", i32 1}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = distinct !{!19, !10, !17}
!20 = distinct !{!20, !10}
!21 = distinct !{!21, !10}
!22 = !{!23, !24, i64 8}
!23 = !{!"_list", !24, i64 0, !24, i64 8}
!24 = !{!"any pointer", !7, i64 0}
!25 = !{!23, !24, i64 0}
!26 = !{!27, !24, i64 24}
!27 = !{!"_play", !6, i64 0, !24, i64 8, !24, i64 16, !24, i64 24}
!28 = !{!27, !24, i64 16}
!29 = !{!27, !24, i64 8}
!30 = !{!24, !24, i64 0}
!31 = distinct !{!31, !10}
!32 = !{!27, !6, i64 0}
!33 = distinct !{!33, !10}
!34 = distinct !{!34, !10}
!35 = distinct !{!35, !10}
!36 = distinct !{!36, !10}
!37 = distinct !{!37, !10, !17, !18}
!38 = distinct !{!38, !10, !17, !18}
!39 = distinct !{!39, !10, !18, !17}
!40 = distinct !{!40, !10, !18, !17}
!41 = distinct !{!41, !10, !17, !18}
!42 = distinct !{!42, !10, !17, !18}
!43 = distinct !{!43, !10, !18, !17}
!44 = distinct !{!44, !10, !18, !17}
!45 = distinct !{!45, !10, !17, !18}
!46 = distinct !{!46, !10, !18, !17}
!47 = distinct !{!47, !10}
!48 = distinct !{!48, !10, !49}
!49 = !{!"llvm.loop.unswitch.partial.disable"}
!50 = distinct !{!50, !10, !17, !18}
!51 = distinct !{!51, !10, !18, !17}
!52 = distinct !{!52, !10}
!53 = distinct !{!53, !10, !17, !18}
!54 = distinct !{!54, !10, !17, !18}
!55 = distinct !{!55, !10, !18, !17}
!56 = distinct !{!56, !10, !18, !17}
!57 = distinct !{!57, !10, !17, !18}
!58 = distinct !{!58, !10, !18, !17}
!59 = distinct !{!59, !10}
!60 = distinct !{!60, !10}
!61 = distinct !{!61, !10}
!62 = distinct !{!62, !10}
!63 = distinct !{!63, !10}
!64 = distinct !{!64, !10, !17, !18}
!65 = distinct !{!65, !10, !18, !17}
!66 = distinct !{!66, !10}
