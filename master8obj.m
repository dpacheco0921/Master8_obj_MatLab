classdef master8obj < handle
   
   % obj that sets up the master8-PC controller, with tools to build master8 protocols
   % examples
   % obj = master8obj;
   % % pulse train at 80Hz
   % m8_setup_channel(obj, 4, 0.005, 0.012, [], 1) 
   % m8_trigger(obj, ichannel)
   % m8_off(obj, ichannel)
   % m8_close(obj)
   
   properties
        device
   end
   
   methods (Access='public')
       
        % construct objects
        function obj = master8obj
            % master8obj: create master8 object
            %
            % Usage:
            %   master8obj
            %
            % Notes:
            % info at http://www.ampi.co.il/dl_for_master_8.html
            % download usb driver AmpiLib.Master8 and install that
            
            %Create COM Automation server
            obj.device = actxserver('AmpiLib.Master8');
            
            % check if connection was succesful
            if ~(obj.device.Connect)
                h = errordlg('Can''t connect to Master8!', 'Error');
                uiwait(h); delete(obj.device);
                return;
            end
            
            % Use default paradigm (#2)
            obj.device.ChangeParadigm(2);
            
            % clear current paradigm (#2)
            obj.device.ClearParadigm;
            
            for i = 1:8 % turn all channels off
                obj.device.ChangeChannelMode(i, 0)                
            end
            
        end
        
        function m8_setup_channel(obj, ...
                ichannel, pdur, pinter, pnum, imode)
            % m8_setup_channel: trigger channel on
            %
            % Usage:
            %   m8_setup_channel(obj, ...
            %       ichannel, pdur, pinter, pnum, imode)
            %
            % Args:
            %   obj: master8 object
            %   ichannel: channel to use (1-8)
            %       (1, default)
            %   pdur: pulse duration (ms)
            %       (5, ms, default)
            %   pinter: pulse interval (ms)
            %       (10, ms, default)
            %   pnum: pulse number
            %       (100, default)
            %   imode: channel mode
            %       (0, OFF, default)
            %       (1, FREE-RUN)
            %       (2, TRAIN)
            %       (3, TRIG)
            %       (4, DC)
            %       (5, GATE)
            %
            % Notes:
            % if setup is stuck in error:
            %   press OFF, ALL, ALL, ALL, ENTER
            
            if ~exist('pdur', 'var') || isempty(pdur)
                pdur = 5;
            end
            
            if ~exist('pinter', 'var') || isempty(pinter)
                pinter = 10;
            end
            
            if ~exist('pnum', 'var') || isempty(pnum)
                pnum = 100;
            end
            
            if ~exist('ichannel', 'var') || isempty(ichannel)
                ichannel = 1;
            end
            
            if ~exist('ichannel', 'var') || isempty(ichannel)
                imode = 1;
            end
            
            obj.device.ChangeChannelMode(ichannel, imode);
            obj.device.SetChannelDuration(ichannel, pdur*1e-3);
            obj.device.SetChannelM(ichannel, pnum);
            obj.device.SetChannelInterval(ichannel, pinter*1e-3);
            
            % for trigger SetChannelDelay
            % for connecting channels: ConnectChannel( 8, 1);
            % connect channel 8 to channel 1
            % for disconnecting channels: ConnectChannel( 8, 1);
            % disconnect connection from channel 8 to channel 1
            
        end
        
        function m8_trigger(obj, ichannel)
            % m8_trigger: trigger channel on
            %
            % Usage:
            %   m8_trigger(obj, ichannel)
            %
            % Args:
            %   obj: master8 object
            %   ichannel: channel to use
            obj.device.Trigger(ichannel);
            
        end
        
        function m8_off(obj, ichannel)
            % m8_off: turn channel off
            %
            % Usage:
            %   m8_off(obj, ichannel)
            %
            % Args:
            %   obj: master8 object
            %   ichannel: channel to use
            obj.device.ChangeChannelMode(ichannel, 0);
            
        end
        
        function m8_close(obj)
            % m8_close: close master 8 object
            %
            % Usage:
            %   m8_close(obj)
            %
            % Args:
            %   obj: master8 object
            obj.device.connected = 0;
            delete(obj.device);
            
        end
        
   end
   
end
