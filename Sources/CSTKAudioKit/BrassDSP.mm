// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"

#include "Brass.h"

class BrassDSP : public STKInstrumentDSP {
private:
    stk::Brass *brass = nullptr;

public:
    BrassDSP() {}
    ~BrassDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        stk::Stk::setSampleRate(sampleRate);
        brass = new stk::Brass(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return brass;
    }

    void deinit() override {
        DSPBase::deinit();
        delete brass;
        brass = nullptr;
    }

};

AK_REGISTER_DSP(BrassDSP, "bras");
