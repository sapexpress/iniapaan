--==================================================--
-- Eryx Hub (Final Version - All Features) --
--==================================================--
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/free-to-use-lib/fyoumom/refs/heads/main/libxyz.luau.txt"))()
local HttpService = game:GetService("HttpService")
local KEY_FILENAME = "SAP Express.txt"

local function CreateMainWindow()
    local Window = Library:Window({
        Title = "Eryx Hub",
        Desc = "Version 3.2 (Atin Separated)",
        Icon = 105059922903197,
        Theme = "Dark",
        Config = {
            Keybind = Enum.KeyCode.LeftControl,
            Size = UDim2.new(0, 500, 0, 400)
        },
        CloseUIButton = {
            Enabled = true,
            Text = "Eryx Hub"
        }
    })

    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TeleportService = game:GetService("TeleportService")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer
    local humanoid, rootPart

    local function setupCharacter(char)
        humanoid = char:WaitForChild("Humanoid")
        rootPart = char:WaitForChild("HumanoidRootPart")
    end

    if LocalPlayer.Character then
        setupCharacter(LocalPlayer.Character)
    end
    LocalPlayer.CharacterAdded:Connect(setupCharacter)

    -- Rute-rute Gunung
    local pos_atin = CFrame.new(625.06, 1799.43, 3432.93)
    local pos_puncak_atin = CFrame.new(749.46, 2189.88, 3927.45)
    local agungRoute = {CFrame.new(1400.49, 3435.22, -7859.17)}
    local hanamiRoute = {CFrame.new(513.72, 141.57, -120.25), CFrame.new(359.57, 195.92, -613.37), CFrame.new(-92.93, 170.01, -488.17), CFrame.new(-933.30, 345.63, -511.54), CFrame.new(-1278.80, 477.94, -329.37), CFrame.new(-1977.21, 609.77, 133.88), CFrame.new(-2765.56, 669.56, 43.87), CFrame.new(-2451.31, 850.79, -457.65), CFrame.new(-2393.55, 120.47, -1230.02), CFrame.new(-1876.65, 254.49, -2037.80), CFrame.new(-3589.37, 438.63, -2402.13), CFrame.new(-2652.29, 686.75, -2232.17), CFrame.new(-1992.56, 682.43, -2228.34), CFrame.new(-1860.82, 1048.52, -2719.13)}
    local htsRoute = {CFrame.new(159.98, 325.22, 375.79), CFrame.new(402.30, 393.22, 281.85), CFrame.new(661.97, 516.72, 86.77), CFrame.new(453.18, 733.22, -139.85), CFrame.new(51.32, 857.22, -331.54), CFrame.new(-244.83, 857.82, -148.34), CFrame.new(-425.18, 1069.82, 216.35)}
    local hanaRoute = {CFrame.new(921.97, 102.37, -261.80), CFrame.new(940.24, 274.99, 151.03), CFrame.new(669.33, 288.80, 425.19), CFrame.new(711.77, 278.89, -287.92), CFrame.new(263.26, 461.22, -805.14), CFrame.new(-97.35, 499.24, -908.04), CFrame.new(-177.50, 714.76, -1071.74), CFrame.new(-275.58, 767.17, -505.33), CFrame.new(-482.44, 903.83, -555.97), CFrame.new(-703.43, 957.51, -1011.22), CFrame.new(-514.81, 1076.96, -429.91), CFrame.new(-537.52, 1161.14, -118.32), CFrame.new(-374.64, 1425.22, 292.26), CFrame.new(-366.33, 1409.22, 815.56), CFrame.new(-157.35, 1388.50, 1299.49), CFrame.new(-456.36, 1407.17, 916.85), CFrame.new(-796.35, 1408.36, 996.97), CFrame.new(-811.02, 1404.35, 896.50), CFrame.new(-744.37, 1424.82, 283.40), CFrame.new(-854.50, 1505.22, 202.29), CFrame.new(-912.22, 1728.98, 141.14)}
    local merapiRoute = {CFrame.new(-2063.33, 1868.96, -277.41)}
    local lembayanaRoute = {CFrame.new(598.91, 266.93, 516.95), CFrame.new(-23428.99, 6353.21, -6907.18)}
    local sibuatanRoute = {CFrame.new(5380.16, 8110.48, 2172.50)}
    local sumbingRoute = {CFrame.new(-228.47, 441.22, 2141.94), CFrame.new(-429.00, 849.22, 3204.14), CFrame.new(43.36, 1269.22, 4042.72), CFrame.new(-1144.18, 1553.22, 4900.20), CFrame.new(-852.65, 1574.59, 4927.80), CFrame.new(-418.29, 1744.95, 5151.65), CFrame.new(-898.46, 1945.03, 5345.84)}
    local hellExpeditionRoute = {CFrame.new(-101.77, 201.33, 272.12), CFrame.new(154.01, 249.27, 423.85), CFrame.new(483.71, 353.56, 311.43), CFrame.new(526.74, 413.34, -316.19), CFrame.new(-226.93, 541.50, -756.92), CFrame.new(-653.02, 541.28, -652.21), CFrame.new(-817.85, 434.36, 442.52), CFrame.new(-319.56, 409.66, 656.21), CFrame.new(346.27, 329.64, 715.82), CFrame.new(807.44, 637.57, 863.60), CFrame.new(1253.30, 825.64, 394.75), CFrame.new(1509.20, 1193.58, 17.68), CFrame.new(999.58, 1193.45, -58.46), CFrame.new(-1512.97, 1873.99, -72.03)}
    local fantasyRoute = {CFrame.new(-998.74, 1519.23, 1462.40)}
    local mountJawaRoute = {CFrame.new(269.44, 314.34, -290.37), CFrame.new(153.19, 202.34, -900.20), CFrame.new(462.85, 294.58, -614.94), CFrame.new(-410.08, 22.39, 523.97), CFrame.new(-280.16, 585.63, -433.55)}
    local yeudehRoute = {CFrame.new(2875.06, 1166.21, -2720.59), CFrame.new(3528.56, 634.21, -2713.99), CFrame.new(15411.11, 1778.16, -2263.71), CFrame.new(16258.12, 1910.16, -2308.35)}
    local apasihRoute = {CFrame.new(-435.15, 100.49, -561.24), CFrame.new(-1040.31, 58.98, -591.07), CFrame.new(-1400.30, 200.39, -395.54), CFrame.new(-1544.92, 434.91, -310.87), CFrame.new(-2135.37, 691.28, 1049.06), CFrame.new(-1873.04, 736.59, 1282.50), CFrame.new(-1345.26, 803.94, 1147.06), CFrame.new(-1262.68, 902.99, 1188.86), CFrame.new(-2145.57, 999.86, 1621.48), CFrame.new(-2374.71, 1180.53, 1433.01), CFrame.new(-2571.97, 1184.07, 1737.25), CFrame.new(-2011.88, 1235.63, 1972.79), CFrame.new(-1695.80, 1424.13, 2389.00), CFrame.new(-2041.72, 1423.89, 2864.74), CFrame.new(-3131.01, 1958.44, 2976.84), CFrame.new(-3096.33, 1957.82, 3018.61)}
    local phoenixRoute = {CFrame.new(-906.57, 997.22, 229.97)}
    local taranjangRoute = {CFrame.new(8718.81, 1637.82, 1342.16)}
    local yareuRoute = {CFrame.new(-123.62, 127.25, -51.78), CFrame.new(-170.93, 161.23, 498.32), CFrame.new(-217.94, 100.94, 753.77), CFrame.new(-664.87, 317.22, 976.73), CFrame.new(-892.39, 452.71, 1065.03), CFrame.new(-1124.45, 529.22, 1055.30), CFrame.new(-1140.67, 527.22, 1305.97), CFrame.new(-1169.52, 517.22, 1841.35), CFrame.new(-870.69, 696.47, 1809.99), CFrame.new(-865.48, 812.59, 1780.72)}
    local nerakaJourneyRoute = {CFrame.new(529.47, 154.59, -48.18), CFrame.new(1241.36, 110.49, -0.17), CFrame.new(1273.04, 170.17, 406.89), CFrame.new(842.03, 157.09, 757.58), CFrame.new(851.46, 157.11, 1620.01), CFrame.new(1349.84, 212.96, 1464.73), CFrame.new(1601.93, 177.17, 1453.21), CFrame.new(1576.26, 161.28, 1290.81), CFrame.new(1354.48, 201.22, 1094.15), CFrame.new(1539.27, 170.17, 355.53), CFrame.new(1582.12, 207.89, -99.68), CFrame.new(1838.88, 207.73, -36.60), CFrame.new(2022.46, 207.48, 64.04), CFrame.new(2646.97, 209.55, 153.76), CFrame.new(3439.90, 212.08, 428.56), CFrame.new(4322.81, 210.84, -803.39), CFrame.new(4470.96, 214.18, -1292.91), CFrame.new(4190.60, 181.60, -2389.22), CFrame.new(4432.82, 256.39, -2377.77), CFrame.new(4876.73, 257.66, -2221.01), CFrame.new(5111.71, 258.03, -2433.01), CFrame.new(5636.39, 257.58, -2511.40), CFrame.new(5600.04, 334.64, -2380.90), CFrame.new(5673.18, 343.64, -2433.21), CFrame.new(5861.53, 372.85, -2396.55), CFrame.new(6749.98, 505.12, -2335.01)}
    local sakahayangRoute = {CFrame.new(-917.77, 3144.39, 560.21), CFrame.new(-920.17, 3144.22, 540.86)}
    local kawahTerjunRoute = {CFrame.new(79.45, -234.77, 215.17)}
    local bayiiRoute = {CFrame.new(-366.14, 63.22, 45.45), CFrame.new(-727.98, 115.22, 98.84), CFrame.new(-851.05, 108.74, -36.75), CFrame.new(-969.45, 272.25, -50.11), CFrame.new(-1409.57, 251.22, 1501.32), CFrame.new(-1407.82, 400.07, 1629.71)}

    -- [[ TABEL KONFIGURASI GUNUNG (KECUALI ATIN) ]]
    local AllMountsConfig = {
        ["Agung"] = {Route = agungRoute, Delay = 5, EndAction = "kill", PostDelay = 5},
        ["Apasih"] = {Route = apasihRoute, Delay = 5, EndAction = "kill", PostDelay = 5},
        ["Bayii"] = {Route = bayiiRoute, Delay = 10, EndAction = "kill", PostDelay = 5},
        ["Fantasy"] = {Route = fantasyRoute, Delay = 0, EndAction = "kill", PostDelay = 8},
        ["Hana (Tween)"] = {Route = hanaRoute, Delay = 8, EndAction = "kill", PostDelay = 5, Func = startSmoothWalkLoop},
        ["Hanami"] = {Route = hanamiRoute, Delay = 3, EndAction = "kill", PostDelay = 3},
        ["Hell Expedition"] = {Route = hellExpeditionRoute, Delay = 8, EndAction = nil, PostDelay = 0},
        ["HTS"] = {Route = htsRoute, Delay = 0.5, EndAction = "kill", PostDelay = 0.5},
        ["Jawa"] = {Route = mountJawaRoute, Delay = 8, EndAction = "kill", PostDelay = 8},
        ["Kawah Terjun (ServerHop)"] = {Route = kawahTerjunRoute, Delay = 1.5, EndAction = "serverhop", PostDelay = 8},
        ["Lembayana"] = {Route = lembayanaRoute, Delay = 1, EndAction = "kill", PostDelay = 5},
        ["Merapi (ServerHop)"] = {Route = merapiRoute, Delay = 10, EndAction = "serverhop", PostDelay = 0},
        ["Neraka Journey (Loop)"] = {Route = nerakaJourneyRoute, Delay = 24, EndAction = "loop", PostDelay = nil},
        ["Phoenix"] = {Route = phoenixRoute, Delay = 3, EndAction = "kill", PostDelay = 1},
        ["Sakahayang"] = {Route = sakahayangRoute, Delay = 5, EndAction = "kill", PostDelay = 2},
        ["Sibuatan (ServerHop)"] = {Route = sibuatanRoute, Delay = 0, EndAction = "serverhop", PostDelay = 10},
        ["Sumbing"] = {Route = sumbingRoute, Delay = 10, EndAction = "kill", PostDelay = 10},
        ["Taranjang"] = {Route = taranjangRoute, Delay = 0.5, EndAction = "kill", PostDelay = 1},
        ["Yareu"] = {Route = yareuRoute, Delay = 8, EndAction = "kill", PostDelay = 0.5},
        ["Yeudeh"] = {Route = yeudehRoute, Delay = 8, EndAction = "kill", PostDelay = 5},
    }
    
    --================== AUTO WALK "MOUNT DAUN" (JSON PLAYER) ==================--
