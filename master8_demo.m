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
