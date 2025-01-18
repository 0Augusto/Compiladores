; ModuleID = '../misr.c'
source_filename = "../misr.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.cells = type { i32, i32, ptr }

@reg_len = global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%hu\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Register too long; Max. = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Prob. out of range 0=<Prob>=1\0A\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"Structure does not match Register length:\0A\00", align 1
@.str.4 = private unnamed_addr constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.cells, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca [100 x i8], align 1
  %13 = alloca [3 x i16], align 2
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 10, ptr %7, align 4
  store i32 10, ptr @reg_len, align 4
  store double 2.500000e-01, ptr %11, align 8
  store i32 100000, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 6
  br i1 %15, label %16, label %22

16:                                               ; preds = %2
  %17 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 6
  %20 = load ptr, ptr %19, align 8
  %21 = call ptr @__strcpy_chk(ptr noundef %17, ptr noundef %20, i64 noundef 100) #5
  br label %39

22:                                               ; preds = %2
  store i32 1, ptr %10, align 4
  br label %23

23:                                               ; preds = %31, %22
  %24 = load i32, ptr %10, align 4
  %25 = load i32, ptr @reg_len, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %34

27:                                               ; preds = %23
  %28 = load i32, ptr %10, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 %29
  store i8 48, ptr %30, align 1
  br label %31

31:                                               ; preds = %27
  %32 = load i32, ptr %10, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %10, align 4
  br label %23, !llvm.loop !5

34:                                               ; preds = %23
  %35 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  store i8 49, ptr %35, align 1
  %36 = load i32, ptr @reg_len, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 %37
  store i8 0, ptr %38, align 1
  br label %39

39:                                               ; preds = %34, %16
  %40 = load i32, ptr %4, align 4
  %41 = icmp sgt i32 %40, 7
  br i1 %41, label %42, label %48

42:                                               ; preds = %39
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 7
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 0
  %47 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %45, ptr noundef @.str, ptr noundef %46)
  br label %50

48:                                               ; preds = %39
  %49 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 0
  store i16 1, ptr %49, align 2
  br label %50

50:                                               ; preds = %48, %42
  %51 = load i32, ptr %4, align 4
  %52 = icmp sgt i32 %51, 8
  br i1 %52, label %53, label %59

53:                                               ; preds = %50
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds ptr, ptr %54, i64 8
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 1
  %58 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %56, ptr noundef @.str, ptr noundef %57)
  br label %61

59:                                               ; preds = %50
  %60 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 1
  store i16 0, ptr %60, align 2
  br label %61

61:                                               ; preds = %59, %53
  %62 = load i32, ptr %4, align 4
  %63 = icmp sgt i32 %62, 9
  br i1 %63, label %64, label %70

64:                                               ; preds = %61
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds ptr, ptr %65, i64 9
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 2
  %69 = call i32 (ptr, ptr, ...) @sscanf(ptr noundef %67, ptr noundef @.str, ptr noundef %68)
  br label %72

70:                                               ; preds = %61
  %71 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 2
  store i16 0, ptr %71, align 2
  br label %72

72:                                               ; preds = %70, %64
  %73 = load i32, ptr @reg_len, align 4
  %74 = icmp sgt i32 %73, 100
  br i1 %74, label %75, label %77

75:                                               ; preds = %72
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef 100)
  store i32 2, ptr %3, align 4
  br label %156

77:                                               ; preds = %72
  %78 = load double, ptr %11, align 8
  %79 = fcmp ogt double %78, 1.000000e+00
  br i1 %79, label %83, label %80

80:                                               ; preds = %77
  %81 = load double, ptr %11, align 8
  %82 = fcmp olt double %81, 0.000000e+00
  br i1 %82, label %83, label %85

83:                                               ; preds = %80, %77
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 3, ptr %3, align 4
  br label %156

85:                                               ; preds = %80
  %86 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %87 = call i64 @strlen(ptr noundef %86) #5
  %88 = load i32, ptr @reg_len, align 4
  %89 = sext i32 %88 to i64
  %90 = icmp ne i64 %87, %89
  br i1 %90, label %91, label %93

91:                                               ; preds = %85
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 4, ptr %3, align 4
  br label %156

93:                                               ; preds = %85
  %94 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 0
  %95 = call ptr @seed48(ptr noundef %94)
  call void @create_link_list(ptr noundef %6)
  store i32 0, ptr %9, align 4
  %96 = load i32, ptr %7, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %114

98:                                               ; preds = %93
  store i32 0, ptr %10, align 4
  br label %99

