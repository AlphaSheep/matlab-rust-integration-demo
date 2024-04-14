function result = addWithRust(a, b)

    libName = 'rust';

    % Load the library
    if ~libisloaded(libName)
        loadlibrary('../rust/target/debug/rust.dll', '../rust/bindings.h');
    end

    % Call the add_ffi functionz
    try
        result = calllib(libName, 'add_ffi', a, b);
    catch e
        unloadlibrary(libName);
        e.throw()
    end

    % Unload the library
    if libisloaded(libName)
        unloadlibrary(libName);
    end
end