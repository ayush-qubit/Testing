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
#include "VascoAbstraction/Analysis.h"
#include <iostream>

using namespace llvm;

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
  	for(Function &F : M.get()->functions()){
  		for(BasicBlock &B : F){
  			for(Instruction &I : B){
  				// if(CallInst *inst = dyn_cast<CallInst>(&I)){
  				// 	Function *F = inst->getCalledFunction();
  				// 	outs() << F->getName() << " : ";
  				// 	outs() << F->isDeclaration() << "\n";
  				// }
				if(StoreInst *inst = dyn_cast<StoreInst>(&I)){
					Value *val = inst->getValueOperand();
					if(isa<Constant>(val)){
						outs() << I << "\n";
						// outs() << val->getName() << "\n";
					}
				}
  			}
  		}
  	}
}