-- Taruh blok ini setelah AllMountsConfig / sebelum pembuatan UI tabs juga oke

-- Flag & state
local isDaunAutoActive = false
local daunConn = nil
local daunData = nil  -- { list = { {t=.., pos=Vector3, yaw=..}, ... }, duration = number }
local daunIdx = 1
local daunStartTime = 0
local daunSpeed = 1.0
local daunUrlDefault = "https://raw.githubusercontent.com/sapexpress/iniapaan/refs/heads/main/leafhere.luau"

-- Helper sudut & interpolasi
local function lerpAngle(a, b, alpha)
    local diff = (b - a + math.pi) % (2*math.pi) - math.pi
    return a + diff * alpha
end
local function yawFromAB(a, b)
    local d = b - a
    if d.Magnitude < 1e-6 then return 0 end
    -- yaw = heading di bidang XZ
    return math.atan2(d.X, d.Z)
end

-- Parser JSON jalur → list sampel homogen {t,pos,yaw}, wajib terurut
local function loadJsonSamples(url)
    local raw
    local ok, err = pcall(function()
        raw = game:HttpGet(url)
    end)
    if not ok then
        return nil, "HttpGet gagal: " .. tostring(err)
    end

    local obj
    ok, err = pcall(function()
        obj = HttpService:JSONDecode(raw)
    end)
    if not ok then
        return nil, "JSONDecode gagal: " .. tostring(err)
    end

    -- Deteksi skema: {samples=[{t,x,y,z,yaw}]}, atau array titik, dll.
    local samples = (type(obj) == "table" and (obj.samples or obj.points)) or obj
    if type(samples) ~= "table" then
        return nil, "Format JSON tidak dikenali (butuh 'samples' atau array)."
    end

    local hz = tonumber(obj and obj.hz) or tonumber(obj and obj.rate) -- opsional
    local dtDefault = hz and (1 / math.max(1, hz)) or 0.05 -- fallback 20Hz

    local list = {}
    local tCursor = 0
    local prevPos = nil
    for i, s in ipairs(samples) do
        local t, x, y, z, yaw

        if type(s) == "table" then
            if s.x ~= nil and s.y ~= nil and s.z ~= nil then
                x, y, z = tonumber(s.x), tonumber(s.y), tonumber(s.z)
                t = tonumber(s.t)
                yaw = s.yaw and tonumber(s.yaw) or nil
            elseif s[1] and s[2] and s[3] then
                -- bentuk array {x,y,z} / {x,y,z,t,yaw}
                x, y, z = tonumber(s[1]), tonumber(s[2]), tonumber(s[3])
                t = tonumber(s[4])
                yaw = s[5] and tonumber(s[5]) or nil
            end
        end

        if not (x and y and z) then
            return nil, ("Sampel #%d tidak punya x/y/z"):format(i)
        end
        local pos = Vector3.new(x, y, z)

        if not t then
            t = tCursor
            tCursor = tCursor + dtDefault
        else
            tCursor = t -- sinkronkan cursor
        end

        if not yaw then
            if prevPos then
                yaw = yawFromAB(prevPos, pos)
            else
                yaw = 0
            end
        end
        prevPos = pos

        table.insert(list, { t = t, pos = pos, yaw = yaw })
    end

    table.sort(list, function(a,b) return a.t < b.t end)
    local duration = (#list > 0) and list[#list].t or 0
    return { list = list, duration = duration }, nil
end

-- Sampler O(1) amortized pakai pointer daunIdx
local function daunSampleAt(tnow)
    local data = daunData and daunData.list
    if not data or #data == 0 then return nil end
    local n = #data
    if n == 1 or tnow <= data[1].t then
        return data[1].pos, data[1].yaw
    end
    if tnow >= data[n].t then
        return data[n].pos, data[n].yaw
    end
    while daunIdx < n and data[daunIdx + 1].t < tnow do
        daunIdx += 1
    end
    local a = data[daunIdx]
    local b = data[daunIdx + 1]
    local span = b.t - a.t
    local alpha = (span > 1e-6) and ((tnow - a.t) / span) or 0
    local pos = a.pos:Lerp(b.pos, alpha)
    local yaw = lerpAngle(a.yaw, b.yaw, alpha)
    return pos, yaw
end

local function stopDaunAuto()
    if not isDaunAutoActive then return end
    isDaunAutoActive = false
    if daunConn then daunConn:Disconnect(); daunConn = nil end
    -- pulihkan autorotate
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then hum.AutoRotate = true end
    Window:Notify({Title="Mount Daun (JSON)", Desc="Dihentikan.", Time=3})
end

local function startDaunAuto(url, speed)
    -- hentikan proses lain biar gak tabrakan
    stopAutoWalkAtin()
    stopAutoFarmLoop()
    stopDaunAuto()

    speed = tonumber(speed) or 1.0
    if speed <= 0 then speed = 1.0 end

    local parsed, msg = loadJsonSamples(url)
    if not parsed then
        Window:Notify({Title="Mount Daun (JSON)", Desc="Load JSON gagal: "..tostring(msg), Time=6})
        return
    end
    daunData = parsed
    daunIdx = 1
    daunSpeed = speed

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    -- Mulai dari titik pertama biar gak ‘nyentak’
    if daunData.list[1] then
        hrp.CFrame = CFrame.new(daunData.list[1].pos) * CFrame.Angles(0, daunData.list[1].yaw or 0, 0)
    end

    hum.AutoRotate = false
    daunStartTime = time()
    isDaunAutoActive = true

    daunConn = RunService.RenderStepped:Connect(function()
        if not isDaunAutoActive then return end
        if not hrp or not hrp.Parent then
            stopDaunAuto()
            return
        end
        local elapsed = (time() - daunStartTime) * daunSpeed
        local lastT = daunData.duration or 0
        local pos, yaw = daunSampleAt(elapsed)
        if not pos then return end

        -- nolkan momentum
        if hrp.AssemblyLinearVelocity then hrp.AssemblyLinearVelocity = Vector3.new(0,0,0) end
        if hrp.AssemblyAngularVelocity then hrp.AssemblyAngularVelocity = Vector3.new(0,0,0) end

        hrp.CFrame = CFrame.new(pos) * CFrame.Angles(0, yaw or 0, 0)

        if elapsed >= lastT then
            stopDaunAuto()
        end
    end)

    Window:Notify({Title="Mount Daun (JSON)", Desc="Dimulai. Playback x"..string.format("%.1f", daunSpeed), Time=4})
end


    -- Definisi Tab Utama
    local AutoWalkTab = Window:Tab({Title = "Auto Walk", Icon = "star"})
    local MainTab = Window:Tab({Title = "Player", Icon = "user"})
    local VisualTab = Window:Tab({Title = "Visual", Icon = "sun"})
    local ProteksiTab = Window:Tab({Title = "Proteksi", Icon = "shield"})
    local MiscTab = Window:Tab({Title = "Misc", Icon = "settings"})
    local SocialTab = Window:Tab({Title = "Social", Icon = "link"})

    -- Variabel Global
    local isAutoWalkingAtin = false
    local isAutoFarmActive = false
    local currentFarmName = ""

    -- [[ LOGIKA AUTO-HEAL ]]
    local isAutoHealToggledOn = false
    local autoHealConnection = nil
    local function activateAutoHeal()
        if isAutoHealToggledOn and not autoHealConnection then
            autoHealConnection = RunService.Heartbeat:Connect(function()
                if humanoid and humanoid.Health < humanoid.MaxHealth then
                    humanoid.Health = humanoid.MaxHealth
                end
            end)
        end
    end
    local function deactivateAutoHeal()
        if autoHealConnection then
            autoHealConnection:Disconnect()
            autoHealConnection = nil
        end
    end

    -- Fungsi-Fungsi Utama
    local function genericServerHop(farmName)
        Window:Notify({Title = farmName, Desc = "Pindah ke server baru...", Time = 3})
        task.wait(1)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end

    local function waitForNotification(textToFind)
        local confirmed = false
        local startTime = tick()
        local upperFind = string.upper(textToFind or "")
        while isAutoWalkingAtin and not confirmed and (tick() - startTime < 30) do
            for _, guiObject in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
                if guiObject:IsA("TextLabel") and guiObject.Visible and guiObject.Text then
                    local txt = string.upper(tostring(guiObject.Text))
                    if string.find(txt, upperFind) then confirmed = true; break end
                end
            end
            if confirmed then break end
            task.wait(0.5)
        end
        if not confirmed and isAutoWalkingAtin then
            Window:Notify({Title = "Auto Mount Atin", Desc = "Timeout: Notifikasi tidak ditemukan.", Time = 5})
        end
        return confirmed
    end

    local function stopAutoWalkAtin()
        if isAutoWalkingAtin then
            isAutoWalkingAtin = false
            Window:Notify({Title = "Auto Mount Atin", Desc = "Proses dihentikan.", Time = 3})
        end
    end

    local function startAutoWalkAtin()
        task.spawn(function()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            hrp.CFrame = pos_atin
            Window:Notify({Title = "Auto Mount Atin", Desc = "Teleport ke Pos 26...", Time = 4})
            local foundPos26 = waitForNotification("POS 26 REACHED")
            if not isAutoWalkingAtin or not foundPos26 then stopAutoWalkAtin(); return end
            Window:Notify({Title = "Auto Mount Atin", Desc = "Pos 26 terdeteksi! Teleport ke Puncak...", Time = 4})
            hrp.CFrame = pos_puncak_atin
            local foundPuncak = waitForNotification("PUNCAK TERCAPAI")
            if not isAutoWalkingAtin or not foundPuncak then stopAutoWalkAtin(); return end
            Window:Notify({Title = "Auto Mount Atin", Desc = "Puncak terdeteksi! Melakukan server hop...", Time = 4})
            genericServerHop("Auto Mount Atin")
        end)
    end

    local function stopAutoFarmLoop()
        if isAutoFarmActive then
            isAutoFarmActive = false
            deactivateAutoHeal()
            if humanoid and rootPart then
                humanoid:MoveTo(rootPart.Position)
            end
            Window:Notify({Title = currentFarmName, Desc = "Proses dihentikan.", Time = 2})
        end
    end

    local function startAutoFarmLoop(route, delay, farmName, endAction, postLoopDelay)
        isAutoFarmActive = true
        currentFarmName = farmName
        task.spawn(function()
            while isAutoFarmActive do
                activateAutoHeal()
                for i, destination in ipairs(route) do
                    if not isAutoFarmActive then break end
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    local hrp = char:WaitForChild("HumanoidRootPart")
                    Window:Notify({Title = farmName, Desc = "Bergerak ke Checkpoint " .. tostring(i), Time = delay})
                    hrp.CFrame = destination
                    task.wait(delay)
                end
                if not isAutoFarmActive then break end
                if endAction == "loop" then
                    Window:Notify({Title=farmName, Desc="Rute selesai, mengulang...", Time=3})
                else
                    task.wait(postLoopDelay or 0)
                    if not isAutoFarmActive then break end
                    deactivateAutoHeal()
                    if endAction == "kill" then
                        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                        char:WaitForChild("Humanoid").Health = 0
                    elseif endAction == "serverhop" then
                        genericServerHop(farmName)
                        isAutoFarmActive = false
                        break
                    else
                        isAutoFarmActive = false
                        Window:Notify({Title = farmName, Desc = "Rute selesai.", Time = 3})
                        break
                    end
                end
            end
            deactivateAutoHeal()
        end)
    end

    local function startSmoothWalkLoop(route, travelTime, farmName, endAction, postLoopDelay)
        isAutoFarmActive = true
        currentFarmName = farmName
        task.spawn(function()
            while isAutoFarmActive do
                activateAutoHeal()
                local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local hrp = char:WaitForChild("HumanoidRootPart")
                hrp.CFrame = route[1]
                task.wait(1)
                for i = 2, #route do
                    if not isAutoFarmActive then break end
                    local endPoint = route[i]
                    local tweenInfo = TweenInfo.new(travelTime, Enum.EasingStyle.Linear)
                    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = endPoint})
                    Window:Notify({Title = farmName, Desc = "Bergerak ke Checkpoint " .. tostring(i), Time = travelTime})
                    tween:Play()
                    tween.Completed:Wait()
                end
                if not isAutoFarmActive then break end
                task.wait(postLoopDelay or 0)
                if not isAutoFarmActive then break end
                deactivateAutoHeal()
                if endAction == "kill" then
                    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                    char:WaitForChild("Humanoid").Health = 0
                end
            end
            deactivateAutoHeal()
        end)
    end

    -- [[ UI Auto Walk BARU ]]
    AutoWalkTab:Toggle({
        Title = "Mulai Auto Mount Atin",
        Value = false,
        Callback = function(v)
            if v then
                stopAutoFarmLoop()
                isAutoWalkingAtin = true
                startAutoWalkAtin()
            else
                stopAutoWalkAtin()
            end
        end
    })
    
