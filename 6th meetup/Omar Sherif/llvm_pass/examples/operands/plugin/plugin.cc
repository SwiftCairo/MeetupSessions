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
struct OperandsPass : public FunctionPass
{
    static char ID;
    OperandsPass() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F)
    {
        errs() << "Function Called " << F.getName().str() << "\n";
        for (auto &B : F)
        {
            for (auto &I : B)
            {
                if (auto *op = dyn_cast<BinaryOperator>(&I))
                {
                    // Insert at the point where the instruction `op` appears.
                    IRBuilder<> builder(op);

                    // Make a multiply with the same operands as `op`.
                    Value *lhs = op->getOperand(0);
                    Value *rhs = op->getOperand(1);
                    Value *mul = builder.CreateMul(lhs, rhs);
                    //Value *div = builder.CreateExactSDiv(lhs, rhs);

                    // Everywhere the old instruction was used as an operand, use our
                    // new multiply instruction instead.
                    for (auto &U : op->uses())
                    {
                        User *user = U.getUser(); // A User is anything with operands.
                        user->setOperand(U.getOperandNo(), mul);
                    }

                    // We modified the code.
                    return true;
                }
            }
        }
        return false;
    }
};
} // namespace

char OperandsPass::ID = 0;

static RegisterPass<OperandsPass> X("operands", "Operands Pass (Code injection)");

static void registerOperandsPass(const PassManagerBuilder &,
                                 legacy::PassManagerBase &PM)
{
    PM.add(new OperandsPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                   registerOperandsPass);