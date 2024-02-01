// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"
#import "StkBundleHelper.h"

#include "StifKarp.h"

class StifKarpDSP : public STKInstrumentDSP {
private:
    stk::StifKarp *stifKarp = nullptr;

public:
    StifKarpDSP() {}
    ~StifKarpDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        auto bundle = [StkBundleHelper moduleBundle];
        auto directoryURL = [bundle.resourceURL URLByAppendingPathComponent:@"rawwaves"];

        stk::Stk::setRawwavePath(directoryURL.fileSystemRepresentation);

        stk::Stk::setSampleRate(sampleRate);
        stifKarp = new stk::StifKarp(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return stifKarp;
    }

    void deinit() override {
        DSPBase::deinit();
        delete stifKarp;
        stifKarp = nullptr;
    }

};

AK_REGISTER_DSP(StifKarpDSP, "stif");
