// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"
#import "StkBundleHelper.h"

#include "BlowHole.h"

class BlowHoleDSP : public STKInstrumentDSP {
private:
    stk::BlowHole *blowHole = nullptr;

public:
    BlowHoleDSP() {}
    ~BlowHoleDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        auto bundle = [StkBundleHelper moduleBundle];
        auto directoryURL = [bundle.resourceURL URLByAppendingPathComponent:@"rawwaves"];

        stk::Stk::setRawwavePath(directoryURL.fileSystemRepresentation);

        stk::Stk::setSampleRate(sampleRate);
        blowHole = new stk::BlowHole(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return blowHole;
    }

    void deinit() override {
        DSPBase::deinit();
        delete blowHole;
        blowHole = nullptr;
    }

};

AK_REGISTER_DSP(BlowHoleDSP, "blwh");
