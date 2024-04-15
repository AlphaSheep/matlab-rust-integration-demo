function result = addWithRust(a, b)
    libName = 'matlab_rust_integration_demo';

    % Load the library
    loadlibrary('../rust/target/debug/matlab_rust_integration_demo.dll', '../rust/bindings.h');
    
    % Call the add_ffi function
    result = calllib(libName, 'add_ffi', a, b);
    
    % Unload the library
    unloadlibrary(libName);
end