; ModuleID = '../chomp.c'
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, argmem: readwrite, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @next_data(ptr nocapture noundef %0) local_unnamed_addr #3 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %23, label %4

4:                                                ; preds = %1, %16
  %5 = phi i32 [ %18, %16 ], [ 0, %1 ]
  %6 = phi i32 [ %17, %16 ], [ 0, %1 ]
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, ptr %0, i64 %7
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = load i32, ptr @nrow, align 4, !tbaa !5
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %4
  store i32 0, ptr %8, align 4, !tbaa !5
  %13 = add nsw i32 %6, 1
  br label %16

14:                                               ; preds = %4
  %15 = add nsw i32 %9, 1
  store i32 %15, ptr %8, align 4, !tbaa !5
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i32 [ %13, %12 ], [ %6, %14 ]
  %18 = phi i32 [ %5, %12 ], [ 1, %14 ]
  %19 = load i32, ptr @ncol, align 4, !tbaa !5
  %20 = icmp ne i32 %17, %19
  %21 = icmp eq i32 %18, 0
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %4, label %23, !llvm.loop !9

23:                                               ; preds = %16, %1
  %24 = phi i32 [ 0, %1 ], [ %18, %16 ]
  ret i32 %24
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, argmem: readwrite, inaccessiblemem: none) uwtable(sync)
define void @melt_data(ptr nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #3 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %18, label %5

5:                                                ; preds = %2
  %6 = sext i32 %3 to i64
  br label %7

7:                                                ; preds = %5, %16
  %8 = phi i64 [ %6, %5 ], [ %9, %16 ]
  %9 = add nsw i64 %8, -1
  %10 = getelementptr inbounds i32, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, ptr %1, i64 %9
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %7
  store i32 %13, ptr %10, align 4, !tbaa !5
  br label %16

16:                                               ; preds = %15, %7
  %17 = icmp eq i64 %9, 0
  br i1 %17, label %18, label %7, !llvm.loop !12

18:                                               ; preds = %16, %2
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
  br i1 %7, label %17, label %8

8:                                                ; preds = %5
  %9 = add nsw i64 %6, -1
  %10 = getelementptr inbounds i32, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, ptr %1, i64 %9
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = icmp eq i32 %11, %13
  br i1 %14, label %5, label %15, !llvm.loop !13

15:                                               ; preds = %8
  %16 = trunc nsw i64 %6 to i32
  br label %17

17:                                               ; preds = %5, %15
  %18 = phi i32 [ %16, %15 ], [ 0, %5 ]
  %19 = icmp slt i32 %18, 1
  %20 = zext i1 %19 to i32
  ret i32 %20
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @valid_data(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %18, label %4

4:                                                ; preds = %1
  %5 = load i32, ptr @nrow, align 4, !tbaa !5
  %6 = zext i32 %2 to i64
  %7 = load i32, ptr %0, align 4, !tbaa !5
  %8 = icmp sgt i32 %7, %5
  br i1 %8, label %18, label %9

9:                                                ; preds = %4, %14
  %10 = phi i32 [ %16, %14 ], [ %7, %4 ]
  %11 = phi i64 [ %12, %14 ], [ 0, %4 ]
  %12 = add nuw nsw i64 %11, 1
  %13 = icmp eq i64 %12, %6
  br i1 %13, label %18, label %14, !llvm.loop !14

14:                                               ; preds = %9
  %15 = getelementptr inbounds i32, ptr %0, i64 %12
  %16 = load i32, ptr %15, align 4, !tbaa !5
  %17 = icmp sgt i32 %16, %10
  br i1 %17, label %18, label %9, !llvm.loop !14

18:                                               ; preds = %14, %9, %4, %1
  %19 = phi i1 [ %3, %1 ], [ %3, %4 ], [ %13, %9 ], [ %13, %14 ]
  %20 = zext i1 %19 to i32
  ret i32 %20
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @dump_list(ptr noundef %0) local_unnamed_addr #5 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1, %4
  ret void

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, ptr %0, i64 8
  %6 = load ptr, ptr %5, align 8, !tbaa !15
  tail call void @dump_list(ptr noundef %6)
  %7 = load ptr, ptr %0, align 8, !tbaa !18
  tail call void @free(ptr noundef %7)
  tail call void @free(ptr noundef %0)
  br label %3
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: nounwind ssp uwtable(sync)
define void @dump_play(ptr noundef %0) local_unnamed_addr #5 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1, %4
  ret void

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, ptr %0, i64 24
  %6 = load ptr, ptr %5, align 8, !tbaa !19
  tail call void @dump_play(ptr noundef %6)
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  %8 = load ptr, ptr %7, align 8, !tbaa !21
  tail call void @dump_list(ptr noundef %8)
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load ptr, ptr %9, align 8, !tbaa !22
  tail call void @free(ptr noundef %10)
  tail call void @free(ptr noundef %0)
  br label %3
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define i32 @get_value(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = sext i32 %2 to i64
  br label %4

4:                                                ; preds = %21, %1
  %5 = phi ptr [ @game_tree, %1 ], [ %24, %21 ]
  %6 = load ptr, ptr %5, align 8, !tbaa !23
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %8 = load ptr, ptr %7, align 8, !tbaa !22
  br label %9

9:                                                ; preds = %12, %4
  %10 = phi i64 [ %13, %12 ], [ %3, %4 ]
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %21, label %12

12:                                               ; preds = %9
  %13 = add nsw i64 %10, -1
  %14 = getelementptr inbounds i32, ptr %8, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = getelementptr inbounds i32, ptr %0, i64 %13
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %9, label %19, !llvm.loop !13

19:                                               ; preds = %12
  %20 = trunc nsw i64 %10 to i32
  br label %21

21:                                               ; preds = %9, %19
  %22 = phi i32 [ %20, %19 ], [ 0, %9 ]
  %23 = icmp sgt i32 %22, 0
  %24 = getelementptr inbounds i8, ptr %6, i64 24
  br i1 %23, label %4, label %25, !llvm.loop !24

25:                                               ; preds = %21
  %26 = load i32, ptr %6, align 8, !tbaa !25
  ret i32 %26
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_data(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  %2 = load i32, ptr @ncol, align 4, !tbaa !5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %19, label %4

4:                                                ; preds = %1, %15
  %5 = phi i64 [ %6, %15 ], [ 0, %1 ]
  %6 = add nuw nsw i64 %5, 1
  %7 = getelementptr inbounds i32, ptr %0, i64 %5
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %8)
  %10 = load i32, ptr @ncol, align 4, !tbaa !5
  %11 = zext i32 %10 to i64
  %12 = icmp eq i64 %6, %11
  br i1 %12, label %15, label %13

13:                                               ; preds = %4
  %14 = tail call i32 @putchar(i32 noundef 44)
  br label %15

15:                                               ; preds = %13, %4
  %16 = load i32, ptr @ncol, align 4, !tbaa !5
  %17 = zext i32 %16 to i64
  %18 = icmp eq i64 %6, %17
  br i1 %18, label %19, label %4, !llvm.loop !26

19:                                               ; preds = %15, %1
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
  br i1 %4, label %20, label %5

5:                                                ; preds = %1, %16
  %6 = phi i64 [ %7, %16 ], [ 0, %1 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = getelementptr inbounds i32, ptr %0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9)
  %11 = load i32, ptr @ncol, align 4, !tbaa !5
  %12 = zext i32 %11 to i64
  %13 = icmp eq i64 %7, %12
  br i1 %13, label %16, label %14

14:                                               ; preds = %5
  %15 = tail call i32 @putchar(i32 noundef 44)
  br label %16

16:                                               ; preds = %14, %5
  %17 = load i32, ptr @ncol, align 4, !tbaa !5
  %18 = zext i32 %17 to i64
  %19 = icmp eq i64 %7, %18
  br i1 %19, label %20, label %5, !llvm.loop !26

20:                                               ; preds = %16, %1
  %21 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_list(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %29, label %3

3:                                                ; preds = %1, %24
  %4 = phi ptr [ %27, %24 ], [ %0, %1 ]
  %5 = load ptr, ptr %4, align 8, !tbaa !18
  %6 = tail call i32 @putchar(i32 noundef 40)
  %7 = load i32, ptr @ncol, align 4, !tbaa !5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %24, label %9

9:                                                ; preds = %3, %20
  %10 = phi i64 [ %11, %20 ], [ 0, %3 ]
  %11 = add nuw nsw i64 %10, 1
  %12 = getelementptr inbounds i32, ptr %5, i64 %10
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13)
  %15 = load i32, ptr @ncol, align 4, !tbaa !5
  %16 = zext i32 %15 to i64
  %17 = icmp eq i64 %11, %16
  br i1 %17, label %20, label %18

18:                                               ; preds = %9
  %19 = tail call i32 @putchar(i32 noundef 44)
  br label %20

20:                                               ; preds = %18, %9
  %21 = load i32, ptr @ncol, align 4, !tbaa !5
  %22 = zext i32 %21 to i64
  %23 = icmp eq i64 %11, %22
  br i1 %23, label %24, label %9, !llvm.loop !26

24:                                               ; preds = %20, %3
  %25 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %26 = getelementptr inbounds i8, ptr %4, i64 8
  %27 = load ptr, ptr %26, align 8, !tbaa !15
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %3, !llvm.loop !27

29:                                               ; preds = %24, %1
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @show_play(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %62, label %3

3:                                                ; preds = %1, %58
  %4 = phi ptr [ %60, %58 ], [ %0, %1 ]
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.18)
  %6 = getelementptr inbounds i8, ptr %4, i64 8
  %7 = load ptr, ptr %6, align 8, !tbaa !22
  %8 = load i32, ptr @ncol, align 4, !tbaa !5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %25, label %10

10:                                               ; preds = %3, %21
  %11 = phi i64 [ %12, %21 ], [ 0, %3 ]
  %12 = add nuw nsw i64 %11, 1
  %13 = getelementptr inbounds i32, ptr %7, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %14)
  %16 = load i32, ptr @ncol, align 4, !tbaa !5
  %17 = zext i32 %16 to i64
  %18 = icmp eq i64 %12, %17
  br i1 %18, label %21, label %19

19:                                               ; preds = %10
  %20 = tail call i32 @putchar(i32 noundef 44)
  br label %21

21:                                               ; preds = %19, %10
  %22 = load i32, ptr @ncol, align 4, !tbaa !5
  %23 = zext i32 %22 to i64
  %24 = icmp eq i64 %12, %23
  br i1 %24, label %25, label %10, !llvm.loop !26

25:                                               ; preds = %21, %3
  %26 = load i32, ptr %4, align 8, !tbaa !25
  %27 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %26)
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.19)
  %29 = getelementptr inbounds i8, ptr %4, i64 16
  %30 = load ptr, ptr %29, align 8, !tbaa !21
  %31 = icmp eq ptr %30, null
  br i1 %31, label %58, label %32