99:                                               ; preds = %110, %98
  %100 = load i32, ptr %10, align 4
  %101 = load i32, ptr %8, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %113

103:                                              ; preds = %99
  call void @init(ptr noundef %6)
  %104 = load i32, ptr %7, align 4
  %105 = load double, ptr %11, align 8
  %106 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %107 = call i32 @simulate(i32 noundef %104, ptr noundef %6, double noundef %105, ptr noundef %106)
  %108 = load i32, ptr %9, align 4
  %109 = add nsw i32 %108, %107
  store i32 %109, ptr %9, align 4
  br label %110

110:                                              ; preds = %103
  %111 = load i32, ptr %10, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %10, align 4
  br label %99, !llvm.loop !7

113:                                              ; preds = %99
  br label %132

114:                                              ; preds = %93
  call void @init(ptr noundef %6)
  %115 = load double, ptr %11, align 8
  %116 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %117 = call i32 @simulate(i32 noundef 10000, ptr noundef %6, double noundef %115, ptr noundef %116)
  store i32 0, ptr %10, align 4
  br label %118

118:                                              ; preds = %128, %114
  %119 = load i32, ptr %10, align 4
  %120 = load i32, ptr %8, align 4
  %121 = icmp slt i32 %119, %120
  br i1 %121, label %122, label %131

122:                                              ; preds = %118
  %123 = load double, ptr %11, align 8
  %124 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %125 = call i32 @simulate(i32 noundef 1, ptr noundef %6, double noundef %123, ptr noundef %124)
  %126 = load i32, ptr %9, align 4
  %127 = add nsw i32 %126, %125
  store i32 %127, ptr %9, align 4
  br label %128

128:                                              ; preds = %122
  %129 = load i32, ptr %10, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, ptr %10, align 4
  br label %118, !llvm.loop !8

131:                                              ; preds = %118
  br label %132

132:                                              ; preds = %131, %113
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %134 = load i32, ptr @reg_len, align 4
  %135 = load i32, ptr %7, align 4
  %136 = load double, ptr %11, align 8
  %137 = load i32, ptr %8, align 4
  %138 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %139 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 0
  %140 = load i16, ptr %139, align 2
  %141 = zext i16 %140 to i32
  %142 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 1
  %143 = load i16, ptr %142, align 2
  %144 = zext i16 %143 to i32
  %145 = getelementptr inbounds [3 x i16], ptr %13, i64 0, i64 2
  %146 = load i16, ptr %145, align 2
  %147 = zext i16 %146 to i32
  %148 = load i32, ptr %8, align 4
  %149 = load i32, ptr %9, align 4
  %150 = sub nsw i32 %148, %149
  %151 = sitofp i32 %150 to double
  %152 = load i32, ptr %8, align 4
  %153 = sitofp i32 %152 to double
  %154 = fdiv double %151, %153
  %155 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %134, i32 noundef %135, double noundef %136, i32 noundef %137, ptr noundef %138, i32 noundef %141, i32 noundef %144, i32 noundef %147, double noundef %154)
  store i32 0, ptr %3, align 4
  br label %156

156:                                              ; preds = %132, %91, %83, %75
  %157 = load i32, ptr %3, align 4
  ret i32 %157
}

