// Copyright AudioKit. All Rights Reserved.

#import "STKInstrumentDSP.h"
#import "StkBundleHelper.h"

#include "Sitar.h"

class SitarDSP : public STKInstrumentDSP {
private:
    stk::Sitar *sitar = nullptr;

public:
    SitarDSP() {}
    ~SitarDSP() = default;

    void init(int channelCount, double sampleRate) override {
        DSPBase::init(channelCount, sampleRate);

        auto bundle = [StkBundleHelper moduleBundle];
        auto directoryURL = [bundle.resourceURL URLByAppendingPathComponent:@"rawwaves"];

        stk::Stk::setRawwavePath(directoryURL.fileSystemRepresentation);

        stk::Stk::setSampleRate(sampleRate);
        sitar = new stk::Sitar(/*lowestFrequency*/100);
    }

    stk::Instrmnt* getInstrument() override {
        return sitar;
    }

    void deinit() override {
        DSPBase::deinit();
        delete sitar;
        sitar = nullptr;
    }

};

AK_REGISTER_DSP(SitarDSP, "sitr");
