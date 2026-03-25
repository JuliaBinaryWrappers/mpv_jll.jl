# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule mpv_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("mpv")
JLLWrappers.@generate_main_file("mpv", Base.UUID("3b7eb3ab-5558-5250-ad56-7cbe1b8a43e3"))
end  # module mpv_jll