32:                                               ; preds = %25, %53
  %33 = phi ptr [ %56, %53 ], [ %30, %25 ]
  %34 = load ptr, ptr %33, align 8, !tbaa !18
  %35 = tail call i32 @putchar(i32 noundef 40)
  %36 = load i32, ptr @ncol, align 4, !tbaa !5
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %53, label %38

38:                                               ; preds = %32, %49
  %39 = phi i64 [ %40, %49 ], [ 0, %32 ]
  %40 = add nuw nsw i64 %39, 1
  %41 = getelementptr inbounds i32, ptr %34, i64 %39
  %42 = load i32, ptr %41, align 4, !tbaa !5
  %43 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %42)
  %44 = load i32, ptr @ncol, align 4, !tbaa !5
  %45 = zext i32 %44 to i64
  %46 = icmp eq i64 %40, %45
  br i1 %46, label %49, label %47

47:                                               ; preds = %38
  %48 = tail call i32 @putchar(i32 noundef 44)
  br label %49

49:                                               ; preds = %47, %38
  %50 = load i32, ptr @ncol, align 4, !tbaa !5
  %51 = zext i32 %50 to i64
  %52 = icmp eq i64 %40, %51
  br i1 %52, label %53, label %38, !llvm.loop !26

53:                                               ; preds = %49, %32
  %54 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %55 = getelementptr inbounds i8, ptr %33, i64 8
  %56 = load ptr, ptr %55, align 8, !tbaa !15
  %57 = icmp eq ptr %56, null
  br i1 %57, label %58, label %32, !llvm.loop !27

58:                                               ; preds = %53, %25
  %59 = getelementptr inbounds i8, ptr %4, i64 24
  %60 = load ptr, ptr %59, align 8, !tbaa !19
  %61 = icmp eq ptr %60, null
  br i1 %61, label %62, label %3, !llvm.loop !28

62:                                               ; preds = %58, %1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define range(i32 0, 2) i32 @in_wanted(ptr nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = load ptr, ptr @wanted, align 8, !tbaa !23
  %3 = icmp eq ptr %2, null
  br i1 %3, label %29, label %4

4:                                                ; preds = %1
  %5 = load i32, ptr @ncol, align 4, !tbaa !5
  %6 = sext i32 %5 to i64
  br label %11

7:                                                ; preds = %26
  %8 = getelementptr inbounds i8, ptr %12, i64 8
  %9 = load ptr, ptr %8, align 8, !tbaa !23
  %10 = icmp eq ptr %9, null
  br i1 %10, label %29, label %11, !llvm.loop !29

11:                                               ; preds = %4, %7
  %12 = phi ptr [ %2, %4 ], [ %9, %7 ]
  %13 = load ptr, ptr %12, align 8, !tbaa !18
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
  br i1 %23, label %14, label %24, !llvm.loop !13

24:                                               ; preds = %17
  %25 = trunc nsw i64 %15 to i32
  br label %26

26:                                               ; preds = %14, %24
  %27 = phi i32 [ %25, %24 ], [ 0, %14 ]
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %7, label %29

29:                                               ; preds = %7, %26, %1
  %30 = phi i32 [ 0, %1 ], [ 0, %7 ], [ 1, %26 ]
  ret i32 %30
}

; Function Attrs: nofree nounwind ssp memory(readwrite, argmem: none) uwtable(sync)
define noalias noundef ptr @make_data(i32 noundef %0, i32 noundef %1) local_unnamed_addr #9 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  %5 = shl nsw i64 %4, 2
  %6 = tail call ptr @malloc(i64 noundef %5) #14
  %7 = icmp eq i32 %1, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr @nrow, align 4, !tbaa !5
  %10 = zext i32 %1 to i64
  br label %19

11:                                               ; preds = %19
  %12 = trunc nuw nsw i64 %22 to i32
  br label %13

13:                                               ; preds = %11, %2
  %14 = phi i32 [ 0, %2 ], [ %12, %11 ]
  %15 = icmp eq i32 %14, %3
  br i1 %15, label %29, label %16

16:                                               ; preds = %13
  %17 = zext nneg i32 %14 to i64
  %18 = zext i32 %3 to i64
  br label %24

