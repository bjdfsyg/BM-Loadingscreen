Citizen.CreateThread(function()
    SendNUIMessage({
        type        = "loadConfig",
        serverName  = Config.ServerName,
        tagline     = Config.Tagline,
        description = Config.Description,
        features    = Config.Features,
        discord     = Config.Discord,
        tiktok      = Config.TikTok,
        music       = Config.Music
    })
end)
