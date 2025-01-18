; ModuleID = '../format.c'
source_filename = "../format.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @veryHugeFunction(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, ptr noundef %9, i8 noundef signext %10) #0 {
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i8, align 1
  %23 = alloca i32, align 4
  store i32 %0, ptr %12, align 4
  store i32 %1, ptr %13, align 4
  store i32 %2, ptr %14, align 4
  store i32 %3, ptr %15, align 4
  store i32 %4, ptr %16, align 4
  store i32 %5, ptr %17, align 4
  store i32 %6, ptr %18, align 4
  store i32 %7, ptr %19, align 4
  store i32 %8, ptr %20, align 4
  store ptr %9, ptr %21, align 8
  store i8 %10, ptr %22, align 1
  %24 = load i32, ptr %12, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %55, label %26

26:                                               ; preds = %11
  %27 = load i32, ptr %15, align 4
  %28 = icmp eq i32 %27, 10
  br i1 %28, label %55, label %29

29:                                               ; preds = %26
  %30 = load i32, ptr %12, align 4
  %31 = load i32, ptr %13, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %14, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, ptr %15, align 4
  %36 = add nsw i32 %34, %35
  %37 = load i32, ptr %16, align 4
  %38 = add nsw i32 %36, %37
  %39 = load i32, ptr %17, align 4
  %40 = add nsw i32 %38, %39
  %41 = load i32, ptr %18, align 4
  %42 = add nsw i32 %40, %41
  %43 = load i32, ptr %19, align 4
  %44 = add nsw i32 %42, %43
  %45 = load i32, ptr %20, align 4
  %46 = add nsw i32 %44, %45
  %47 = load ptr, ptr %21, align 8
  %48 = getelementptr inbounds i32, ptr %47, i64 1
  %49 = load i32, ptr %48, align 4
  %50 = icmp ne i32 %46, %49
  br i1 %50, label %55, label %51

51:                                               ; preds = %29
  %52 = load i8, ptr %22, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp ne i32 %53, 115
  br i1 %54, label %55, label %56

55:                                               ; preds = %51, %29, %26, %11
  br label %81

56:                                               ; preds = %51
  %57 = load i32, ptr %13, align 4
  %58 = load i32, ptr %14, align 4
  %59 = add nsw i32 %57, %58
  %60 = load i32, ptr %16, align 4
  %61 = add nsw i32 %59, %60
  store i32 %61, ptr %23, align 4
  %62 = load i32, ptr %12, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, ptr %12, align 4
  %64 = load i32, ptr %13, align 4
  %65 = add nsw i32 %64, -1
  store i32 %65, ptr %13, align 4
  %66 = load i32, ptr %14, align 4
  %67 = add nsw i32 %66, -1
  store i32 %67, ptr %14, align 4
  %68 = load i32, ptr %15, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %15, align 4
  %70 = load i32, ptr %23, align 4
  %71 = load i32, ptr %17, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %17, align 4
  %73 = load i32, ptr %18, align 4
  %74 = add nsw i32 %73, -1
  store i32 %74, ptr %18, align 4
  %75 = load i32, ptr %19, align 4
  %76 = add nsw i32 %75, -1
  store i32 %76, ptr %19, align 4
  %77 = load i32, ptr %20, align 4
  %78 = add nsw i32 %77, -1
  store i32 %78, ptr %20, align 4
  %79 = load ptr, ptr %21, align 8
  %80 = load i8, ptr %22, align 1
  call void @veryHugeFunction(i32 noundef %62, i32 noundef %64, i32 noundef %66, i32 noundef %68, i32 noundef %70, i32 noundef %71, i32 noundef %73, i32 noundef %75, i32 noundef %77, ptr noundef %79, i8 noundef signext %80)
  br label %81

81:                                               ; preds = %56, %55
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.7"}