AutoWalkTab:Slider({
    Title = "Playback Speed (x0.1)",
    Min = 1, Max = 50, Value = daunSpeedSlider,
    Callback = function(v)
        daunSpeedSlider = math.clamp(tonumber(v) or 10, 1, 50)
    end
})

AutoWalkTab:Toggle({
    Title = "Mulai Auto Walk Mount Daun (JSON)",
    Value = false,
    Callback = function(on)
        if on then
            local spd = (tonumber(daunSpeedSlider) or 10) / 10
            startDaunAuto(daunUrlInput, spd)
        else
            stopDaunAuto()
        end
    end
})

AutoWalkTab:Button({
    Title = "Stop",
    Callback = function()
        stopDaunAuto()
    end
})


    local selectedMount = nil
    local mountNames = {}
    for name, _ in pairs(AllMountsConfig) do
        table.insert(mountNames, name)
    end
    table.sort(mountNames)

    AutoWalkTab:Dropdown({
        Title = "Pilih Gunung",
        List = mountNames,
        Callback = function(choice)
            selectedMount = choice
        end
    })

    AutoWalkTab:Toggle({
        Title = "Mulai Auto Summit",
        Value = false,
        Callback = function(v)
            if v then
                if selectedMount and AllMountsConfig[selectedMount] then
                    local config = AllMountsConfig[selectedMount]
                    stopAutoWalkAtin()
                    if config.Func then
                        config.Func(config.Route, config.Delay, "Auto Mount " .. selectedMount, config.EndAction, config.PostDelay)
                    else
                        startAutoFarmLoop(config.Route, config.Delay, "Auto Mount " .. selectedMount, config.EndAction, config.PostDelay)
                    end
                else
                    Window:Notify({Title="Error", Desc="Pilih gunung terlebih dahulu!", Time=3})
                end
            else
                stopAutoFarmLoop()
            end
        end
    })

    -- [[ UI Player ]]
    MainTab:Toggle({Title = "Infinite Jump", Value = false, Callback = function(v) if v then UserInputService.JumpRequest:Connect(function() if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end})
    MainTab:Slider({Title = "WalkSpeed", Min = 0, Max = 100, Value = 16, Callback = function(val) if humanoid then humanoid.WalkSpeed = val end end})
    MainTab:Slider({Title = "JumpPower", Min = 0, Max = 300, Value = 50, Callback = function(val) if humanoid then humanoid.JumpPower = val; humanoid.UseJumpPower = true end end})
    
    local FLYING = false
    local FLYSPEED = 50
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local flyBV, flyBG, flyConn, flyKeyDown, flyKeyUp
    local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

    local function getRoot(char)
        return char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
    end

    local function startFly()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        humanoid = char:WaitForChild("Humanoid")
        local root = getRoot(char)
        if flyBV then flyBV:Destroy() end
        if flyBG then flyBG:Destroy() end
        if flyConn then flyConn:Disconnect() end
        FLYING = true
        humanoid.PlatformStand = true
        flyBV = Instance.new("BodyVelocity")
        flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flyBV.Velocity = Vector3.new(0, 0, 0)
        flyBV.Parent = root
        flyBG = Instance.new("BodyGyro")
        flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBG.P = 1000
        flyBG.D = 50
        flyBG.CFrame = root.CFrame
        flyBG.Parent = root
        flyConn = RunService.RenderStepped:Connect(function()
            if not FLYING or not humanoid then return end
            humanoid.PlatformStand = true
            local cam = workspace.CurrentCamera
            local moveVec
            if IsMobile then
                local controlModule = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
                local dir = controlModule:GetMoveVector()
                moveVec = (cam.CFrame.LookVector * -dir.Z) + (cam.CFrame.RightVector * dir.X)
                if moveVec.Magnitude > 0 then moveVec = moveVec.Unit end
            else
                moveVec = Vector3.new(CONTROL.L + CONTROL.R, CONTROL.Q + CONTROL.E, CONTROL.F + CONTROL.B)
                if moveVec.Magnitude == 0 then
                    moveVec = Vector3.new(lCONTROL.L + lCONTROL.R, lCONTROL.Q + lCONTROL.E, lCONTROL.F + lCONTROL.B)
                else
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R, Q = CONTROL.Q, E = CONTROL.E}
                end
            end
            flyBV.Velocity = moveVec * FLYSPEED
            flyBG.CFrame = cam.CFrame
        end)
    end

    local function stopFly()
        FLYING = false
        if flyBV then flyBV:Destroy(); flyBV = nil end
        if flyBG then flyBG:Destroy(); flyBG = nil end
        if flyConn then flyConn:Disconnect(); flyConn = nil end
        if flyKeyDown then flyKeyDown:Disconnect(); flyKeyDown = nil end
        if flyKeyUp then flyKeyUp:Disconnect(); flyKeyUp = nil end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end
    end

    flyKeyDown = UserInputService.InputBegan:Connect(function(input, processed)
        if processed or IsMobile then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 1 end
            if input.KeyCode == Enum.KeyCode.S then CONTROL.B = -1 end
            if input.KeyCode == Enum.KeyCode.A then CONTROL.L = -1 end
            if input.KeyCode == Enum.KeyCode.D then CONTROL.R = 1 end
            if input.KeyCode == Enum.KeyCode.E then CONTROL.E = 1 end
            if input.KeyCode == Enum.KeyCode.Q then CONTROL.Q = 1 end
        end
    end)
    flyKeyUp = UserInputService.InputEnded:Connect(function(input, processed)
        if processed or IsMobile then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0 end
            if input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0 end
            if input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0 end
            if input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0 end
            if input.KeyCode == Enum.KeyCode.E then CONTROL.E = 0 end
            if input.KeyCode == Enum.KeyCode.Q then CONTROL.Q = 0 end
        end
    end)
    
    MainTab:Toggle({Title = "Fly", Value = false, Callback = function(v) if v then startFly() else stopFly() end end})
    MainTab:Slider({Title = "Fly Speed", Min = 1, Max = 200, Value = FLYSPEED, Callback = function(v) FLYSPEED = v end})

    local noclipEnabled = false
    local noclipConnection = nil
    local function setCharacterCollision(char, state)
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = not state end
            end
        end
    end
    MainTab:Toggle({Title="Noclip", Value=false, Callback=function(v)
        noclipEnabled = v
        if noclipEnabled then
            if LocalPlayer.Character then setCharacterCollision(LocalPlayer.Character, true) end
            noclipConnection = RunService.Stepped:Connect(function()
                if noclipEnabled and LocalPlayer.Character and humanoid then humanoid.PlatformStand = true end
            end)
        else
            if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
            if LocalPlayer.Character and humanoid then
                humanoid.PlatformStand = false
                setCharacterCollision(LocalPlayer.Character, false)
            end
        end
    end})

    -- [[ UI Visual ]]
    local fullBrightOn = false; local brightnessLevel = 2.5; local lighting = game:GetService("Lighting")
    VisualTab:Toggle({Title = "Full Bright", Value = false, Callback = function(v) fullBrightOn = v; if v then lighting.Brightness = brightnessLevel; lighting.FogEnd = 100000 else lighting.Brightness = 1; lighting.FogEnd = 1000 end end})
    VisualTab:Slider({Title = "Brightness", Min = 0, Max = 10, Value = 2.5, Callback = function(val) brightnessLevel = val; if fullBrightOn then lighting.Brightness = val end end})

    local espEnabled = false
    local espConnection = nil
    local espElements = {}
    local function clearESP()
        for player, elements in pairs(espElements) do
            if elements.Highlight then elements.Highlight:Destroy() end
            if elements.Billboard then elements.Billboard:Destroy() end
        end
        espElements = {}
    end
    local function updateESP()
        local playersToKeep = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                playersToKeep[player] = true
                local char = player.Character
                local head = char.Head
                if not espElements[player] then
                    local highlight = Instance.new("Highlight"); highlight.FillColor = Color3.fromRGB(255, 60, 60); highlight.FillTransparency = 0.7; highlight.OutlineColor = Color3.fromRGB(255, 0, 0); highlight.OutlineTransparency = 0.2; highlight.Parent = char
                    local billboard = Instance.new("BillboardGui"); billboard.Adornee = head; billboard.Size = UDim2.new(0, 120, 0, 30); billboard.AlwaysOnTop = true; billboard.ExtentsOffsetWorld = Vector3.new(0, 1.5, 0); billboard.Parent = head
                    local nameLabel = Instance.new("TextLabel"); nameLabel.Size = UDim2.new(1, 0, 1, 0); nameLabel.Text = player.Name; nameLabel.TextColor3 = Color3.new(1, 1, 1); nameLabel.BackgroundTransparency = 1; nameLabel.Font = Enum.Font.SourceSansSemibold; nameLabel.TextScaled = true; nameLabel.Parent = billboard
                    espElements[player] = {Highlight = highlight, Billboard = billboard}
                end
            end
        end
        for player, elements in pairs(espElements) do
            if not playersToKeep[player] then
                if elements.Highlight then elements.Highlight:Destroy() end
                if elements.Billboard then elements.Billboard:Destroy() end
                espElements[player] = nil
            end
        end
    end
    VisualTab:Toggle({Title="Player ESP", Value=false, Callback=function(v)
        espEnabled = v
        if espEnabled then
            espConnection = RunService.RenderStepped:Connect(updateESP)
        else
            if espConnection then espConnection:Disconnect(); espConnection = nil end
            clearESP()
        end
    end})

    -- [[ UI Proteksi ]]
    ProteksiTab:Toggle({Title = "Anti Fall Damage", Value = false, Callback = function(v) if v then RunService.Heartbeat:Connect(function() if humanoid and rootPart and humanoid:GetState() == Enum.HumanoidStateType.Freefall and rootPart.Velocity.Y < -50 then humanoid:ChangeState(Enum.HumanoidStateType.PlatformStanding); rootPart.Velocity = Vector3.new(rootPart.Velocity.X, -5, rootPart.Velocity.Z) end end) end end})
    local edgeJumpEnabled = false; local edgeConn; local canEdgeJump = true; local edgeCooldown = 0.3; local lastEdgeJump = 0
    ProteksiTab:Toggle({Title = "Edge Jump", Value = false, Callback = function(v)
        edgeJumpEnabled = v
        if edgeConn then edgeConn:Disconnect(); edgeConn = nil end
        if edgeJumpEnabled then
            edgeConn = RunService.Heartbeat:Connect(function()
                if humanoid and rootPart then
                    local floor = humanoid.FloorMaterial
                    local state = humanoid:GetState()
                    if floor ~= Enum.Material.Air then canEdgeJump = true end
                    if floor == Enum.Material.Air and canEdgeJump and (tick() - lastEdgeJump) >= edgeCooldown and state ~= Enum.HumanoidStateType.Jumping then
                        local rayOrigin = rootPart.Position + (rootPart.CFrame.LookVector * 2)
                        local rayDirection = Vector3.new(0, -6, 0)
                        local params = RaycastParams.new()
                        params.FilterDescendantsInstances = {LocalPlayer.Character}
                        params.FilterType = Enum.RaycastFilterType.Blacklist
                        local result = workspace:Raycast(rayOrigin, rayDirection, params)
                        if not result then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            canEdgeJump = false
                            lastEdgeJump = tick()
                        end
                    end
                end
            end)
        end
    end})
    ProteksiTab:Slider({Title = "Edge Jump Cooldown", Min = 0, Max = 5, Value = edgeCooldown, Callback = function(val) edgeCooldown = val end})
    ProteksiTab:Toggle({Title="Auto Heal (God Mode)", Value=false, Callback=function(v) isAutoHealToggledOn = v; if not v then deactivateAutoHeal() end end})
    
    -- [[ UI Misc & Social ]]
    MiscTab:Button({Title = "Rejoin Server", Callback = function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end})
    SocialTab:Button({Title = "Join Discord", Callback = function() setclipboard("https://discord.gg/MkjUUkC"); Window:Notify({Title = "Copied", Desc = "Discord link copied.", Time = 3}) end})
    SocialTab:Button({Title = "Subscribe YouTube", Callback = function() setclipboard("https://youtube.com/@eryxaryxa"); Window:Notify({Title = "Copied", Desc = "YouTube link copied.", Time = 3}) end})

    Window:Notify({Title = "Eryx Hub", Desc = "Loaded successfully!", Time = 4})
