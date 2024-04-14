function result = doSomethingWithArray()
    libName = 'rust';

    % Load the library
    loadlibrary('../rust/target/debug/rust.dll', '../rust/bindings.h');
    
    % Call the add_ffi functionz
    result = calllib(libName, 'do_something_with_array', [4,7,12], 3);    
    
    % Unload the library
    unloadlibrary(libName);
end

