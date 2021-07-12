; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = dso_local global i32 10, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %y = alloca float, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata float* %y, metadata !14, metadata !DIExpression()), !dbg !16
  store float 2.050000e+01, float* %y, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !17, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %p, align 8, !dbg !19
  %0 = bitcast float* %y to i32*, !dbg !20
  store i32* %0, i32** %p, align 8, !dbg !21
  ret i32 0, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9}
!llvm.ident = !{!10}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "x", scope: !2, file: !3, line: 3, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.1-++20210630032618+fed41342a82f-1~exp1~20210630133332.127", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test.c", directory: "/mnt/d/College/Testing")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{!"Ubuntu clang version 12.0.1-++20210630032618+fed41342a82f-1~exp1~20210630133332.127"}
!11 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 9, type: !12, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!12 = !DISubroutineType(types: !13)
!13 = !{!6}
!14 = !DILocalVariable(name: "y", scope: !11, file: !3, line: 10, type: !15)
!15 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!16 = !DILocation(line: 10, column: 8, scope: !11)
!17 = !DILocalVariable(name: "p", scope: !11, file: !3, line: 11, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!19 = !DILocation(line: 11, column: 7, scope: !11)
!20 = !DILocation(line: 12, column: 4, scope: !11)
!21 = !DILocation(line: 12, column: 3, scope: !11)
!22 = !DILocation(line: 15, column: 2, scope: !11)
