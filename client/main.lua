-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("^6[CLIENT - DEBUG] ^0: "..filename()..".lua gestartet");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

Recorder = {
    IsRecording = false,
}

function Recorder:Main()
    if Config.KeyBind.enable then 
        if IsControlJustPressed(0, Config.KeyBind.key) and GetLastInputMethod(0) then 
            if self.IsRecording then 
                StopRecordingAndSaveClip()
                self.IsRecording = false
            else 
                StartRecording(1)
                self.IsRecording = true
            end
        end
    end 
end 

RegisterCommand(Config.Command, function(source)
    if Config.Command.enable then 
        if Recorder.IsRecording then 
            StopRecordingAndSaveClip()
            Recorder.IsRecording = false
        else 
            StartRecording(1)
            Recorder.IsRecording = true
        end
    else 
        print("Command is diesabled!")
    end 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        Recorder:Main()
    end
end)