19:                                               ; preds = %8, %19
  %20 = phi i64 [ 0, %8 ], [ %22, %19 ]
  %21 = getelementptr inbounds i32, ptr %6, i64 %20
  store i32 %9, ptr %21, align 4, !tbaa !5
  %22 = add nuw nsw i64 %20, 1
  %23 = icmp eq i64 %22, %10
  br i1 %23, label %11, label %19, !llvm.loop !30

24:                                               ; preds = %16, %24
  %25 = phi i64 [ %17, %16 ], [ %27, %24 ]
  %26 = getelementptr inbounds i32, ptr %6, i64 %25
  store i32 %0, ptr %26, align 4, !tbaa !5
  %27 = add nuw nsw i64 %25, 1
  %28 = icmp eq i64 %27, %18
  br i1 %28, label %29, label %24, !llvm.loop !31

29:                                               ; preds = %24, %13
  ret ptr %6
}

; Function Attrs: nounwind ssp uwtable(sync)
define ptr @make_list(ptr nocapture noundef readonly %0, ptr nocapture noundef %1, ptr nocapture noundef %2) local_unnamed_addr #5 {
  store i32 1, ptr %1, align 4, !tbaa !5
  %4 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  store ptr null, ptr %5, align 8, !tbaa !15
  %6 = load i32, ptr @nrow, align 4, !tbaa !5
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %171, label %8

8:                                                ; preds = %3, %165
  %9 = phi ptr [ %167, %165 ], [ %4, %3 ]
  %10 = phi i32 [ %168, %165 ], [ 0, %3 ]
  %11 = load i32, ptr @ncol, align 4, !tbaa !5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %165, label %13

13:                                               ; preds = %8
  %14 = load ptr, ptr @wanted, align 8
  %15 = icmp eq ptr %14, null
  br label %16

16:                                               ; preds = %13, %158
  %17 = phi i32 [ %11, %13 ], [ %163, %158 ]
  %18 = phi ptr [ %9, %13 ], [ %161, %158 ]
  %19 = phi i32 [ %10, %13 ], [ %160, %158 ]
  %20 = phi i32 [ 0, %13 ], [ %162, %158 ]
  %21 = sext i32 %17 to i64
  %22 = shl nsw i64 %21, 2
  %23 = tail call ptr @malloc(i64 noundef %22) #14
  %24 = icmp eq i32 %20, 0
  br i1 %24, label %30, label %25

25:                                               ; preds = %16
  %26 = load i32, ptr @nrow, align 4, !tbaa !5
  %27 = zext i32 %20 to i64
  br label %36

28:                                               ; preds = %36
  %29 = trunc nuw nsw i64 %39 to i32
  br label %30

30:                                               ; preds = %28, %16
  %31 = phi i32 [ 0, %16 ], [ %29, %28 ]
  %32 = icmp eq i32 %31, %17
  br i1 %32, label %46, label %33

33:                                               ; preds = %30
  %34 = zext nneg i32 %31 to i64
  %35 = zext i32 %17 to i64
  br label %41

36:                                               ; preds = %36, %25
  %37 = phi i64 [ 0, %25 ], [ %39, %36 ]
  %38 = getelementptr inbounds i32, ptr %23, i64 %37
  store i32 %26, ptr %38, align 4, !tbaa !5
  %39 = add nuw nsw i64 %37, 1
  %40 = icmp eq i64 %39, %27
  br i1 %40, label %28, label %36, !llvm.loop !30

41:                                               ; preds = %41, %33
  %42 = phi i64 [ %34, %33 ], [ %44, %41 ]
  %43 = getelementptr inbounds i32, ptr %23, i64 %42
  store i32 %19, ptr %43, align 4, !tbaa !5
  %44 = add nuw nsw i64 %42, 1
  %45 = icmp eq i64 %44, %35
  br i1 %45, label %46, label %41, !llvm.loop !31

46:                                               ; preds = %41, %30
  %47 = icmp eq i32 %17, 0
  br i1 %47, label %59, label %48

48:                                               ; preds = %46, %57
  %49 = phi i64 [ %50, %57 ], [ %21, %46 ]
  %50 = add nsw i64 %49, -1
  %51 = getelementptr inbounds i32, ptr %23, i64 %50
  %52 = load i32, ptr %51, align 4, !tbaa !5
  %53 = getelementptr inbounds i32, ptr %0, i64 %50
  %54 = load i32, ptr %53, align 4, !tbaa !5
  %55 = icmp sgt i32 %52, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %48
  store i32 %54, ptr %51, align 4, !tbaa !5
  br label %57

57:                                               ; preds = %56, %48
  %58 = icmp eq i64 %50, 0
  br i1 %58, label %59, label %48, !llvm.loop !12

59:                                               ; preds = %57, %46
  br label %60

60:                                               ; preds = %59, %63
  %61 = phi i64 [ %64, %63 ], [ %21, %59 ]
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %72, label %63

63:                                               ; preds = %60
  %64 = add nsw i64 %61, -1
  %65 = getelementptr inbounds i32, ptr %23, i64 %64
  %66 = load i32, ptr %65, align 4, !tbaa !5
  %67 = getelementptr inbounds i32, ptr %0, i64 %64
  %68 = load i32, ptr %67, align 4, !tbaa !5
  %69 = icmp eq i32 %66, %68
  br i1 %69, label %60, label %70, !llvm.loop !13

70:                                               ; preds = %63
  %71 = trunc nsw i64 %61 to i32
  br label %72

72:                                               ; preds = %60, %70
  %73 = phi i32 [ %71, %70 ], [ 0, %60 ]
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %75, label %153

75:                                               ; preds = %72
  %76 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %77 = getelementptr inbounds i8, ptr %18, i64 8
  store ptr %76, ptr %77, align 8, !tbaa !15
  %78 = tail call ptr @malloc(i64 noundef %22) #14
  br i1 %47, label %89, label %79

79:                                               ; preds = %75
  %80 = add i32 %17, -1
  %81 = sext i32 %80 to i64
  %82 = zext i32 %80 to i64
  %83 = sub nsw i64 %81, %82
  %84 = shl nsw i64 %83, 2
  %85 = getelementptr i8, ptr %78, i64 %84
  %86 = getelementptr i8, ptr %23, i64 %84
  %87 = zext i32 %17 to i64
  %88 = shl nuw nsw i64 %87, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %85, ptr readonly align 4 %86, i64 %88, i1 false), !tbaa !5
  br label %89

89:                                               ; preds = %75, %79
  store ptr %78, ptr %76, align 8, !tbaa !18
  %90 = getelementptr inbounds i8, ptr %76, i64 8
  store ptr null, ptr %90, align 8, !tbaa !15
  %91 = load ptr, ptr %77, align 8, !tbaa !15
  %92 = load i32, ptr %1, align 4, !tbaa !5
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %117

94:                                               ; preds = %89, %111
  %95 = phi ptr [ %114, %111 ], [ @game_tree, %89 ]
  %96 = load ptr, ptr %95, align 8, !tbaa !23
  %97 = getelementptr inbounds i8, ptr %96, i64 8
  %98 = load ptr, ptr %97, align 8, !tbaa !22
  br label %99

99:                                               ; preds = %102, %94
  %100 = phi i64 [ %103, %102 ], [ %21, %94 ]
  %101 = icmp eq i64 %100, 0
  br i1 %101, label %111, label %102

102:                                              ; preds = %99
  %103 = add nsw i64 %100, -1
  %104 = getelementptr inbounds i32, ptr %98, i64 %103
  %105 = load i32, ptr %104, align 4, !tbaa !5
  %106 = getelementptr inbounds i32, ptr %23, i64 %103
  %107 = load i32, ptr %106, align 4, !tbaa !5
  %108 = icmp eq i32 %105, %107
  br i1 %108, label %99, label %109, !llvm.loop !13

