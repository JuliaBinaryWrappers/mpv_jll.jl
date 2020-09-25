# Autogenerated wrapper script for mpv_jll for i686-linux-musl
export mpv

using Libiconv_jll
using SDL2_jll
using Zlib_jll
using FFMPEG_jll
using Lua_jll
using JpegTurbo_jll
using Xorg_libXrandr_jll
using Xorg_libXinerama_jll
using Libglvnd_jll
using Xorg_libX11_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `mpv`
const mpv_splitpath = ["bin", "mpv"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mpv_path = ""

# mpv-specific global declaration
function mpv(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mpv_path)
    end
end


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    # Initialize PATH and LIBPATH environment variable listings
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Libiconv_jll.PATH_list, SDL2_jll.PATH_list, Zlib_jll.PATH_list, FFMPEG_jll.PATH_list, Lua_jll.PATH_list, JpegTurbo_jll.PATH_list, Xorg_libXrandr_jll.PATH_list, Xorg_libXinerama_jll.PATH_list, Libglvnd_jll.PATH_list, Xorg_libX11_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Libiconv_jll.LIBPATH_list, SDL2_jll.LIBPATH_list, Zlib_jll.LIBPATH_list, FFMPEG_jll.LIBPATH_list, Lua_jll.LIBPATH_list, JpegTurbo_jll.LIBPATH_list, Xorg_libXrandr_jll.LIBPATH_list, Xorg_libXinerama_jll.LIBPATH_list, Libglvnd_jll.LIBPATH_list, Xorg_libX11_jll.LIBPATH_list,))

    global mpv_path = normpath(joinpath(artifact_dir, mpv_splitpath...))

    push!(PATH_list, dirname(mpv_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()
