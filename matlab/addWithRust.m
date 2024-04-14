function result = addWithRust(a, b)
    libName = 'rust';

    % Load the library
    loadlibrary('../rust/target/debug/rust.dll', '../rust/bindings.h');
    
    % Call the add_ffi functionz
    result = calllib(libName, 'add_ffi', a, b);
    
    % Unload the library
    unloadlibrary(libName);
end