; Function Attrs: nounwind
declare ptr @__strcpy_chk(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @sscanf(ptr noundef, ptr noundef, ...) #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #1

declare ptr @seed48(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @create_link_list(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call i64 @llvm.objectsize.i64.p0(ptr %7, i1 false, i1 true, i1 false)
  %9 = call ptr @__memset_chk(ptr noundef %6, i32 noundef 0, i64 noundef 16, i64 noundef %8) #5
  %10 = load ptr, ptr %2, align 8
  store ptr %10, ptr %5, align 8
  store i32 0, ptr %3, align 4
  br label %11

11:                                               ; preds = %30, %1
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr @reg_len, align 4
  %14 = add nsw i32 %13, 1
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %16, label %33

16:                                               ; preds = %11
  %17 = call ptr @malloc(i64 noundef 16) #6
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.cells, ptr %18, i32 0, i32 0
  store i32 1, ptr %19, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.cells, ptr %20, i32 0, i32 1
  store i32 1, ptr %21, align 4
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.cells, ptr %22, i32 0, i32 2
  store ptr null, ptr %23, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.cells, ptr %25, i32 0, i32 2
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.cells, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %5, align 8
  br label %30

30:                                               ; preds = %16
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %3, align 4
  br label %11, !llvm.loop !9

33:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %8, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.cells, ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %17

8:                                                ; preds = %3
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.cells, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.cells, ptr %12, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.cells, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %2, align 8
  br label %3, !llvm.loop !10

17:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @simulate(i32 noundef %0, ptr noundef %1, double noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i64, align 8
  %19 = alloca double, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store double %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %10, align 4
  %20 = load i32, ptr @reg_len, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sdiv i32 %21, 31
  store i32 %22, ptr %14, align 4
  %23 = load i32, ptr @reg_len, align 4
  %24 = sub nsw i32 %23, 1
  %25 = srem i32 %24, 31
  store i32 %25, ptr %13, align 4
  %26 = load ptr, ptr %6, align 8
  store ptr %26, ptr %9, align 8
  store i32 0, ptr %15, align 4
  br label %27

27:                                               ; preds = %233, %4
  %28 = load i32, ptr %15, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %236

31:                                               ; preds = %27
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 0, ptr %16, align 4
  br label %32

32:                                               ; preds = %108, %31
  %33 = load i32, ptr %16, align 4
  %34 = load i32, ptr %14, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %111

36:                                               ; preds = %32
  %37 = call i64 @lrand48()
  store i64 %37, ptr %18, align 8
  store i32 0, ptr %17, align 4
  br label %38

38:                                               ; preds = %104, %36
  %39 = load i32, ptr %17, align 4
  %40 = icmp slt i32 %39, 31
  br i1 %40, label %41, label %107

41:                                               ; preds = %38
  %42 = load ptr, ptr %8, align 8
  %43 = load i32, ptr %16, align 4
  %44 = mul nsw i32 %43, 31
  %45 = load i32, ptr %17, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, ptr %42, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, 49
  br i1 %51, label %52, label %63

52:                                               ; preds = %41
  %53 = load ptr, ptr %9, align 8
  %54 = getelementptr inbounds %struct.cells, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %54, align 8
  %56 = load i32, ptr %11, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %11, align 4
  %58 = load ptr, ptr %9, align 8
  %59 = getelementptr inbounds %struct.cells, ptr %58, i32 0, i32 1
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %12, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %12, align 4
  br label %63

63:                                               ; preds = %52, %41
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds %struct.cells, ptr %64, i32 0, i32 2
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds %struct.cells, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = sext i32 %68 to i64
  %70 = load i64, ptr %18, align 8
  %71 = add nsw i64 %69, %70
  %72 = and i64 %71, 1
  %73 = trunc i64 %72 to i32
  %74 = load ptr, ptr %9, align 8
  %75 = getelementptr inbounds %struct.cells, ptr %74, i32 0, i32 0
  store i32 %73, ptr %75, align 8
  %76 = call i64 @lrand48()
  %77 = srem i64 %76, 1000
  %78 = sitofp i64 %77 to double
  %79 = fdiv double %78, 1.000000e+03
  store double %79, ptr %19, align 8
  %80 = load double, ptr %7, align 8
  %81 = load double, ptr %19, align 8
  %82 = fcmp ogt double %80, %81
  br i1 %82, label %83, label %86

83:                                               ; preds = %63
  %84 = load i64, ptr %18, align 8
  %85 = xor i64 %84, 1
  store i64 %85, ptr %18, align 8
  br label %86

86:                                               ; preds = %83, %63
  %87 = load ptr, ptr %9, align 8
  %88 = getelementptr inbounds %struct.cells, ptr %87, i32 0, i32 2
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.cells, ptr %89, i32 0, i32 1
  %91 = load i32, ptr %90, align 4
  %92 = sext i32 %91 to i64
  %93 = load i64, ptr %18, align 8
  %94 = add nsw i64 %92, %93
  %95 = and i64 %94, 1
  %96 = trunc i64 %95 to i32
  %97 = load ptr, ptr %9, align 8
  %98 = getelementptr inbounds %struct.cells, ptr %97, i32 0, i32 1
  store i32 %96, ptr %98, align 4
  %99 = load ptr, ptr %9, align 8
  %100 = getelementptr inbounds %struct.cells, ptr %99, i32 0, i32 2
  %101 = load ptr, ptr %100, align 8
  store ptr %101, ptr %9, align 8
  %102 = load i64, ptr %18, align 8
  %103 = ashr i64 %102, 1
  store i64 %103, ptr %18, align 8
  br label %104

104:                                              ; preds = %86
  %105 = load i32, ptr %17, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %17, align 4
  br label %38, !llvm.loop !11

107:                                              ; preds = %38
  br label %108

108:                                              ; preds = %107
  %109 = load i32, ptr %16, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %16, align 4
  br label %32, !llvm.loop !12

111:                                              ; preds = %32
  %112 = call i64 @lrand48()
  store i64 %112, ptr %18, align 8
  store i32 0, ptr %17, align 4
  br label %113

113:                                              ; preds = %180, %111
  %114 = load i32, ptr %17, align 4
  %115 = load i32, ptr %13, align 4
  %116 = icmp slt i32 %114, %115
  br i1 %116, label %117, label %183

117:                                              ; preds = %113
  %118 = load ptr, ptr %8, align 8
  %119 = load i32, ptr %14, align 4
  %120 = mul nsw i32 %119, 31
  %121 = load i32, ptr %17, align 4
  %122 = add nsw i32 %120, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i8, ptr %118, i64 %123
  %125 = load i8, ptr %124, align 1
  %126 = sext i8 %125 to i32
  %127 = icmp eq i32 %126, 49
  br i1 %127, label %128, label %139

128:                                              ; preds = %117
  %129 = load ptr, ptr %9, align 8
  %130 = getelementptr inbounds %struct.cells, ptr %129, i32 0, i32 0
  %131 = load i32, ptr %130, align 8
  %132 = load i32, ptr %11, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %11, align 4
  %134 = load ptr, ptr %9, align 8
  %135 = getelementptr inbounds %struct.cells, ptr %134, i32 0, i32 1
  %136 = load i32, ptr %135, align 4
  %137 = load i32, ptr %12, align 4
  %138 = add nsw i32 %137, %136
  store i32 %138, ptr %12, align 4
  br label %139

139:                                              ; preds = %128, %117
  %140 = load ptr, ptr %9, align 8
  %141 = getelementptr inbounds %struct.cells, ptr %140, i32 0, i32 2
  %142 = load ptr, ptr %141, align 8
  %143 = getelementptr inbounds %struct.cells, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = sext i32 %144 to i64
  %146 = load i64, ptr %18, align 8
  %147 = add nsw i64 %145, %146
  %148 = and i64 %147, 1
  %149 = trunc i64 %148 to i32
  %150 = load ptr, ptr %9, align 8
  %151 = getelementptr inbounds %struct.cells, ptr %150, i32 0, i32 0
  store i32 %149, ptr %151, align 8
  %152 = call i64 @lrand48()
  %153 = srem i64 %152, 1000
  %154 = sitofp i64 %153 to double
  %155 = fdiv double %154, 1.000000e+03
  store double %155, ptr %19, align 8
  %156 = load double, ptr %7, align 8
  %157 = load double, ptr %19, align 8
  %158 = fcmp ogt double %156, %157
  br i1 %158, label %159, label %162

159:                                              ; preds = %139
  %160 = load i64, ptr %18, align 8
  %161 = xor i64 %160, 1
  store i64 %161, ptr %18, align 8
  br label %162

162:                                              ; preds = %159, %139
  %163 = load ptr, ptr %9, align 8
  %164 = getelementptr inbounds %struct.cells, ptr %163, i32 0, i32 2
  %165 = load ptr, ptr %164, align 8
  %166 = getelementptr inbounds %struct.cells, ptr %165, i32 0, i32 1
  %167 = load i32, ptr %166, align 4
  %168 = sext i32 %167 to i64
  %169 = load i64, ptr %18, align 8
  %170 = add nsw i64 %168, %169
  %171 = and i64 %170, 1
  %172 = trunc i64 %171 to i32
  %173 = load ptr, ptr %9, align 8
  %174 = getelementptr inbounds %struct.cells, ptr %173, i32 0, i32 1
  store i32 %172, ptr %174, align 4
  %175 = load ptr, ptr %9, align 8
  %176 = getelementptr inbounds %struct.cells, ptr %175, i32 0, i32 2
  %177 = load ptr, ptr %176, align 8
  store ptr %177, ptr %9, align 8
  %178 = load i64, ptr %18, align 8
  %179 = ashr i64 %178, 1
  store i64 %179, ptr %18, align 8
  br label %180

180:                                              ; preds = %162
  %181 = load i32, ptr %17, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, ptr %17, align 4
  br label %113, !llvm.loop !13

183:                                              ; preds = %113
  %184 = call i64 @lrand48()
  store i64 %184, ptr %18, align 8
  %185 = load ptr, ptr %8, align 8
  %186 = load i32, ptr @reg_len, align 4
  %187 = sub nsw i32 %186, 1
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, ptr %185, i64 %188
  %190 = load i8, ptr %189, align 1
  %191 = sext i8 %190 to i32
  %192 = icmp eq i32 %191, 49
  br i1 %192, label %193, label %204

193:                                              ; preds = %183
  %194 = load ptr, ptr %9, align 8
  %195 = getelementptr inbounds %struct.cells, ptr %194, i32 0, i32 0
  %196 = load i32, ptr %195, align 8
  %197 = load i32, ptr %11, align 4
  %198 = add nsw i32 %197, %196
  store i32 %198, ptr %11, align 4
  %199 = load ptr, ptr %9, align 8
  %200 = getelementptr inbounds %struct.cells, ptr %199, i32 0, i32 1
  %201 = load i32, ptr %200, align 4
  %202 = load i32, ptr %12, align 4
  %203 = add nsw i32 %202, %201
  store i32 %203, ptr %12, align 4
  br label %204

204:                                              ; preds = %193, %183
  %205 = load i32, ptr %11, align 4
  %206 = sext i32 %205 to i64
  %207 = load i64, ptr %18, align 8
  %208 = add nsw i64 %206, %207
  %209 = and i64 %208, 1
  %210 = trunc i64 %209 to i32
  %211 = load ptr, ptr %9, align 8
  %212 = getelementptr inbounds %struct.cells, ptr %211, i32 0, i32 0
  store i32 %210, ptr %212, align 8
  %213 = call i64 @lrand48()
  %214 = srem i64 %213, 10000
  %215 = sitofp i64 %214 to double
  %216 = fdiv double %215, 1.000000e+04
  store double %216, ptr %19, align 8
  %217 = load double, ptr %7, align 8
  %218 = load double, ptr %19, align 8
  %219 = fcmp ogt double %217, %218
  br i1 %219, label %220, label %223

220:                                              ; preds = %204
  %221 = load i64, ptr %18, align 8
  %222 = xor i64 %221, 1
  store i64 %222, ptr %18, align 8
  br label %223

223:                                              ; preds = %220, %204
  %224 = load i32, ptr %12, align 4
  %225 = sext i32 %224 to i64
  %226 = load i64, ptr %18, align 8
  %227 = add nsw i64 %225, %226
  %228 = and i64 %227, 1
  %229 = trunc i64 %228 to i32
  %230 = load ptr, ptr %9, align 8
  %231 = getelementptr inbounds %struct.cells, ptr %230, i32 0, i32 1
  store i32 %229, ptr %231, align 4
  %232 = load ptr, ptr %6, align 8
  store ptr %232, ptr %9, align 8
  br label %233

233:                                              ; preds = %223
  %234 = load i32, ptr %15, align 4
  %235 = add nsw i32 %234, 1
  store i32 %235, ptr %15, align 4
  br label %27, !llvm.loop !14

236:                                              ; preds = %27
  store i32 0, ptr %16, align 4
  br label %237

237:                                              ; preds = %254, %236
  %238 = load i32, ptr %16, align 4
  %239 = load i32, ptr @reg_len, align 4
  %240 = icmp slt i32 %238, %239
  br i1 %240, label %241, label %257

241:                                              ; preds = %237
  %242 = load ptr, ptr %9, align 8
  %243 = getelementptr inbounds %struct.cells, ptr %242, i32 0, i32 0
  %244 = load i32, ptr %243, align 8
  %245 = load ptr, ptr %9, align 8
  %246 = getelementptr inbounds %struct.cells, ptr %245, i32 0, i32 1
  %247 = load i32, ptr %246, align 4
  %248 = icmp ne i32 %244, %247
  br i1 %248, label %249, label %250

249:                                              ; preds = %241
  store i32 1, ptr %10, align 4
  br label %250

250:                                              ; preds = %249, %241
  %251 = load ptr, ptr %9, align 8
  %252 = getelementptr inbounds %struct.cells, ptr %251, i32 0, i32 2
  %253 = load ptr, ptr %252, align 8
  store ptr %253, ptr %9, align 8
  br label %254

254:                                              ; preds = %250
  %255 = load i32, ptr %16, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, ptr %16, align 4
  br label %237, !llvm.loop !15

257:                                              ; preds = %237
  %258 = load i32, ptr %10, align 4
  ret i32 %258
}

; Function Attrs: nounwind
declare ptr @__memset_chk(ptr noundef, i32 noundef, i64 noundef, i64 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.objectsize.i64.p0(ptr, i1 immarg, i1 immarg, i1 immarg) #3

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @kill_list(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %7, %1
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.cells, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %3, align 8
  %11 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %11)
  %12 = load ptr, ptr %3, align 8
  store ptr %12, ptr %2, align 8
  br label %4, !llvm.loop !16

13:                                               ; preds = %4
  ret void
}

declare void @free(ptr noundef) #2

declare i64 @lrand48() #2

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind }
attributes #6 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.7"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
