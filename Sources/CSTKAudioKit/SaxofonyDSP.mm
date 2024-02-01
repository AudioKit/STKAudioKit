// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"
#import "StkBundleHelper.h"

#include "Saxofony.h"

class SaxofonyDSP : public STKInstrumentDSP {
private:
    stk::Saxofony *saxofony = nullptr;

public:
    SaxofonyDSP() {}
    ~SaxofonyDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        auto bundle = [StkBundleHelper moduleBundle];
        auto directoryURL = [bundle.resourceURL URLByAppendingPathComponent:@"rawwaves"];

        stk::Stk::setRawwavePath(directoryURL.fileSystemRepresentation);

        stk::Stk::setSampleRate(sampleRate);
        saxofony = new stk::Saxofony(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return saxofony;
    }

    void deinit() override {
        DSPBase::deinit();
        delete saxofony;
        saxofony = nullptr;
    }

};

AK_REGISTER_DSP(SaxofonyDSP, "saxf");
