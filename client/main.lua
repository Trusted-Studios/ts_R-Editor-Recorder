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
    isRecording = false,
}

if Config.KeyBind then
    RegisterKeyMapping('Trusted:Record', 'Start / Stop a R* Editor Recording.', 'keyboard', Config.KeyBind)

    RegisterCommand('Trusted:Record', function()
        Recorder:Handle()
    end, false)
end

if Config.Command then
    RegisterCommand(Config.Command, function()
        Recorder:Handle()
    end, false)
end

function Recorder:Handle()
    if self.isRecording then
        StopRecordingAndSaveClip()
    end

    if not self.isRecording then
        StartRecording(1)
    end

    self.IsRecording = not self.IsRecording
end

