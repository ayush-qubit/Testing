; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo1() #0 !dbg !7 {
entry:
  call void @foo2(), !dbg !10
  call void @foo1(), !dbg !11
  call void @foo1(), !dbg !12
  ret void, !dbg !13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo2() #0 !dbg !14 {
entry:
  call void @foo3(), !dbg !15
  ret void, !dbg !16
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo3() #0 !dbg !17 {
entry:
  call void @foo4(), !dbg !18
  call void @foo2(), !dbg !19
  %call = call i32 @main(), !dbg !20
  ret void, !dbg !21
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo4() #0 !dbg !22 {
entry:
  call void @foo1(), !dbg !23
  call void @foo2(), !dbg !24
  call void @foo4(), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  call void @foo1(), !dbg !31
  ret i32 0, !dbg !32
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
!11 = !DILocation(line: 10, column: 4, scope: !7)
!12 = !DILocation(line: 11, column: 4, scope: !7)
!13 = !DILocation(line: 12, column: 1, scope: !7)
!14 = distinct !DISubprogram(name: "foo2", scope: !1, file: !1, line: 14, type: !8, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DILocation(line: 15, column: 4, scope: !14)
!16 = !DILocation(line: 16, column: 1, scope: !14)
!17 = distinct !DISubprogram(name: "foo3", scope: !1, file: !1, line: 18, type: !8, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DILocation(line: 19, column: 4, scope: !17)
!19 = !DILocation(line: 20, column: 4, scope: !17)
!20 = !DILocation(line: 21, column: 4, scope: !17)
!21 = !DILocation(line: 22, column: 1, scope: !17)
!22 = distinct !DISubprogram(name: "foo4", scope: !1, file: !1, line: 24, type: !8, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 25, column: 4, scope: !22)
!24 = !DILocation(line: 26, column: 4, scope: !22)
!25 = !DILocation(line: 27, column: 4, scope: !22)
!26 = !DILocation(line: 28, column: 1, scope: !22)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 30, type: !28, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 31, column: 4, scope: !27)
!32 = !DILocation(line: 32, column: 1, scope: !27)