end

local function verifyKey(keyToVerify, keyWindow)
    local success, result = pcall(function() return game:HttpGet("https://pastefy.app/mverVY6t/raw") end)
    if success and result then
        local correctKey = result:match("^%s*(.-)%s*$")
        local userInput = keyToVerify:match("^%s*(.-)%s*$")
        if userInput == correctKey then
            if keyWindow then keyWindow:Notify({Title = "Success", Desc = "Key Benar! Memuat Hub...", Time = 4}) end
            if writefile then writefile(KEY_FILENAME, userInput) end
            task.wait(1)
            if keyWindow then keyWindow.Enabled = false end
            CreateMainWindow()
            return true
        end
    else
        if keyWindow then keyWindow:Notify({Title = "Error", Desc = "Tidak bisa mengambil key dari server.", Time = 4}) end
    end
    return false
end

local function showKeyWindow()
    local KeyWindow = Library:Window({
        Title = "Eryx Super Hub | Key System",
        Desc = "-just some keys-",
        Icon = 105059922903197,
        Theme = "Dark",
        Config = {
            Keybind = Enum.KeyCode.RightControl,
            Size = UDim2.new(0, 400, 0, 250)
        },
        CloseUIButton = {
            Enabled = true,
            Text = "Eryx"
        }
    })
    local KeyTab = KeyWindow:Tab({Title = "Verification", Icon = "lock"})
    local KeyInput
    KeyTab:Textbox({ Title = "Masukkan Key:", Placeholder = "Your Key Here", Callback = function(text) KeyInput = text end })
    KeyTab:Button({ Title = "Submit Key", Callback = function()
        if not KeyInput or KeyInput == "" then
            KeyWindow:Notify({Title="Error", Desc="Key tidak boleh kosong!", Time=3})
            return
        end
        local success = verifyKey(KeyInput, KeyWindow)
        if not success then
            KeyWindow:Notify({Title="Gagal", Desc="Key Salah! Coba lagi.", Time=3})
        end
    end })
    KeyTab:Button({ Title = "Get Key", Callback = function()
        local link = "https://pastefy.app/mverVY6t/raw"
        if setclipboard then
            setclipboard(link)
            KeyWindow:Notify({Title = "🔑 Key System", Desc = "Link sudah disalin! Paste di browser.", Time = 5})
        else
            KeyWindow:Notify({Title = "🔑 Key System", Desc = "Buka link ini: " .. link, Time = 8})
        end
    end })
    KeyTab:Label({Text = "Note: youtube.com/@eryxaryxa"})
end

if isfile and isfile(KEY_FILENAME) and readfile then
    local savedKey = readfile(KEY_FILENAME)
    print("Mencoba verifikasi key yang tersimpan...")
    local success = verifyKey(savedKey, nil)
    if success then
        Library:Notify({Title="Welcome Back!", Desc="Key tersimpan valid! Memuat Hub...", Time=4})
    else
        print("Key tersimpan tidak valid. Menampilkan jendela key.")
        showKeyWindow()
    end
else
    print("Tidak ada key tersimpan. Menampilkan jendela key.")
    showKeyWindow()
end
