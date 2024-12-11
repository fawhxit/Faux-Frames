
// Basic
randomize()
    
#region Keys
        
    enum FFk {
            
        none,
        xx,                 // X/Y
        yy,
        xy,
        grid,
        rowi,
        rows,
        columni,
        columns,
        w,                  // W/H
        w_pct,
        w_mult,
        w_mn,
        w_mx,
        wo,
        h,
        h_pct,
        h_mult,
        h_mn,
        h_mx,
        ho,
        sz,                 // Size
        rsz,                // Radius Size
        line_w,
        offx,               // Offset
        offy,
        val,                // Value
        val_arr,
        val_mn,
        val_mx,
        val_map,
        free,
        used,
        total,
        bg,                 // BG/FG Colors and Alphas
        fg,
        bga,
        fga,
        bgc,                // Colors in this are arrays of 4 since we use draw_color
        fgc,
        bgc_o,                // Colors in this are arrays of 4 since we use draw_color
        fgc_o,
        str,                // String
        str_arr,
        sym,                // Symbol
        desc,               // Description
        hvalign,            // Horiz/Vertial fa align array
        num_dec,            // Number's Decimal Place
        marginx,            // Margin/Spacing
        marginy,
        sep,
        uid,                // General Keys
        hide_uid,
        active,
        action,
        state,
        limit,
        time,
        mode,
        type,
        fill,
        arr,
        arri,
        varr,               // Variable Array (n-dim/multi dim)
        scrollx,
        scrollx_mn,
        scrollx_mx,
        scrolly,
        scrolly_mn,
        scrolly_mx,
        scroll,             // Frame Control Keys (T/F)
        drag,
        drag_override,      // Button Override (Incase a button is clicked on and we dont want to drag frame)
        autodrag,
        init_autodrag,
        focus,
        focus_lock,         // If Frame is Active Focus is locked on it, whether or not it needs focus
        resize,
        resize_w,
        resize_h,
        autosize,
        title,              // Title Bar
        ttl_cfg,
        xbtn,
        pbtn,
        mbtn,
        tab_group,          // Tab Group Keys
        tg_cfg,
        output,             // Output Keys
        out_cfg,
        input,              // Input Keys
        inp_cfg,
        carot_cfg,
        con_cfg,            // Console Keys
        cmpnt_cfg,          // Component Keys
        cmpnt_type,
        opt_cfg,            // Option Keys
        cell_cfg,           // Cell/Menu Keys (i.e. Dropdown Menu)
        menu_cfg,
        spacer_cfg,         // Spacer Keys
        bound,
        override,
        fname,            // Char Keys
        lname,
        gender,
        col_hair,
        col_eye,
        col_skin,
        col_und,
        att_cfg,
        end_cfg,
        str_cfg,
        dex_cfg,
        int_cfg,
        cha_cfg,
        fat_cfg,
        stat_cfg,
        hea_cfg,
        man_cfg,
        sta_cfg,
        hun_cfg,
        thi_cfg,
        sle_cfg,
        spe_cfg,
        rate,
        rate_type,
        mod_varr,
        pct,
        need_pct,
        condition_pct,
        ref,
        scl_w,
        scl_h,
        scl,
        grid_nums,
        owner,
        parent,
        cmp_list,
        cmp_list_toAdd,
        surf_id,
        surf_wh,
        surf_xy,
        cmp_w,
        cmp_h,
        force_bounds,
        content_ho,
        color,
        load,
        map_xy,
        del_btn,
        i,
        read,
        write,
        select_rng,
        selected,
        list_2d,
        overwrite,
        carot_end
            
    }
        
    enum FFv {
            
        none,
        male,
        female,
        pos,
        neu,
        neg,
        food,
        water,
        lava,
        bed,
        player,
        circle,
        rectangle,
        resource,
        weapon_tool,
        clothe_armor
            
    }
        
    enum FF_content {
            
        none,
        con,
        cmpnt
            
    }
        
    enum FF_component {
            
        none,                 // None
        btn,                // Button
        sldr,               // Slider
        pckr,               // Picker
        col_pckr,           // Color Picker
        iter,               // Iterator
        togl,               // Toggle
        drop,               // Dropdown
        inpf,               // Input Field
        multf,              // Multi Field
        lbl,                // Label
        bnd_btn,            // Bind Button
        vbar,               // Vertical Bar
        hbar,               // Horizontal Bar
        preview,            // Preview "Mirror"
        slot_grid,          // Slot Grid
        cmp_list,           // Component List
        contain,            // Container
        ent_btn,            // Entry Button
        horiz_spcr,         // Horizonal Spacer
        vert_spcr
        // Vertical Spacer
            
    }
        
    enum FF_spacer {
            
        none,
        bar_fill,       // Filled Bar Spacer
        bar_line,       // Unfilled Bar Spacer
        line,           // Line Spacer (Text Optional)
        str_cmplx,      // Custom Complex String Spacer (Updates)
        str
        // Custom String Spacer
            
    }
        
    enum FF_input {
            
        none,
        alpha,
        num,
        posnum,
        negnum,
        alphanum
            
    }
        
    enum FF_action {
            
        none,
        rwh,
        set_rw,
        set_rh,
        win,
        inv,
        new_game,
        resume,
        save,
        load,
        settings,
        ex,
        vsync,
        aa,
        gfx_apply,
        tog_inpf,
        tog_crouch,
        tog_sprint,
        vol_master,
        vol_sfx,
        vol_music,
        vol_voice,
        difficulty_scale,
        prompt,
        char_fname,
        char_lname,
        char_gender,
        char_male,
        char_female,
        tog_tog,
        col_eye,
        col_hair,
        col_skin,
        col_und,
        iter_end,
        iter_str,
        iter_dex,
        iter_int,
        iter_cha,
        iter_fat,
        char_done,
        char_cancel,
        journal_add,
        journal_entry,
        journal_uid,
        journal_pin,
        journal_color,
        journal_notes
            
    }
        
    enum FF_game {
            
        none,
        pause,
        char_create,
        play
            
    }
        
    enum FF_grids {
            
        none,
        wear,
        wield,
        inv
            
    }
        
    enum FF_slot {
            
        none,
        back,
        head,
        hands,
        r_shoulder,
        torso,
        l_shoulder,
        r_arm,
        waist,
        l_arm,
        r_leg,
        feet,
        l_leg,
        r_hand,
        l_hand
            
    }
        