109:                                              ; preds = %102
  %110 = trunc nsw i64 %100 to i32
  br label %111

111:                                              ; preds = %99, %109
  %112 = phi i32 [ %110, %109 ], [ 0, %99 ]
  %113 = icmp sgt i32 %112, 0
  %114 = getelementptr inbounds i8, ptr %96, i64 24
  br i1 %113, label %94, label %115, !llvm.loop !24

115:                                              ; preds = %111
  %116 = load i32, ptr %96, align 8, !tbaa !25
  store i32 %116, ptr %1, align 4, !tbaa !5
  br label %117

117:                                              ; preds = %115, %89
  %118 = load i32, ptr %2, align 4, !tbaa !5
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %158

120:                                              ; preds = %117
  %121 = load i32, ptr %1, align 4, !tbaa !5
  %122 = icmp eq i32 %121, 0
  br i1 %122, label %123, label %158

123:                                              ; preds = %120
  %124 = load i32, ptr @ncol, align 4, !tbaa !5
  %125 = add nsw i32 %124, -1
  %126 = load i32, ptr @nrow, align 4, !tbaa !5
  %127 = add nsw i32 %126, -1
  br i1 %15, label %158, label %128

128:                                              ; preds = %123
  %129 = sext i32 %124 to i64
  br label %134

130:                                              ; preds = %149
  %131 = getelementptr inbounds i8, ptr %135, i64 8
  %132 = load ptr, ptr %131, align 8, !tbaa !23
  %133 = icmp eq ptr %132, null
  br i1 %133, label %158, label %134, !llvm.loop !29

134:                                              ; preds = %130, %128
  %135 = phi ptr [ %14, %128 ], [ %132, %130 ]
  %136 = load ptr, ptr %135, align 8, !tbaa !18
  br label %137

137:                                              ; preds = %140, %134
  %138 = phi i64 [ %141, %140 ], [ %129, %134 ]
  %139 = icmp eq i64 %138, 0
  br i1 %139, label %149, label %140

140:                                              ; preds = %137
  %141 = add nsw i64 %138, -1
  %142 = getelementptr inbounds i32, ptr %136, i64 %141
  %143 = load i32, ptr %142, align 4, !tbaa !5
  %144 = getelementptr inbounds i32, ptr %23, i64 %141
  %145 = load i32, ptr %144, align 4, !tbaa !5
  %146 = icmp eq i32 %143, %145
  br i1 %146, label %137, label %147, !llvm.loop !13

147:                                              ; preds = %140
  %148 = trunc nsw i64 %138 to i32
  br label %149

149:                                              ; preds = %137, %147
  %150 = phi i32 [ %148, %147 ], [ 0, %137 ]
  %151 = icmp sgt i32 %150, 0
  br i1 %151, label %130, label %152

152:                                              ; preds = %149
  store i32 2, ptr %2, align 4, !tbaa !5
  br label %158

153:                                              ; preds = %72
  %154 = load i32, ptr @nrow, align 4
  %155 = add nsw i32 %154, -1
  %156 = select i1 %24, i32 %155, i32 %19
  %157 = add nsw i32 %17, -1
  br label %158

158:                                              ; preds = %130, %123, %117, %120, %152, %153
  %159 = phi i32 [ %157, %153 ], [ %20, %117 ], [ %125, %152 ], [ %20, %120 ], [ %125, %123 ], [ %125, %130 ]
  %160 = phi i32 [ %156, %153 ], [ %19, %117 ], [ %127, %152 ], [ %19, %120 ], [ %127, %123 ], [ %127, %130 ]
  %161 = phi ptr [ %18, %153 ], [ %91, %117 ], [ %91, %152 ], [ %91, %120 ], [ %91, %123 ], [ %91, %130 ]
  tail call void @free(ptr noundef %23)
  %162 = add nsw i32 %159, 1
  %163 = load i32, ptr @ncol, align 4, !tbaa !5
  %164 = icmp eq i32 %162, %163
  br i1 %164, label %165, label %16, !llvm.loop !32

165:                                              ; preds = %158, %8
  %166 = phi i32 [ %10, %8 ], [ %160, %158 ]
  %167 = phi ptr [ %9, %8 ], [ %161, %158 ]
  %168 = add nsw i32 %166, 1
  %169 = load i32, ptr @nrow, align 4, !tbaa !5
  %170 = icmp eq i32 %168, %169
  br i1 %170, label %171, label %8, !llvm.loop !33

171:                                              ; preds = %165, %3
  %172 = load ptr, ptr %5, align 8, !tbaa !15
  tail call void @free(ptr noundef %4)
  %173 = icmp eq ptr %172, null
  br i1 %173, label %177, label %174

174:                                              ; preds = %171
  %175 = load i32, ptr %1, align 4, !tbaa !5
  %176 = sub nsw i32 1, %175
  store i32 %176, ptr %1, align 4, !tbaa !5
  br label %177

177:                                              ; preds = %174, %171
  ret ptr %172
}

; Function Attrs: nounwind ssp uwtable(sync)
define ptr @make_play(i32 noundef %0) local_unnamed_addr #5 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3) #15
  %4 = tail call dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #14
  store ptr null, ptr @game_tree, align 8, !tbaa !23
  %5 = load i32, ptr @ncol, align 4, !tbaa !5
  %6 = sext i32 %5 to i64
  %7 = shl nsw i64 %6, 2
  %8 = tail call ptr @malloc(i64 noundef %7) #14
  %9 = icmp eq i32 %5, 0
  br i1 %9, label %13, label %10

10:                                               ; preds = %1
  %11 = zext i32 %5 to i64
  %12 = shl nuw nsw i64 %11, 2
  tail call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 %12, i1 false), !tbaa !5
  br label %13

13:                                               ; preds = %10, %1
  %14 = load i32, ptr %8, align 4, !tbaa !5
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %8, align 4, !tbaa !5
  br label %16

16:                                               ; preds = %120, %13
  %17 = phi ptr [ %8, %13 ], [ %121, %120 ]
  %18 = phi ptr [ %4, %13 ], [ %122, %120 ]
  %19 = load i32, ptr @ncol, align 4, !tbaa !5
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %40, label %21

21:                                               ; preds = %16, %33
  %22 = phi i32 [ %35, %33 ], [ 0, %16 ]
  %23 = phi i32 [ %34, %33 ], [ 0, %16 ]
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %17, i64 %24
  %26 = load i32, ptr %25, align 4, !tbaa !5
  %27 = load i32, ptr @nrow, align 4, !tbaa !5
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %31

29:                                               ; preds = %21
  store i32 0, ptr %25, align 4, !tbaa !5
  %30 = add nsw i32 %23, 1
  br label %33

31:                                               ; preds = %21
  %32 = add nsw i32 %26, 1
  store i32 %32, ptr %25, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %31, %29
  %34 = phi i32 [ %30, %29 ], [ %23, %31 ]
  %35 = phi i32 [ %22, %29 ], [ 1, %31 ]
  %36 = load i32, ptr @ncol, align 4, !tbaa !5
  %37 = icmp ne i32 %34, %36
  %38 = icmp eq i32 %35, 0
  %39 = select i1 %37, i1 %38, i1 false
  br i1 %39, label %21, label %40, !llvm.loop !9

40:                                               ; preds = %33, %16
  %41 = phi i32 [ 0, %16 ], [ %35, %33 ]
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %123, label %43

43:                                               ; preds = %40
  %44 = load i32, ptr @ncol, align 4, !tbaa !5
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %60, label %46

