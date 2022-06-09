; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo1() #0 !dbg !7 {
entry:
  call void @foo2(), !dbg !10
  ret void, !dbg !11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo2() #0 !dbg !12 {
entry:
  call void @foo3(), !dbg !13
  ret void, !dbg !14
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo3() #0 !dbg !15 {
entry:
  call void @foo4(), !dbg !16
  %call = call i32 @main(), !dbg !17
  call void @foo2(), !dbg !18
  ret void, !dbg !19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo4() #0 !dbg !20 {
entry:
  call void @foo1(), !dbg !21
  call void @foo2(), !dbg !22
  call void @foo4(), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !25 {
entry:
  call void @foo1(), !dbg !29
  ret i32 0, !dbg !30
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/mnt/d/MTP/Testing")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"Ubuntu clang version 12.0.1-++20211029101322+fed41342a82f-1~exp1~20211029221816.4"}
!7 = distinct !DISubprogram(name: "foo1", scope: !1, file: !1, line: 8, type: !8, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 9, column: 4, scope: !7)
!11 = !DILocation(line: 10, column: 1, scope: !7)
!12 = distinct !DISubprogram(name: "foo2", scope: !1, file: !1, line: 12, type: !8, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 13, column: 4, scope: !12)
!14 = !DILocation(line: 14, column: 1, scope: !12)
!15 = distinct !DISubprogram(name: "foo3", scope: !1, file: !1, line: 16, type: !8, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DILocation(line: 17, column: 4, scope: !15)
!17 = !DILocation(line: 18, column: 4, scope: !15)
!18 = !DILocation(line: 19, column: 4, scope: !15)
!19 = !DILocation(line: 20, column: 1, scope: !15)
!20 = distinct !DISubprogram(name: "foo4", scope: !1, file: !1, line: 22, type: !8, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 23, column: 4, scope: !20)
!22 = !DILocation(line: 24, column: 4, scope: !20)
!23 = !DILocation(line: 25, column: 4, scope: !20)
!24 = !DILocation(line: 26, column: 1, scope: !20)
!25 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 28, type: !26, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!28}
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DILocation(line: 29, column: 4, scope: !25)
!30 = !DILocation(line: 30, column: 1, scope: !25)