#endregion
    
#region Structs
        
    FF = {
            
        #region Init core/defaults
                
            // Text
            line_break: "\n",
                
            // Debug
            debug: false,
            debug_frames: false,
            debug_components: false,
            debug_bounds: false,
            debug_text_input: false,
            debug_text_input_all: false,
            debug_slot_grid_types: false,
                
            // Runtime
            runtime_width: 1024,
            runtime_height: 768,
            runtime_width_next: 1024,
            runtime_height_next: 768,
            runtime_anti_alias: 0,
            runtime_vertical_sync: false,
            runtime_console: noone, // Init'd After FF.frame.map_list is
            runtime_background_alpha: 1,
            runtime_background_color: c_black,
            runtime_foreground_alpha: 1,
            runtime_foreground_color: c_white,
            runtime_frame: 0,
            runtime_frame_delay: 0,
            runtime_second: 0,
            runtime_second_delay: 0,
            runtime_minute: 0,
            runtime_minute_delay: 0,
            runtime_hour: 0,
            runtime_hour_delay: 0,
                
            // Mouse
            mouse_x_old: mouse_x,
            mouse_y_old: mouse_y,
            mouse_x_delta: 0,
            mouse_y_delta: 0,
            // Buttons/Wheel (COMPRESSED) (NEEDS TO BE UPDATED IN BEGIN STEP)
            // MB Left
            MBL: mouse_check_button(mb_left),
            MBLP: mouse_check_button_pressed(mb_left),
            MBLR: mouse_check_button_released(mb_left),
            // MB Middle
            MBM: mouse_check_button(mb_middle),
            MBMP: mouse_check_button_pressed(mb_middle),
            MBMR: mouse_check_button_released(mb_middle),
            // MB Right
            MBR: mouse_check_button(mb_right),
            MBRP: mouse_check_button_pressed(mb_right),
            MBRR: mouse_check_button_released(mb_right),
            // Wheel
            MWU: mouse_wheel_up(),
            MWD: mouse_wheel_down(),
            // Mouse Drag
            mouse_drag_list: noone,
            mouse_drag_destination: noone,
            mouse_drag_source: noone,
                
            // Keyboard
            caps_lock: false,
            // Key Hold Iteration
            key_held: vk_nokey,
            key_held_i: noone,
            // Key Checks
            key_shift: keyboard_check(vk_shift),
            key_control: keyboard_check(vk_control),
            key_enter_p: keyboard_check_pressed(vk_enter),
            key_enter_r: keyboard_check(vk_enter),
            key_back: keyboard_check_pressed(vk_backspace),
            key_back_p: keyboard_check(vk_backspace),
            key_up: keyboard_check(vk_up),
            key_down: keyboard_check(vk_down),
            key_left: keyboard_check(vk_left),
            key_right: keyboard_check(vk_right),
            key_arrow_p: (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)),
            key_insert_p: keyboard_check_pressed(vk_insert),
                
            // Surface
            surface_map: ds_map_create(),
            surface_xy: [0,0],
                
        #endregion
            
        #region Other Structs
                
            // Margins/Seperators
            margin: {
                    
                // Basic
                SM:5,  // Small
                MD:10, // Medium
                BG:20, // Big
                LG:40, // Large
                HG:60, // Huge
                    
                // Window
                RW2:0,   // Runtime Width / 2
                RW4:0,   // Runtime Width / 4
                RW8:0,   // Runtime Width / 8
                RW16:0,  // Runtime Width / 16
                RH2:0,   // Runtime Height / 2
                RH4:0,   // Runtime Height / 4
                RH8:0,   // Runtime Height / 8
                RH16:0,  // Runtime Height / 16
                    
                // Text
                STR_H:string_height("|"),
                STR_W:string_width("_")
                    
            },
                
            option: {
                    
                fullscreen: {
                        
                    val:0,
                    str:"fullscreen"
                        
                },
                    
                borderless: {
                        
                    val:1,
                    str:"borderless fullscreen"
                        
                },
                    
                windowed: {
                        
                    val:2,
                    str:"windowed"
                        
                }
                    
                    
            },
                
            display: {
                    
                a: {
                        
                    w:800,
                    h:600,
                    str:"800x600"
                        
                },
                    
                b: {
                        
                    w:1024,
                    h:768,
                    str:"1024x768"
                        
                },
                    
                c: {
                        
                    w:1280,
                    h:720,
                    str:"1280x720"
                        
                },
                    
                d: {
                        
                    w:1280,
                    h:1024,
                    str:"1280x1024"
                        
                },
                    
                e: {
                        
                    w:1360,
                    h:768,
                    str:"1360x768"
                        
                },
                    
                f: {
                        
                    w:1366,
                    h:768,
                    str:"1366x768"
                        
                },
                    
                g: {
                        
                    w:1440,
                    h:900,
                    str:"1440x900"
                        
                },
                    
                h: {
                        
                    w:1600,
                    h:900,
                    str:"1600x900"
                        
                },
                    
                i: {
                        
                    w:1680,
                    h:1050,
                    str:"1680x1050"
                        
                },
                    
                j: {
                        
                    w:1920,
                    h:1080,
                    str:"1920x1080"
                        
                },
                    
                k: {
                        
                    w:1920,
                    h:1200,
                    str:"1920x1200"
                        
                },
                    
                l: {
                        
                    w:2048,
                    h:1152,
                    str:"2048x1152"
                        
                },
                    
                m: {
                        
                    w:2048,
                    h:1536,
                    str:"2048x1536"
                        
                },
                    
                n: {
                        
                    w:2560,
                    h:1080,
                    str:"2560x1080"
                        
                },
                    
                o: {
                        
                    w:2560,
                    h:1440,
                    str:"2560x1440"
                        
                },
                    
                p: {
                        
                    w:3440,
                    h:1440,
                    str:"3440x1440"
                        
                },
                    
                q: {
                        
                    w:3840,
                    h:2160,
                    str:"3840x2160"
                        
                }
                    
            },
                
            anti_alias: {
                    
                low: {
                        
                    val: 0,
                    str:"Low"
                        
                },
                    
                medium: {
                        
                    val: 2,
                    str:"Medium"
                        
                },
                    
                high: {
                        
                    val: 4,
                    str:"High"
                        
                },
                    
                highest: {
                        
                    val: 8,
                    str:"Highest"
                        
                }
                    
            },
                
            command: {
                    
                #region Movement
                        
                    up: {
                            
                        str:"Forward/Up",
                        ky:ord("W"),
                        val:0
                            
                    },
                        
                    left: {
                            
                        str:"(Strafe) Left",
                        ky:ord("A"),
                        val:1
                            
                    },
                        
                    down: {
                            
                        str:"Backward/Down",
                        ky:ord("S"),
                        val:2
                            
                    },
                        
                    right: {
                            
                        str:"(Strafe) Right",
                        ky:ord("D"),
                        val:3
                            
                    },
                        
                    jump: {
                            
                        str:"Jump",
                        ky:vk_space,
                        val:4
                            
                    },
                        
                    crouch: {
                            
                        str:"Crouch",
                        ky:vk_control,
                        val:5,
                        toggle:false,
                        toggle_on:false
                            
                    },
                        
                    sprint: {
                            
                        str:"Sprint",
                        ky:vk_shift,
                        val:6,
                        toggle:false,
                        toggle_on:false
                            
                    },
                        
                #endregion
                    
                #region Interaction
                        
                    use: {
                            
                        str:"Use/Interact",
                        ky:ord("E"),
                        val:7
                            
                    },
                        
                    confirm: {
                            
                        str:"Select/Confirm",
                        ky:vk_enter,
                        val:8
                            
                    },
                        
                    cancel: {
                            
                        str:"Back/Cancel",
                        ky:vk_backspace,
                        val:9
                            
                    },
                        
                #endregion
                    
                #region Menus
                        
                    menu_infix: " : Player ",
                        
                    menu: {
                            
                        str:"Main Menu",
                        ky:vk_escape,
                        val:0
                            
                    },
                        
                    inv: {
                            
                        str:"Inventory",
                        ky:ord("I"),
                        val:10
                            
                    },
                        
                    char: {
                            
                        str:"Character",
                        ky:ord("C"),
                        val:11
                            
                    },
                        
                    log: {
                            
                        str:"Journal",
                        ky:ord("J"),
                        val:12
                            
                    },
                        
                    map: {
                            
                        str:"Map",
                        ky:ord("M"),
                        val:13
                            
                    },
                        
                #endregion
                    
                #region Combat/Other
                        
                    reload: {
                            
                        str:"Reload",
                        ky:ord("R"),
                        val:14
                            
                    },
                        
                    light: {
                            
                        str:"Light",
                        ky:vk_tab,
                        val:15
                            
                    },
                        
                    drop: {
                            
                        str:"Drop",
                        ky:ord("Q"),
                        val:16
                            
                    },
                        
                    tthrow: {
                            
                        str:"Throw",
                        ky:ord("G"),
                        val:17
                            
                    },
                        
                    melee: {
                            
                        str:"Melee",
                        ky:ord("F"),
                        val:18
                            
                    },
                        
                    primary: {
                            
                        str:"Primary Action",
                        ky:mb_left,
                        val:19
                            
                    },
                        
                    alternate: {
                            
                        str:"Alternate Action",
                        ky:mb_middle,
                        val:20
                            
                    },
                        
                    aim: {
                            
                        str:"Aim",
                        ky:mb_right,
                        val:21
                            
                    },
                        
                    zoom_in: {
                            
                        str:"Zoom In",
                        ky:"mb_up",
                        val:22
                            
                    },
                        
                    zoom_out: {
                            
                        str:"Zoom Out",
                        ky:"mb_down",
                        val:23
                            
                    },
                        
                    next: {
                            
                        str:"Next Item",
                        ky:vk_add,
                        val:24
                            
                    },
                        
                    prev: {
                            
                        str:"Previous Item",
                        ky:vk_subtract,
                        val:25
                            
                    }
                        
                #endregion
                    
            },
                
            main: {
                    
                // Misc Important Variables
                to_lim: round(room_speed/4),    // Time Out Limit
                scroll_spd:0,
                    
                game: {
                        
                    name:"Faux Frames",
                    ver:"v0.90",
                    state:FF_game.none,
                    state_prv:FF_game.none
                        
                },
                    
                vol_master: {
                        
                    str:"Master Volume",
                    val_mn:0,
                    val:75,
                    val_mx:100,
                    sym:"%"
                        
                },
                    
                vol_sfx: {
                        
                    str:"Sound Volume",
                    val_mn:0,
                    val:100,
                    val_mx:100,
                    sym:"%"
                        
                },
                    
                vol_music: {
                        
                    str:"Music Volume",
                    val_mn:0,
                    val:50,
                    val_mx:100,
                    sym:"%"
                        
                },
                    
                vol_voice: {
                        
                    str:"Voice Volume",
                    val_mn:0,
                    val:100,
                    val_mx:100,
                    sym:"%"
                        
                },
                    
                difficulty_scale: {
                        
                    str:"Difficulty",
                    val_mn:0.1,
                    val:1.0,
                    val_mx:5.0,
                    sym:"x"
                        
                }
                    
            },
                
            color: {
                    
                #region White/Black
                        
                    black: { 
                            
                        str:"Black",
                        rgb:make_color_rgb(0,0,0)
                            
                    },
                        
                    white: {
                            
                        str:"White",
                        rgb:make_color_rgb(255,255,255)
                            
                    },
                        
                #endregion
                    
                #region Gray Scale
                        
                    gray: {
                            
                        darkest: {
                                
                            str:"Darkest Gray",
                            rgb:make_color_rgb(32,32,32)
                                
                        },
                            
                        darker: {
                                
                            str:"Darker Gray",
                            rgb:make_color_rgb(64,64,64)
                                
                        },
                            
                        dark: {
                                
                            str:"Dark Gray",
                            rgb:make_color_rgb(96,96,96)
                                
                        },
                            
                        str:"Gray",
                        rgb:make_color_rgb(128,128,128),
                            
                        light: {
                                
                            str:"Light Gray",
                            rgb:make_color_rgb(160,160,160)
                                
                        },
                            
                        lighter: {
                                
                            str:"Lighter Gray",
                            rgb:make_color_rgb(192,192,192)
                                
                        },
                            
                        lightest: {
                                
                            str:"Lightest Gray",
                            rgb:make_color_rgb(224,224,224)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Red Scale
                        
                    red: {
                            
                        dark: {
                                
                            str:"Dark Red",
                            rgb:make_color_rgb(160,0,0)
                                
                        },
                            
                        str:"Red",
                        rgb:make_color_rgb(210,0,0),
                            
                        light: {
                                
                            str:"Light Red",
                            rgb:make_color_rgb(255,128,128)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Red",
                            rgb:make_color_rgb(255,0,0)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Green Scale
                        
                    green: {
                            
                        forest: {
                                
                            str:"Forest Green",
                            rgb:make_color_rgb(0,64,0)
                                
                        },
                            
                        dark: {
                                
                            str:"Dark Green",
                            rgb:make_color_rgb(0,128,0)
                                
                        },
                            
                        str:"Green",
                        rgb:make_color_rgb(0,210,0),
                            
                        light: {
                                
                            str:"Light Green",
                            rgb:make_color_rgb(128,255,128)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Green",
                            rgb:make_color_rgb(0,255,0)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Blue Scale
                        
                    blue: {
                            
                        dark: {
                                
                            str:"Dark Blue",
                            rgb:make_color_rgb(0,0,128)
                                
                        },
                            
                        str:"Blue",
                        rgb:make_color_rgb(0,0,192),
                            
                        light: {
                                
                            str:"Light Blue",
                            rgb:make_color_rgb(128,128,255)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Blue",
                            rgb:make_color_rgb(0,0,255)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Yellow Scale
                        
                    yellow: {
                            
                        dark: {
                                
                            str:"Dark Yellow",
                            rgb:make_color_rgb(210,210,0)
                                
                        },
                            
                        str:"Yellow",
                        rgb:make_color_rgb(255,255,64),
                            
                        light: {
                                
                            str:"Light Yellow",
                            rgb:make_color_rgb(255,255,128)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Yellow",
                            rgb:make_color_rgb(255,255,0)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Purple Scale
                        
                    purple: {
                            
                        dark: {
                                
                            str:"Dark Purple",
                            rgb:make_color_rgb(128,0,128)
                                
                        },
                            
                        str:"Purple",
                        rgb:make_color_rgb(210,0,210),
                            
                        light: {
                                
                            str:"Light Purple",
                            rgb:make_color_rgb(255,128,255)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Purple",
                            rgb:make_color_rgb(255,0,255)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Cyan Scale
                        
                    cyan: {
                            
                        dark: {
                                
                            str:"Dark Cyan",
                            rgb:make_color_rgb(0,128,128)
                                
                        },
                            
                        str:"Cyan",
                        rgb:make_color_rgb(0,210,210),
                            
                        light: {
                                
                            str:"Light Cyan",
                            rgb:make_color_rgb(128,255,255)
                                
                        },
                            
                        neon: {
                                
                            str:"Neon Cyan",
                            rgb:make_color_rgb(0,255,255)
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Other Colors
                        
                    orange:  { 
                            
                        str:"Orange",
                        rgb:make_color_rgb(255,128,0)
                            
                    },
                        
                    ginger: {
                            
                        str:"Ginger",
                        rgb:make_color_rgb(210,88,12)
                            
                    },
                        
                    brown:  { 
                            
                        str:"Brown",
                        rgb:make_color_rgb(124,64,38)
                            
                    },
                        
                    pink:  { 
                            
                        str:"Pink",
                        rgb:make_color_rgb(255,160,212)
                            
                    },
                        
                    gold:  { 
                            
                        str:"Gold",
                        rgb:make_color_rgb(255,200,64)
                            
                    },
                        
                    silver:  { 
                            
                        str:"Silver",
                        rgb:make_color_rgb(196,202,206)
                            
                    },
                        
                    bronze:  { 
                            
                        str:"Bronze",
                        rgb:make_color_rgb(176,141,87)
                            
                    },
                        
                    copper_rust:  { 
                            
                        str:"Copper Rust",
                        rgb:make_color_rgb(95,206,162)
                            
                    },
                        
                    pale_skin: {
                            
                        str:"Pale Skin",
                        rgb:make_color_rgb(255,232,208)
                            
                    },
                        
                    light_skin: {
                            
                        str:"Light Skin",
                        rgb:make_color_rgb(255,212,182)
                            
                    },
                        
                    tan_skin: {
                            
                        str:"Tan Skin",
                        rgb:make_color_rgb(228,176,136)
                            
                    },
                        
                    dark_skin: {
                            
                        str:"Dark Skin",
                        rgb:make_color_rgb(168,120,86)
                            
                    },
                        
                    darker_skin: {
                            
                        str:"Darker Skin",
                        rgb:make_color_rgb(92,64,38)
                            
                    }
                        
                #endregion
                    
            },
                
            attribute: {
                    
                // Starting Stat Point totals
                free:0,
                used:30,
                total:30,
                    
                endurance: {
                        
                    uid:0,
                    str:"Endurance",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"How long may you run? How much pain can you stand?"
                        + " How long must you rest?"
                        
                },
                    
                strength: {
                        
                    uid:1,
                    str:"Strength",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"How much can you bare? How mighty are your blows?"
                        + " Which arms may you don?"
                        
                },
                    
                dexterity: {
                        
                    uid:2,
                    str:"Dexterity",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"How nimble are your movements? How masterful are your sleights?"
                        + " How true is your aim?"
                        
                },
                    
                intelligence: {
                        
                    uid:3,
                    str:"Intelligence",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"How quick might you learn? How expert are your crafts?"
                        + " How potent be your mind's will?"
                        
                },
                    
                charisma: {
                        
                    uid:4,
                    str:"Charisma",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"Might you tempt another with your speech? May your leadership inpsire?"
                        + " May your words harvest peace and allies?"
                        
                },
                    
                fate: {
                        
                    uid:5,
                    str:"Fate",
                    val:5,
                    val_mn:1,
                    val_mx:25,
                    desc:"Will treasures line your path? Might fortunes favor your cause?"
                        + " Might mysteries become more clear?"
                        
                }
                    
            },
                
            UID: {
                    
                char_basic:"Basic Info",
                char_appear:"Appearance",
                char_att:"Attributes",
                main_menu:"Main",
                stg_video:"Video",
                stg_audio:"Audio",
                stg_game:"Game",
                stg_control1:"Controls 1",
                stg_control2:"Controls 2",
                stg_console:"Console",
                rt_console:"Runtime Console",
                tg_stg:"Settings",
                tg_char:": Player Creation",
                hud_stat:["Player "," Stats"]
                    
                    
            },
                
            stat: {
                    
                #region Base
                        
                    base: {
                            
                        delta: {
                                
                            // Speed is not a FF.stat.base.delta since it is directly tied to character stats
                            minimum:0.05,
                            stamina:1.0,
                            hunger:1.0,
                            thirst:2.0,
                            sleep:round2(1/2,2),
                            vHealth:0.5,
                            mana:0.8
                                
                        },
                            
                        factor: {
                                
                            sprint_speed:2.0,
                            sprint_stamina:-3.0,
                            crouch_speed:round2(1/3,2),
                            crouch_stamina:round2(1/2,2),
                            need_divisor:1.0
                                
                        }
                            
                    },
                        
                #endregion
                    
                #region Main
                        
                    vHealth: {
                            
                        uid:0,
                        str:"Health",
                        mod_varr:noone,
                        val:100,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.pos,
                        rate:0.2,
                        rate_type:FFv.pos
                            
                    },
                        
                    mana: {
                            
                        uid:1,
                        str:"Mana",
                        mod_varr:noone,
                        val:100,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.pos,
                        rate:0.1,
                        rate_type:FFv.pos
                            
                    },
                        
                    stamina: {
                            
                        uid:2,
                        str:"Stamina",
                        mod_varr:noone,
                        val:100,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.pos,
                        rate:0.5,
                        rate_type:FFv.pos
                            
                    },
                        
                #endregion
                    
                #region Needs
                        
                    hunger: {
                            
                        uid:3,
                        str:"Hunger",
                        mod_varr:noone,
                        val:0,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.neg,
                        rate:0.1,
                        rate_type:FFv.pos
                            
                    },
                        
                    thirst: {
                            
                        uid:4,
                        str:"Thirst",
                        mod_varr:noone,
                        val:0,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.neg,
                        rate:0.2,
                        rate_type:FFv.pos
                            
                    },
                        
                    sleep: {
                            
                        uid:5,
                        str:"Sleep",
                        mod_varr:noone,
                        val:0,
                        val_mn:0,
                        val_mx:100,
                        type:FFv.neg,
                        rate:0.05,
                        rate_type:FFv.pos
                            
                    },
                        
                #endregion
                    
                #region Movement
                        
                    vSpeed: {
                            
                        uid:6,
                        str:"Speed",
                        mod_varr:noone,
                        val:3.0,
                        type:FFv.neu,
                        rate_type:FFv.neu
                            
                    }
                        
                #endregion
                    
            },
                
            limit: {
                    
                // Positive Thresholds
                // Higher is better; The More the Value, the Better
                pos: {
                        
                    least:0.025,
                    lowest:0.05,
                    lower:0.15,
                    low:0.25,
                    medium_low:0.34,
                    medium:0.5,
                    medium_high:0.67,
                    high:0.75,
                    higher:0.8,
                    highest:0.9,
                    most:0.95
                        
                },
                    
                // Negative Thresholds
                // Higher is Worse; The More the Value, the Worse
                neg: {
                        
                    least:0.05,
                    lowest:0.1,
                    lower:0.175,
                    low:0.25,
                    medium_low:0.34,
                    medium:0.5,
                    medium_high:0.67,
                    high:0.75,
                    higher:0.825,
                    highest:0.925,
                    most:0.975
                        
                }
                    
            },
                
            slot_type: {
                    
                wear: {
                        
                    back: {
                            
                        uid:FF_slot.back,
                        str:"Back"
                            
                    },
                        
                    head: {
                            
                        uid:FF_slot.head,
                        str:"Head"
                            
                    },
                        
                    hands: {
                            
                        uid:FF_slot.hands,
                        str:"Hands"
                            
                    },
                        
                    r_shoulder: {
                            
                        uid:FF_slot.r_shoulder,
                        str:"Right Shoulder"
                            
                    },
                        
                    torso: {
                            
                        uid:FF_slot.torso,
                        str:"Torso"
                            
                    },
                        
                    l_shoulder: {
                            
                        uid:FF_slot.l_shoulder,
                        str:"Left Shoulder"
                            
                    },
                        
                    r_arm: {
                            
                        uid:FF_slot.r_arm,
                        str:"Right Arm"
                            
                    },
                        
                    waist: {
                            
                        uid:FF_slot.waist,
                        str:"Waist"
                            
                    },
                        
                    l_arm: {
                            
                        uid:FF_slot.l_arm,
                        str:"Left Arm"
                            
                    },
                        
                    r_leg: {
                            
                        uid:FF_slot.r_leg,
                        str:"Right Leg"
                            
                    },
                        
                    feet: {
                            
                        uid:FF_slot.feet,
                        str:"Feet"
                            
                    },
                        
                    l_leg: {
                            
                        uid:FF_slot.l_leg,
                        str:"Left Leg"
                            
                    },
                        
                    r_hand: {
                            
                        uid:FF_slot.r_hand,
                        str:"Right Hand"
                            
                    },
                        
                    l_hand: {
                            
                        uid:FF_slot.l_hand,
                        str:"Left Hand"
                            
                    }
                        
                }
                    
            },
                
        #endregion
            
        #region Frame Inits
                
            frame: {
                    
                map_list: ds_list_create(),
                focus: noone,
                tab_array_map: ds_map_create(),
                menu_override: false,
                component_focus: noone,
                draw_break: true,
                hold_list: ds_list_create(),
                ingame_override: false
                    
            },
                
        #endregion
            
        #region Game Inits
                
            player: {
                    
                map_list: ds_list_create(),
                focus: noone
                    
            },
                
            entity: {
                    
                map_list: ds_list_create(),
                focus: noone,
                stack_pickup_multiplier: 3.0,           // Can hold 3x worth of slot stack in mouse_drag_list
                    
                dynamic: {
                        
                    map_list: ds_list_create(),
                    focus: noone
                        
                },
                    
                limit:10,
                    
                apple: {
                        
                    uid:0,
                    str:"Apple",
                    weight:0.2,
                    shape:FFv.circle,
                    rsz:10.0,
                    type:FFv.food,
                    slots:[FF_slot.r_hand,FF_slot.l_hand],
                    col:noone,
                    stack:true,
                    stack_lim:5
                        
                },
                    
                berry: {
                        
                    uid:1,
                    str:"Berry",
                    weight:0.03,
                    shape:FFv.circle,
                    rsz:5.0,
                    type:FFv.food,
                    slots:[FF_slot.r_hand,FF_slot.l_hand],
                    col:noone,
                    stack:true,
                    stack_lim:5
                        
                },
                    
                branch: {
                        
                    uid:2,
                    str:"Branch",
                    weight:0.1,
                    shape:FFv.rectangle,
                    w:20.0,
                    h:5.0,
                    type:FFv.resource,
                    slots:[FF_slot.r_hand,FF_slot.l_hand],
                    col:noone,
                    stack:true,
                    stack_lim:5
                        
                },
                    
                rock: {
                        
                    uid:3,
                    str:"Rock",
                    weight:0.25,
                    shape:FFv.circle,
                    rsz:15.0,
                    type:FFv.resource,
                    slots:[FF_slot.r_hand,FF_slot.l_hand],
                    col:noone,
                    stack:false
                        
                },
                    
                sword: {
                        
                    uid:4,
                    str:"Sword",
                    weight:2.0,
                    shape:FFv.rectangle,
                    w:5.0,
                    h:40.0,
                    type:FFv.weapon_tool,
                    slots:[FF_slot.r_hand,FF_slot.l_hand],
                    col:noone,
                    stack:false
                        
                },
                    
                chestplate: {
                        
                    uid:5,
                    str:"Chestplate",
                    weight:0.25,
                    shape:FFv.rectangle,
                    w:50.0,
                    h:50.0,
                    type:FFv.clothe_armor,
                    slots:[FF_slot.torso],
                    col:noone,
                    stack:false
                        
                }
                    
            }
                
        #endregion
            
    }
        
    #region Post FF. Inits
            
        // Window
        FF.margin.RW2 = round(FF.runtime_width/2)
        FF.margin.RW4 = round(FF.runtime_width/4)
        FF.margin.RW8 = round(FF.runtime_width/8)
        FF.margin.RW16 = round(FF.runtime_width/16)
        FF.margin.RH2 = round(FF.runtime_height/2)
        FF.margin.RH4 = round(FF.runtime_height/4)
        FF.margin.RH8 = round(FF.runtime_height/8)
        FF.margin.RH16 = round(FF.runtime_height/16)
            
        // Main
        FF.main.scroll_spd = FF.margin.STR_H
            
        // Stat
        // Main
        FF.stat.vHealth.mod_varr = [[FF.attribute.endurance,0.1],[FF.attribute.strength,0.1]]
        FF.stat.mana.mod_varr = [[FF.attribute.intelligence,0.15],[FF.attribute.endurance,0.05]]
        FF.stat.stamina.mod_varr = [[FF.attribute.endurance,0.15],[FF.attribute.dexterity,0.05],[FF.attribute.strength,-0.05]]
        // Need
        FF.stat.hunger.mod_varr = [[FF.attribute.endurance,0.085],[FF.attribute.strength,-0.01]]
        FF.stat.thirst.mod_varr = [[FF.attribute.endurance,0.085],[FF.attribute.dexterity,-0.01]]
        FF.stat.sleep.mod_varr = [[FF.attribute.endurance,0.075]]
        // Movement
        FF.stat.vSpeed.mod_varr = [[FF.attribute.dexterity,0.1]]
            
        // Entities
        FF.entity.apple.col = FF.color.red
        FF.entity.berry.col = FF.color.blue
        FF.entity.branch.col = FF.color.brown
        FF.entity.rock.col = FF.color.gray
        FF.entity.sword.col = FF.color.gray.light
        FF.entity.chestplate.col = FF.color.gray.dark
            
    #endregion
        
#endregion
    