46:                                               ; preds = %43
  %47 = load i32, ptr @nrow, align 4, !tbaa !5
  %48 = zext i32 %44 to i64
  %49 = load i32, ptr %17, align 4, !tbaa !5
  %50 = icmp sgt i32 %49, %47
  br i1 %50, label %120, label %51

51:                                               ; preds = %46, %56
  %52 = phi i32 [ %58, %56 ], [ %49, %46 ]
  %53 = phi i64 [ %54, %56 ], [ 0, %46 ]
  %54 = add nuw nsw i64 %53, 1
  %55 = icmp eq i64 %54, %48
  br i1 %55, label %60, label %56, !llvm.loop !14

56:                                               ; preds = %51
  %57 = getelementptr inbounds i32, ptr %17, i64 %54
  %58 = load i32, ptr %57, align 4, !tbaa !5
  %59 = icmp sgt i32 %58, %52
  br i1 %59, label %60, label %51, !llvm.loop !14

60:                                               ; preds = %56, %51, %43
  %61 = phi i1 [ %45, %43 ], [ %55, %51 ], [ %55, %56 ]
  br i1 %61, label %62, label %120

62:                                               ; preds = %60
  %63 = tail call dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #14
  %64 = getelementptr inbounds i8, ptr %18, i64 24
  store ptr %63, ptr %64, align 8, !tbaa !19
  %65 = load ptr, ptr @game_tree, align 8, !tbaa !23
  %66 = icmp eq ptr %65, null
  br i1 %66, label %67, label %68

67:                                               ; preds = %62
  store ptr %63, ptr @game_tree, align 8, !tbaa !23
  br label %68

68:                                               ; preds = %67, %62
  %69 = sext i32 %44 to i64
  %70 = shl nsw i64 %69, 2
  %71 = tail call ptr @malloc(i64 noundef %70) #14
  br i1 %45, label %82, label %72

72:                                               ; preds = %68
  %73 = add i32 %44, -1
  %74 = sext i32 %73 to i64
  %75 = zext i32 %73 to i64
  %76 = sub nsw i64 %74, %75
  %77 = shl nsw i64 %76, 2
  %78 = getelementptr i8, ptr %71, i64 %77
  %79 = getelementptr i8, ptr %17, i64 %77
  %80 = zext i32 %44 to i64
  %81 = shl nuw nsw i64 %80, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %78, ptr readonly align 4 %79, i64 %81, i1 false), !tbaa !5
  br label %82

82:                                               ; preds = %68, %72
  %83 = load ptr, ptr %64, align 8, !tbaa !19
  %84 = getelementptr inbounds i8, ptr %83, i64 8
  store ptr %71, ptr %84, align 8, !tbaa !22
  %85 = call ptr @make_list(ptr noundef %17, ptr noundef nonnull %3, ptr noundef nonnull %2)
  %86 = load ptr, ptr %64, align 8, !tbaa !19
  %87 = getelementptr inbounds i8, ptr %86, i64 16
  store ptr %85, ptr %87, align 8, !tbaa !21
  %88 = load i32, ptr %3, align 4, !tbaa !5
  store i32 %88, ptr %86, align 8, !tbaa !25
  %89 = getelementptr inbounds i8, ptr %86, i64 24
  store ptr null, ptr %89, align 8, !tbaa !19
  %90 = load ptr, ptr %64, align 8, !tbaa !19
  %91 = load i32, ptr %2, align 4, !tbaa !5
  %92 = icmp eq i32 %91, 2
  br i1 %92, label %93, label %120

93:                                               ; preds = %82
  tail call void @free(ptr noundef %17)
  %94 = load i32, ptr @nrow, align 4, !tbaa !5
  %95 = load i32, ptr @ncol, align 4, !tbaa !5
  %96 = sext i32 %95 to i64
  %97 = shl nsw i64 %96, 2
  %98 = tail call ptr @malloc(i64 noundef %97) #14
  %99 = icmp eq i32 %95, 0
  br i1 %99, label %104, label %100

100:                                              ; preds = %93
  %101 = zext i32 %95 to i64
  br label %110

102:                                              ; preds = %110
  %103 = trunc nuw nsw i64 %113 to i32
  br label %104

104:                                              ; preds = %102, %93
  %105 = phi i32 [ 0, %93 ], [ %103, %102 ]
  %106 = icmp eq i32 %105, %95
  br i1 %106, label %120, label %107

107:                                              ; preds = %104
  %108 = zext nneg i32 %105 to i64
  %109 = zext i32 %95 to i64
  br label %115

110:                                              ; preds = %110, %100
  %111 = phi i64 [ 0, %100 ], [ %113, %110 ]
  %112 = getelementptr inbounds i32, ptr %98, i64 %111
  store i32 %94, ptr %112, align 4, !tbaa !5
  %113 = add nuw nsw i64 %111, 1
  %114 = icmp eq i64 %113, %101
  br i1 %114, label %102, label %110, !llvm.loop !30

115:                                              ; preds = %115, %107
  %116 = phi i64 [ %108, %107 ], [ %118, %115 ]
  %117 = getelementptr inbounds i32, ptr %98, i64 %116
  store i32 %94, ptr %117, align 4, !tbaa !5
  %118 = add nuw nsw i64 %116, 1
  %119 = icmp eq i64 %118, %109
  br i1 %119, label %120, label %115, !llvm.loop !31

120:                                              ; preds = %115, %46, %104, %82, %60
  %121 = phi ptr [ %17, %82 ], [ %17, %60 ], [ %98, %104 ], [ %17, %46 ], [ %98, %115 ]
  %122 = phi ptr [ %90, %82 ], [ %18, %60 ], [ %90, %104 ], [ %18, %46 ], [ %90, %115 ]
  br label %16, !llvm.loop !34

123:                                              ; preds = %40
  %124 = getelementptr inbounds i8, ptr %4, i64 24
  %125 = load ptr, ptr %124, align 8, !tbaa !19
  tail call void @free(ptr noundef %4)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3) #15
  ret ptr %125
}

; Function Attrs: nounwind ssp uwtable(sync)
define void @make_wanted(ptr nocapture noundef readonly %0) local_unnamed_addr #5 {
  %2 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %3 = getelementptr inbounds i8, ptr %2, i64 8
  store ptr null, ptr %3, align 8, !tbaa !15
  %4 = load i32, ptr @nrow, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %97, label %6

6:                                                ; preds = %1
  %7 = load i32, ptr @ncol, align 4, !tbaa !5
  %8 = icmp eq i32 %7, 0
  %9 = sext i32 %7 to i64
  %10 = shl nsw i64 %9, 2
  %11 = zext i32 %7 to i64
  %12 = add nsw i32 %4, -1
  %13 = add nsw i32 %7, -1
  %14 = add i32 %7, -1
  %15 = sext i32 %14 to i64
  %16 = zext i32 %14 to i64
  %17 = sub nsw i64 %15, %16
  %18 = shl nsw i64 %17, 2
  %19 = zext i32 %7 to i64
  %20 = shl nuw nsw i64 %19, 2
  br label %21

21:                                               ; preds = %6, %92
  %22 = phi ptr [ %2, %6 ], [ %94, %92 ]
  %23 = phi i32 [ 0, %6 ], [ %95, %92 ]
  br i1 %8, label %92, label %24

24:                                               ; preds = %21, %86
  %25 = phi ptr [ %89, %86 ], [ %22, %21 ]
  %26 = phi i32 [ %88, %86 ], [ %23, %21 ]
  %27 = phi i32 [ %90, %86 ], [ 0, %21 ]
  %28 = tail call ptr @malloc(i64 noundef %10) #14
  %29 = icmp eq i32 %27, 0
  br i1 %29, label %34, label %30

