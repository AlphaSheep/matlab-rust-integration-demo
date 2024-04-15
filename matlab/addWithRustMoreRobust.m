function result = addWithRust(a, b)

    libName = 'matlab_rust_integration_demo';

    % Load the library
    if ~libisloaded(libName)
        loadlibrary('../rust/target/debug/matlab_rust_integration_demo.dll', '../rust/bindings.h');
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