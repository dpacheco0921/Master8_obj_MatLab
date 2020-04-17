%% Demo to connect to master 8

% make obj
obj = master8obj;

% setup channel 5 as train mode
ichannel = 5;
pdur = 5;
pinter = 10;
pnum = 200;
imode = 2;
m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)

% turn channel off
m8_off(obj, ichannel)

%% make pulse train
% setup channel 5 as train mode
ichannel = 5;
% trigger mode 
imode = 2;
% pulses per train
pnum = 2000;

%% pulses at 66Hz
% pulse duration
pdur = 5;
% pulse interval
pinter = 10;

m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)

%% pulses at 50Hz
% pulse duration
pdur = 5;
% pulse interval
pinter = 20;

m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)

%% pulses at 75Hz
% pulse duration
pdur = 5;
% pulse interval
pinter = 13.3333333;

m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)

%% pulses at 90Hz
% pulse duration
pdur = 5;
% pulse interval
pinter = 11.1111;

m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)

%% pulses at 100Hz
% pulse duration
pdur = 2;
% pulse interval
pinter = 10;

m8_setup_channel(...
    obj, ichannel, pdur, pinter, pnum, imode)

% turn channel on / trigger channel
m8_trigger(obj, ichannel)