30:                                               ; preds = %24
  %31 = zext i32 %27 to i64
  br label %39

32:                                               ; preds = %39
  %33 = trunc nuw nsw i64 %42 to i32
  br label %34

34:                                               ; preds = %32, %24
  %35 = phi i32 [ 0, %24 ], [ %33, %32 ]
  %36 = icmp eq i32 %35, %7
  br i1 %36, label %49, label %37

37:                                               ; preds = %34
  %38 = zext nneg i32 %35 to i64
  br label %44

39:                                               ; preds = %39, %30
  %40 = phi i64 [ 0, %30 ], [ %42, %39 ]
  %41 = getelementptr inbounds i32, ptr %28, i64 %40
  store i32 %4, ptr %41, align 4, !tbaa !5
  %42 = add nuw nsw i64 %40, 1
  %43 = icmp eq i64 %42, %31
  br i1 %43, label %32, label %39, !llvm.loop !30

44:                                               ; preds = %44, %37
  %45 = phi i64 [ %38, %37 ], [ %47, %44 ]
  %46 = getelementptr inbounds i32, ptr %28, i64 %45
  store i32 %26, ptr %46, align 4, !tbaa !5
  %47 = add nuw nsw i64 %45, 1
  %48 = icmp eq i64 %47, %11
  br i1 %48, label %49, label %44, !llvm.loop !31

49:                                               ; preds = %44, %34
  br label %50

50:                                               ; preds = %49, %59
  %51 = phi i64 [ %52, %59 ], [ %9, %49 ]
  %52 = add nsw i64 %51, -1
  %53 = getelementptr inbounds i32, ptr %28, i64 %52
  %54 = load i32, ptr %53, align 4, !tbaa !5
  %55 = getelementptr inbounds i32, ptr %0, i64 %52
  %56 = load i32, ptr %55, align 4, !tbaa !5
  %57 = icmp sgt i32 %54, %56
  br i1 %57, label %58, label %59

58:                                               ; preds = %50
  store i32 %56, ptr %53, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %58, %50
  %60 = icmp eq i64 %52, 0
  br i1 %60, label %61, label %50, !llvm.loop !12

61:                                               ; preds = %59, %64
  %62 = phi i64 [ %65, %64 ], [ %9, %59 ]
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %73, label %64

64:                                               ; preds = %61
  %65 = add nsw i64 %62, -1
  %66 = getelementptr inbounds i32, ptr %28, i64 %65
  %67 = load i32, ptr %66, align 4, !tbaa !5
  %68 = getelementptr inbounds i32, ptr %0, i64 %65
  %69 = load i32, ptr %68, align 4, !tbaa !5
  %70 = icmp eq i32 %67, %69
  br i1 %70, label %61, label %71, !llvm.loop !13

71:                                               ; preds = %64
  %72 = trunc nsw i64 %62 to i32
  br label %73

73:                                               ; preds = %61, %71
  %74 = phi i32 [ %72, %71 ], [ 0, %61 ]
  %75 = icmp sgt i32 %74, 0
  br i1 %75, label %76, label %84

76:                                               ; preds = %73
  %77 = tail call dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #14
  %78 = getelementptr inbounds i8, ptr %25, i64 8
  store ptr %77, ptr %78, align 8, !tbaa !15
  %79 = tail call ptr @malloc(i64 noundef %10) #14
  %80 = getelementptr i8, ptr %79, i64 %18
  %81 = getelementptr i8, ptr %28, i64 %18
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %80, ptr readonly align 4 %81, i64 %20, i1 false), !tbaa !5
  store ptr %79, ptr %77, align 8, !tbaa !18
  %82 = getelementptr inbounds i8, ptr %77, i64 8
  store ptr null, ptr %82, align 8, !tbaa !15
  %83 = load ptr, ptr %78, align 8, !tbaa !15
  br label %86

84:                                               ; preds = %73
  %85 = select i1 %29, i32 %12, i32 %26
  br label %86

86:                                               ; preds = %84, %76
  %87 = phi i32 [ %13, %84 ], [ %27, %76 ]
  %88 = phi i32 [ %85, %84 ], [ %26, %76 ]
  %89 = phi ptr [ %25, %84 ], [ %83, %76 ]
  tail call void @free(ptr noundef %28)
  %90 = add nsw i32 %87, 1
  %91 = icmp eq i32 %90, %7
  br i1 %91, label %92, label %24, !llvm.loop !35

92:                                               ; preds = %86, %21
  %93 = phi i32 [ %23, %21 ], [ %88, %86 ]
  %94 = phi ptr [ %22, %21 ], [ %89, %86 ]
  %95 = add nsw i32 %93, 1
  %96 = icmp eq i32 %95, %4
  br i1 %96, label %97, label %21, !llvm.loop !36

97:                                               ; preds = %92, %1
  %98 = load ptr, ptr %3, align 8, !tbaa !15
  tail call void @free(ptr noundef %2)
  store ptr %98, ptr @wanted, align 8, !tbaa !23
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define noalias noundef ptr @get_good_move(ptr noundef readonly %0) local_unnamed_addr #7 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %54, label %3

3:                                                ; preds = %1
  %4 = load i32, ptr @ncol, align 4
  %5 = sext i32 %4 to i64
  br label %6

6:                                                ; preds = %3, %34
  %7 = phi ptr [ %9, %34 ], [ %0, %3 ]
  %8 = getelementptr inbounds i8, ptr %7, i64 8
  %9 = load ptr, ptr %8, align 8, !tbaa !15
  %10 = icmp eq ptr %9, null
  br i1 %10, label %37, label %11

11:                                               ; preds = %6
  %12 = load ptr, ptr %7, align 8, !tbaa !18
  br label %13

13:                                               ; preds = %30, %11
  %14 = phi ptr [ @game_tree, %11 ], [ %33, %30 ]
  %15 = load ptr, ptr %14, align 8, !tbaa !23
  %16 = getelementptr inbounds i8, ptr %15, i64 8
  %17 = load ptr, ptr %16, align 8, !tbaa !22
  br label %18

18:                                               ; preds = %21, %13
  %19 = phi i64 [ %22, %21 ], [ %5, %13 ]
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %30, label %21

21:                                               ; preds = %18
  %22 = add nsw i64 %19, -1
  %23 = getelementptr inbounds i32, ptr %17, i64 %22
  %24 = load i32, ptr %23, align 4, !tbaa !5
  %25 = getelementptr inbounds i32, ptr %12, i64 %22
  %26 = load i32, ptr %25, align 4, !tbaa !5
  %27 = icmp eq i32 %24, %26
  br i1 %27, label %18, label %28, !llvm.loop !13

28:                                               ; preds = %21
  %29 = trunc nsw i64 %19 to i32
  br label %30

30:                                               ; preds = %18, %28
  %31 = phi i32 [ %29, %28 ], [ 0, %18 ]
  %32 = icmp sgt i32 %31, 0
  %33 = getelementptr inbounds i8, ptr %15, i64 24
  br i1 %32, label %13, label %34, !llvm.loop !24

34:                                               ; preds = %30
  %35 = load i32, ptr %15, align 8, !tbaa !25
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %6, !llvm.loop !37

