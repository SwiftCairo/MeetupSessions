#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/CallSite.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Argument.h"
#include "llvm/IR/IRBuilder.h"

using namespace llvm;

namespace
{
struct CallbackPass : public FunctionPass
{
    static char ID;
    CallbackPass() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F)
    {
        // Get the function to call from our runtime library.
        LLVMContext &Ctx = F.getContext();
        Constant *callbackFunction = F.getParent()->getOrInsertFunction<IntegerType *, IntegerType *, IntegerType *>(
            "passCallbackFunction", Type::getVoidTy(Ctx), Type::getInt32Ty(Ctx), Type::getInt32Ty(Ctx), Type::getInt32Ty(Ctx));

        for (auto &B : F)
        {
            for (auto &I : B)
            {
                if (auto *op = dyn_cast<BinaryOperator>(&I))
                {
                    // Insert *after* `op`.
                    IRBuilder<> builder(op);
                    Value *lhs = op->getOperand(0);
                    Value *rhs = op->getOperand(1);
                    builder.SetInsertPoint(&B, ++builder.GetInsertPoint());

                    // Insert a call to our function.
                    std::vector<Value *> args;
                    args.push_back(lhs);
                    args.push_back(rhs);
                    args.push_back(op);
                    builder.CreateCall(callbackFunction, args);

                    return true;
                }
            }
        }
        return false;
    }
};
} // namespace

char CallbackPass::ID = 0;

static RegisterPass<CallbackPass> X("tracer", "Tracer Pass (Code injection)");

static void registerCallbackPass(const PassManagerBuilder &,
                                 legacy::PassManagerBase &PM)
{
    PM.add(new CallbackPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                   registerCallbackPass);