#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/ADT/iterator_range.h"
#include "llvm/IR/CFG.h"
#include "llvm/ADT/PostOrderIterator.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Transforms/Utils/UnifyFunctionExitNodes.h"
#include "llvm/Analysis/CallGraph.h"
#include <llvm/ADT/DepthFirstIterator.h>
#include <iostream>
#include <vector>
#include <map>
#include "chrono"

using namespace llvm;
using namespace std::chrono;
using namespace std;

std::map<llvm::CallGraphNode *,int> visited;
std::map<llvm::CallGraphNode *,int> Start,End;
std::map<llvm::Function *,int> calledFunctionsCount;
int Time;
int DirectRecursion, IndirectRecursion;

void traverse_dfs(llvm::CallGraphNode* node) {
	// llvm::outs() << "Traverse dfs: " <<node->getFunction()->getName() << "\n";
	visited[node] = 1;
	Start[node] = Time;
	End[node] = INT_MAX;
	Time++;
	for(int i = 0; i<calledFunctionsCount[node->getFunction()]; i++) {
		llvm::CallGraphNode *neighbour = (*node)[i];
		// llvm::outs() << "\t" << neighbour->getFunction()->getName() << "\n";
		if(visited[neighbour] == 0) {
			traverse_dfs(neighbour);
		} else {
			if(visited[neighbour] == 1) {
				if(neighbour == node) {
					DirectRecursion++;
					// llvm::outs() << "\n Direct recursion: " << node->getFunction()->getName() << "-->" << neighbour->getFunction()->getName();
				} else{
					IndirectRecursion++;
					// llvm::outs() << "\n Indirect recursion: " << node->getFunction()->getName() << "-->" << neighbour->getFunction()->getName();
				}
			}
		}
		End[node] = Time;
		Time++;
	}
	visited[node] = 2;
}

void dfs(vector<llvm::CallGraphNode *> Vertices) {
	int n = Vertices.size();
	for(auto node : Vertices) {
		if(node->getFunction()->getName().str() == "main") {
			traverse_dfs(node);
			break;
		}
	}
	llvm::outs() << "\nNumber of Direct recursive calls are: " << DirectRecursion << "\n";
	llvm::outs() << "\nNumber of Indirect recursive calls are: " << IndirectRecursion << "\n";
}

int main(int argc, char **argv){
	if(argc<1){
		std::cout << "Pass IR file as parameter" << std::endl;
		return 1;
	}
	LLVMContext Context;
	SMDiagnostic Error;
	std::unique_ptr<Module> M = parseIRFile(argv[1], Error, Context);
	legacy::FunctionPassManager FPM(M.get());
	Pass *UEN = createUnifyFunctionExitNodesPass();
	FPM.add(UEN);
	for (Function &F : M.get()->functions()) {
    	FPM.run(F);
  	}
	CallGraph CG = CallGraph(*M);
	vector<llvm::CallGraphNode *> Vertices;
	for(Function &F : M.get()->functions()) {
		int count = 0;
		for(BasicBlock &B : F) {
			for(llvm::Instruction &Inst : B) {
				if(llvm::CallInst *CI = dyn_cast<llvm::CallInst>(&Inst)) {
					llvm::Function *target_function = CI->getCalledFunction();
					if(not target_function || target_function->isDeclaration()) {
						continue;
					}
					count++;
				}
			}
		}
		calledFunctionsCount[&F] = count;
		// llvm::outs() << "Call instruction in " << F.getName() << " = " << count << "\n";
	}
	for(auto IT = CG.begin(), EI = CG.end(); IT != EI; IT++) {
		auto temp = IT->first;
		if(not temp) {
			continue;
		}
		visited[IT->second.get()] = 0;
		Vertices.push_back(IT->second.get());
		// llvm::outs() << temp->getName() << "\n";
	}
	// llvm::outs() << "Size of Vertices are: " << Vertices.size() << "\n";
	dfs(Vertices);
	int countBB = 0;
	int countCI = 0;
	int countFunc = 0;
	int countBBPerFunc = 0;
  	for(Function &F : M.get()->functions()){
		countFunc++;
		countBBPerFunc = 0;
		// llvm::outs() << "\nFunction Name: " << F.getName() << " = ";
		for(BasicBlock &B : F){
			countBB++;
			countBBPerFunc++;
			for(llvm::Instruction &Inst : B) {
				if(llvm::CallInst *CI = dyn_cast<llvm::CallInst>(&Inst)) {
					llvm::Function *target_function = CI->getCalledFunction();
					if(target_function && not target_function->isDeclaration()) {
						countCI++;
					}
				}
			}
		}
		// llvm::outs() << countBBPerFunc;
  	}
	  llvm::outs() << "\nNumber of Instruction: " << M->getInstructionCount();
	llvm::outs() << "\nNumber of BB are : " << countBB;
	llvm::outs() << "\nNumber of CI are : " << countCI;
	llvm::outs() << "\nNumber of Functions: " << countFunc;
	llvm::outs() << "\nNumber of BB/Func: " << countBB/countFunc << "\n";
}