37:                                               ; preds = %6, %34
  %38 = load ptr, ptr %7, align 8, !tbaa !18
  %39 = load i32, ptr @ncol, align 4, !tbaa !5
  %40 = sext i32 %39 to i64
  %41 = shl nsw i64 %40, 2
  %42 = tail call ptr @malloc(i64 noundef %41) #14
  %43 = icmp eq i32 %39, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %37
  %45 = add i32 %39, -1
  %46 = sext i32 %45 to i64
  %47 = zext i32 %45 to i64
  %48 = sub nsw i64 %46, %47
  %49 = shl nsw i64 %48, 2
  %50 = getelementptr i8, ptr %42, i64 %49
  %51 = getelementptr i8, ptr %38, i64 %49
  %52 = zext i32 %39 to i64
  %53 = shl nuw nsw i64 %52, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %50, ptr readonly align 4 %51, i64 %53, i1 false), !tbaa !5
  br label %54

54:                                               ; preds = %44, %37, %1
  %55 = phi ptr [ null, %1 ], [ %42, %37 ], [ %42, %44 ]
  ret ptr %55
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define noalias noundef ptr @get_winning_move(ptr nocapture noundef readonly %0) local_unnamed_addr #7 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi ptr [ %0, %1 ], [ %5, %2 ]
  %4 = getelementptr inbounds i8, ptr %3, i64 24
  %5 = load ptr, ptr %4, align 8, !tbaa !19
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %2, !llvm.loop !38

7:                                                ; preds = %2
  %8 = getelementptr inbounds i8, ptr %3, i64 16
  %9 = load ptr, ptr %8, align 8, !tbaa !21
  %10 = icmp eq ptr %9, null
  br i1 %10, label %60, label %11

11:                                               ; preds = %7
  %12 = load i32, ptr @ncol, align 4
  %13 = sext i32 %12 to i64
  br label %14

14:                                               ; preds = %42, %11
  %15 = phi ptr [ %17, %42 ], [ %9, %11 ]
  %16 = getelementptr inbounds i8, ptr %15, i64 8
  %17 = load ptr, ptr %16, align 8, !tbaa !15
  %18 = icmp eq ptr %17, null
  br i1 %18, label %45, label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %15, align 8, !tbaa !18
  br label %21

21:                                               ; preds = %38, %19
  %22 = phi ptr [ @game_tree, %19 ], [ %41, %38 ]
  %23 = load ptr, ptr %22, align 8, !tbaa !23
  %24 = getelementptr inbounds i8, ptr %23, i64 8
  %25 = load ptr, ptr %24, align 8, !tbaa !22
  br label %26

26:                                               ; preds = %29, %21
  %27 = phi i64 [ %30, %29 ], [ %13, %21 ]
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %38, label %29

29:                                               ; preds = %26
  %30 = add nsw i64 %27, -1
  %31 = getelementptr inbounds i32, ptr %25, i64 %30
  %32 = load i32, ptr %31, align 4, !tbaa !5
  %33 = getelementptr inbounds i32, ptr %20, i64 %30
  %34 = load i32, ptr %33, align 4, !tbaa !5
  %35 = icmp eq i32 %32, %34
  br i1 %35, label %26, label %36, !llvm.loop !13

36:                                               ; preds = %29
  %37 = trunc nsw i64 %27 to i32
  br label %38

38:                                               ; preds = %26, %36
  %39 = phi i32 [ %37, %36 ], [ 0, %26 ]
  %40 = icmp sgt i32 %39, 0
  %41 = getelementptr inbounds i8, ptr %23, i64 24
  br i1 %40, label %21, label %42, !llvm.loop !24

42:                                               ; preds = %38
  %43 = load i32, ptr %23, align 8, !tbaa !25
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %14, !llvm.loop !37

45:                                               ; preds = %42, %14
  %46 = load ptr, ptr %15, align 8, !tbaa !18
  %47 = shl nsw i64 %13, 2
  %48 = tail call ptr @malloc(i64 noundef %47) #14
  %49 = icmp eq i32 %12, 0
  br i1 %49, label %60, label %50

50:                                               ; preds = %45
  %51 = add i32 %12, -1
  %52 = sext i32 %51 to i64
  %53 = zext i32 %51 to i64
  %54 = sub nsw i64 %52, %53
  %55 = shl nsw i64 %54, 2
  %56 = getelementptr i8, ptr %48, i64 %55
  %57 = getelementptr i8, ptr %46, i64 %55
  %58 = zext i32 %12 to i64
  %59 = shl nuw nsw i64 %58, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %56, ptr readonly align 4 %57, i64 %59, i1 false), !tbaa !5
  br label %60

60:                                               ; preds = %7, %45, %50
  %61 = phi ptr [ null, %7 ], [ %48, %45 ], [ %48, %50 ]
  ret ptr %61
}

