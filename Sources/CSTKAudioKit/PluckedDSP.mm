// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"
#import "StkBundleHelper.h"

#include "Plucked.h"

class PluckedDSP : public STKInstrumentDSP {
private:
    stk::Plucked *plucked = nullptr;

public:
    PluckedDSP() {}
    ~PluckedDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        auto bundle = [StkBundleHelper moduleBundle];
        auto directoryURL = [bundle.resourceURL URLByAppendingPathComponent:@"rawwaves"];

        stk::Stk::setRawwavePath(directoryURL.fileSystemRepresentation);

        stk::Stk::setSampleRate(sampleRate);
        plucked = new stk::Plucked(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return plucked;
    }

    void deinit() override {
        DSPBase::deinit();
        delete plucked;
        plucked = nullptr;
    }

};

AK_REGISTER_DSP(PluckedDSP, "plck");
