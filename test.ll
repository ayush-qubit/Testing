; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global i32* null, align 8, !dbg !0
@b = dso_local global i32 0, align 4, !dbg !6
@c = dso_local global i32** null, align 8, !dbg !9
@d = dso_local global i32*** null, align 8, !dbg !13

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo1() #0 !dbg !20 {
entry:
  %g = alloca i32*, align 8
  %j = alloca i32*, align 8
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %g, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %j, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %p, metadata !27, metadata !DIExpression()), !dbg !28
  call void @foo2(), !dbg !29
  call void @foo1(), !dbg !30
  call void @foo1(), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo2() #0 !dbg !33 {
entry:
  %g = alloca i32*, align 8
  %j = alloca i32*, align 8
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %g, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %j, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %p, metadata !38, metadata !DIExpression()), !dbg !39
  call void @foo3(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo3() #0 !dbg !42 {
entry:
  %g = alloca i32*, align 8
  %j = alloca i32*, align 8
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %g, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32** %j, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %p, metadata !47, metadata !DIExpression()), !dbg !48
  call void @foo4(), !dbg !49
  call void @foo2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo4() #0 !dbg !52 {
entry:
  %g = alloca i32*, align 8
  %j = alloca i32*, align 8
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %g, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32** %j, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %p, metadata !57, metadata !DIExpression()), !dbg !58
  call void @foo1(), !dbg !59
  call void @foo2(), !dbg !60
  call void @foo4(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !63 {
entry:
  %g = alloca i32*, align 8
  %j = alloca i32*, align 8
  %p = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32** %g, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32** %j, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %p, metadata !70, metadata !DIExpression()), !dbg !71
  call void @foo1(), !dbg !72
  ret i32 0, !dbg !73
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 3, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 12.0.1-19ubuntu3", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test.c", directory: "/home/ayush/Desktop/MTP/Testing")
!4 = !{}
!5 = !{!0, !6, !9, !13}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 5, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 6, type: !15, isLocal: false, isDefinition: true)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!20 = distinct !DISubprogram(name: "foo1", scope: !3, file: !3, line: 13, type: !21, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "g", scope: !20, file: !3, line: 14, type: !12)
!24 = !DILocation(line: 14, column: 10, scope: !20)
!25 = !DILocalVariable(name: "j", scope: !20, file: !3, line: 15, type: !12)
!26 = !DILocation(line: 15, column: 10, scope: !20)
!27 = !DILocalVariable(name: "p", scope: !20, file: !3, line: 16, type: !8)
!28 = !DILocation(line: 16, column: 9, scope: !20)
!29 = !DILocation(line: 17, column: 4, scope: !20)
!30 = !DILocation(line: 18, column: 4, scope: !20)
!31 = !DILocation(line: 19, column: 4, scope: !20)
!32 = !DILocation(line: 20, column: 1, scope: !20)
!33 = distinct !DISubprogram(name: "foo2", scope: !3, file: !3, line: 22, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!34 = !DILocalVariable(name: "g", scope: !33, file: !3, line: 23, type: !12)
!35 = !DILocation(line: 23, column: 10, scope: !33)
!36 = !DILocalVariable(name: "j", scope: !33, file: !3, line: 24, type: !12)
!37 = !DILocation(line: 24, column: 10, scope: !33)
!38 = !DILocalVariable(name: "p", scope: !33, file: !3, line: 25, type: !8)
!39 = !DILocation(line: 25, column: 9, scope: !33)
!40 = !DILocation(line: 26, column: 4, scope: !33)
!41 = !DILocation(line: 27, column: 1, scope: !33)
!42 = distinct !DISubprogram(name: "foo3", scope: !3, file: !3, line: 29, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DILocalVariable(name: "g", scope: !42, file: !3, line: 30, type: !12)
!44 = !DILocation(line: 30, column: 10, scope: !42)
!45 = !DILocalVariable(name: "j", scope: !42, file: !3, line: 31, type: !12)
!46 = !DILocation(line: 31, column: 10, scope: !42)
!47 = !DILocalVariable(name: "p", scope: !42, file: !3, line: 32, type: !8)
!48 = !DILocation(line: 32, column: 9, scope: !42)
!49 = !DILocation(line: 33, column: 4, scope: !42)
!50 = !DILocation(line: 34, column: 4, scope: !42)
!51 = !DILocation(line: 35, column: 1, scope: !42)
!52 = distinct !DISubprogram(name: "foo4", scope: !3, file: !3, line: 37, type: !21, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DILocalVariable(name: "g", scope: !52, file: !3, line: 38, type: !12)
!54 = !DILocation(line: 38, column: 10, scope: !52)
!55 = !DILocalVariable(name: "j", scope: !52, file: !3, line: 39, type: !12)
!56 = !DILocation(line: 39, column: 10, scope: !52)
!57 = !DILocalVariable(name: "p", scope: !52, file: !3, line: 40, type: !8)
!58 = !DILocation(line: 40, column: 9, scope: !52)
!59 = !DILocation(line: 41, column: 4, scope: !52)
!60 = !DILocation(line: 42, column: 4, scope: !52)
!61 = !DILocation(line: 43, column: 4, scope: !52)
!62 = !DILocation(line: 44, column: 1, scope: !52)
!63 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 46, type: !64, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!8}
!66 = !DILocalVariable(name: "g", scope: !63, file: !3, line: 47, type: !12)
!67 = !DILocation(line: 47, column: 10, scope: !63)
!68 = !DILocalVariable(name: "j", scope: !63, file: !3, line: 48, type: !12)
!69 = !DILocation(line: 48, column: 10, scope: !63)
!70 = !DILocalVariable(name: "p", scope: !63, file: !3, line: 49, type: !8)
!71 = !DILocation(line: 49, column: 9, scope: !63)
!72 = !DILocation(line: 50, column: 4, scope: !63)
!73 = !DILocation(line: 51, column: 1, scope: !63)
