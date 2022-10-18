

function __SnitchSentrySharedEventPayload()
{
    return {
        release: GM_version, //Game version
        
        //Extra bits of data you might want to send off to sentry.io
        extra: {
            stuff: "i guess",
        },
        
        //Tags to help filter issues/events inside sentry.io
        tags: {
            device_string: SNITCH_ENVIRONMENT_NAME,
            config:        os_get_config(),
            version:       GM_version,
        },
        
        //Information on what environment the code is running in
        contexts: {
            
            //GML-side variables that you might want to track
            //This could be player health, what level they're on, what weapon they're using etc. etc.
            vars : {
                mousex: mouse_x, //--- Updated via __SnitchSentrySharedEventPayloadUpdate()
                mousey: mouse_y, //--- Updated via __SnitchSentrySharedEventPayloadUpdate()
            },
            
            //OS-level data
            os : {
                name:              SNITCH_OS_NAME,
                version:           SNITCH_OS_VERSION,
                //browser:           SNITCH_BROWSER, //Feel free to use this but, realistically, it's unlikely that you'll be using HTML5
                paused:            bool(os_is_paused()),                 //--- Updated via __SnitchSentrySharedEventPayloadUpdate()
                network_connected: bool(os_is_network_connected(false)), //--- Updated via __SnitchSentrySharedEventPayloadUpdate()
                language:          os_get_language(),
                region:            os_get_region(),
                info:              SNITCH_OS_INFO,
            },
            
            //What version of GameMaker are you using?
            runtime: {
                name: "GameMaker",
                version: GM_runtime_version,
            },
            
            app: {
                app_start_time:   SnitchFormatTimestamp(date_current_datetime()), //This has to be formatted as a string unfortunately <_<
                config:           os_get_config(),
                yyc:              bool(code_is_compiled()),
                app_name:         game_display_name,
                app_version:      GM_version,
                running_from_ide: bool(global.__snitchRunningFromIDE),
                app_build:        SnitchFormatTimestamp(GM_build_date),
                parameters:       SNITCH_BOOT_PARAMETERS,
                steam:            bool(SnitchSteamInitializedSafe()), //--- Updated via __SnitchSentrySharedEventPayloadUpdate()
            },
        }
    }
};