; Function Attrs: nofree norecurse nosync nounwind ssp memory(read, inaccessiblemem: none) uwtable(sync)
define ptr @where(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 {
  %3 = load i32, ptr @ncol, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  br label %5

5:                                                ; preds = %24, %2
  %6 = phi ptr [ %1, %2 ], [ %26, %24 ]
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %8 = load ptr, ptr %7, align 8, !tbaa !22
  br label %9

9:                                                ; preds = %12, %5
  %10 = phi i64 [ %13, %12 ], [ %4, %5 ]
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %21, label %12

12:                                               ; preds = %9
  %13 = add nsw i64 %10, -1
  %14 = getelementptr inbounds i32, ptr %8, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = getelementptr inbounds i32, ptr %0, i64 %13
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %9, label %19, !llvm.loop !13

19:                                               ; preds = %12
  %20 = trunc nsw i64 %10 to i32
  br label %21

21:                                               ; preds = %9, %19
  %22 = phi i32 [ %20, %19 ], [ 0, %9 ]
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %21
  %25 = getelementptr inbounds i8, ptr %6, i64 24
  %26 = load ptr, ptr %25, align 8, !tbaa !19
  br label %5, !llvm.loop !39

27:                                               ; preds = %21
  %28 = getelementptr inbounds i8, ptr %6, i64 16
  %29 = load ptr, ptr %28, align 8, !tbaa !21
  ret ptr %29
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
  br i1 %12, label %5, label %14, !llvm.loop !40

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
  %9 = load i32, ptr @ncol, align 4, !tbaa !5
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  %12 = tail call ptr @malloc(i64 noundef %11) #14
  %13 = icmp eq i32 %9, 0
  br i1 %13, label %18, label %14

14:                                               ; preds = %0
  %15 = zext i32 %9 to i64
  br label %24

16:                                               ; preds = %24
  %17 = trunc nuw nsw i64 %27 to i32
  br label %18

18:                                               ; preds = %16, %0
  %19 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %20 = icmp eq i32 %19, %9
  br i1 %20, label %34, label %21

21:                                               ; preds = %18
  %22 = zext nneg i32 %19 to i64
  %23 = zext i32 %9 to i64
  br label %29

24:                                               ; preds = %24, %14
  %25 = phi i64 [ 0, %14 ], [ %27, %24 ]
  %26 = getelementptr inbounds i32, ptr %12, i64 %25
  store i32 %8, ptr %26, align 4, !tbaa !5
  %27 = add nuw nsw i64 %25, 1
  %28 = icmp eq i64 %27, %15
  br i1 %28, label %16, label %24, !llvm.loop !30

29:                                               ; preds = %29, %21
  %30 = phi i64 [ %22, %21 ], [ %32, %29 ]
  %31 = getelementptr inbounds i32, ptr %12, i64 %30
  store i32 %8, ptr %31, align 4, !tbaa !5
  %32 = add nuw nsw i64 %30, 1
  %33 = icmp eq i64 %32, %23
  br i1 %33, label %34, label %29, !llvm.loop !31

34:                                               ; preds = %29, %18
  %35 = icmp eq ptr %12, null
  br i1 %35, label %133, label %36

36:                                               ; preds = %34, %128
  %37 = phi i32 [ %129, %128 ], [ 0, %34 ]
  %38 = phi ptr [ %114, %128 ], [ %12, %34 ]
  %39 = load i32, ptr @ncol, align 4
  %40 = sext i32 %39 to i64
  br label %41

41:                                               ; preds = %60, %36
  %42 = phi ptr [ %7, %36 ], [ %62, %60 ]
  %43 = getelementptr inbounds i8, ptr %42, i64 8
  %44 = load ptr, ptr %43, align 8, !tbaa !22
  br label %45

45:                                               ; preds = %48, %41
  %46 = phi i64 [ %49, %48 ], [ %40, %41 ]
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %57, label %48

48:                                               ; preds = %45
  %49 = add nsw i64 %46, -1
  %50 = getelementptr inbounds i32, ptr %44, i64 %49
  %51 = load i32, ptr %50, align 4, !tbaa !5
  %52 = getelementptr inbounds i32, ptr %38, i64 %49
  %53 = load i32, ptr %52, align 4, !tbaa !5
  %54 = icmp eq i32 %51, %53
  br i1 %54, label %45, label %55, !llvm.loop !13

55:                                               ; preds = %48
  %56 = trunc nsw i64 %46 to i32
  br label %57

57:                                               ; preds = %45, %55
  %58 = phi i32 [ %56, %55 ], [ 0, %45 ]
  %59 = icmp sgt i32 %58, 0
  br i1 %59, label %60, label %63

60:                                               ; preds = %57
  %61 = getelementptr inbounds i8, ptr %42, i64 24
  %62 = load ptr, ptr %61, align 8, !tbaa !19
  br label %41, !llvm.loop !39

63:                                               ; preds = %57
  %64 = getelementptr inbounds i8, ptr %42, i64 16
  %65 = load ptr, ptr %64, align 8, !tbaa !21
  %66 = icmp eq ptr %65, null
  br i1 %66, label %113, label %67

67:                                               ; preds = %63, %95
  %68 = phi ptr [ %70, %95 ], [ %65, %63 ]
  %69 = getelementptr inbounds i8, ptr %68, i64 8
  %70 = load ptr, ptr %69, align 8, !tbaa !15
  %71 = icmp eq ptr %70, null
  br i1 %71, label %98, label %72

72:                                               ; preds = %67
  %73 = load ptr, ptr %68, align 8, !tbaa !18
  br label %74

74:                                               ; preds = %91, %72
  %75 = phi ptr [ @game_tree, %72 ], [ %94, %91 ]
  %76 = load ptr, ptr %75, align 8, !tbaa !23
  %77 = getelementptr inbounds i8, ptr %76, i64 8
  %78 = load ptr, ptr %77, align 8, !tbaa !22
  br label %79

79:                                               ; preds = %82, %74
  %80 = phi i64 [ %83, %82 ], [ %40, %74 ]
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %91, label %82

82:                                               ; preds = %79
  %83 = add nsw i64 %80, -1
  %84 = getelementptr inbounds i32, ptr %78, i64 %83
  %85 = load i32, ptr %84, align 4, !tbaa !5
  %86 = getelementptr inbounds i32, ptr %73, i64 %83
  %87 = load i32, ptr %86, align 4, !tbaa !5
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %79, label %89, !llvm.loop !13

89:                                               ; preds = %82
  %90 = trunc nsw i64 %80 to i32
  br label %91

91:                                               ; preds = %79, %89
  %92 = phi i32 [ %90, %89 ], [ 0, %79 ]
  %93 = icmp sgt i32 %92, 0
  %94 = getelementptr inbounds i8, ptr %76, i64 24
  br i1 %93, label %74, label %95, !llvm.loop !24

95:                                               ; preds = %91
  %96 = load i32, ptr %76, align 8, !tbaa !25
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %67, !llvm.loop !37

98:                                               ; preds = %95, %67
  %99 = load ptr, ptr %68, align 8, !tbaa !18
  %100 = shl nsw i64 %40, 2
  %101 = tail call ptr @malloc(i64 noundef %100) #14
  %102 = icmp eq i32 %39, 0
  br i1 %102, label %113, label %103

103:                                              ; preds = %98
  %104 = add i32 %39, -1
  %105 = sext i32 %104 to i64
  %106 = zext i32 %104 to i64
  %107 = sub nsw i64 %105, %106
  %108 = shl nsw i64 %107, 2
  %109 = getelementptr i8, ptr %101, i64 %108
  %110 = getelementptr i8, ptr %99, i64 %108
  %111 = zext i32 %39 to i64
  %112 = shl nuw nsw i64 %111, 2
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 4 %109, ptr readonly align 4 %110, i64 %112, i1 false), !tbaa !5
  br label %113

113:                                              ; preds = %63, %98, %103
  %114 = phi ptr [ null, %63 ], [ %101, %98 ], [ %101, %103 ]
  %115 = icmp eq ptr %114, null
  br i1 %115, label %128, label %116

116:                                              ; preds = %113, %116
  %117 = phi i64 [ %123, %116 ], [ 0, %113 ]
  %118 = getelementptr inbounds i32, ptr %114, i64 %117
  %119 = load i32, ptr %118, align 4, !tbaa !5
  %120 = getelementptr inbounds i32, ptr %38, i64 %117
  %121 = load i32, ptr %120, align 4, !tbaa !5
  %122 = icmp eq i32 %119, %121
  %123 = add nuw nsw i64 %117, 1
  br i1 %122, label %116, label %124, !llvm.loop !40

124:                                              ; preds = %116
  %125 = trunc nuw nsw i64 %117 to i32
  %126 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, i32 noundef %37, i32 noundef %119, i32 noundef %125)
  %127 = sub nuw nsw i32 1, %37
  tail call void @free(ptr noundef %38)
  br label %128

128:                                              ; preds = %124, %113
  %129 = phi i32 [ %127, %124 ], [ %37, %113 ]
  %130 = icmp eq ptr %114, null
  br i1 %130, label %131, label %36, !llvm.loop !41

131:                                              ; preds = %128
  %132 = sub nuw nsw i32 1, %129
  br label %133

133:                                              ; preds = %131, %34
  %134 = phi i32 [ 1, %34 ], [ %132, %131 ]
  tail call void @dump_play(ptr noundef %7)
  %135 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, i32 noundef %134)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #12

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #13

attributes #0 = { mustprogress nofree nounwind ssp willreturn uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
!15 = !{!16, !17, i64 8}
!16 = !{!"_list", !17, i64 0, !17, i64 8}
!17 = !{!"any pointer", !7, i64 0}
!18 = !{!16, !17, i64 0}
!19 = !{!20, !17, i64 24}
!20 = !{!"_play", !6, i64 0, !17, i64 8, !17, i64 16, !17, i64 24}
!21 = !{!20, !17, i64 16}
!22 = !{!20, !17, i64 8}
!23 = !{!17, !17, i64 0}
!24 = distinct !{!24, !10, !11}
!25 = !{!20, !6, i64 0}
!26 = distinct !{!26, !10, !11}
!27 = distinct !{!27, !10, !11}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
!30 = distinct !{!30, !10, !11}
!31 = distinct !{!31, !10, !11}
!32 = distinct !{!32, !10, !11}
!33 = distinct !{!33, !10, !11}
!34 = distinct !{!34, !10, !11}
!35 = distinct !{!35, !10, !11}
!36 = distinct !{!36, !10, !11}
!37 = distinct !{!37, !10, !11}
!38 = distinct !{!38, !10, !11}
!39 = distinct !{!39, !10, !11}
!40 = distinct !{!40, !10, !11}
!41 = distinct !{!41, !10, !11}
