function result = doSomethingToString()
    libName = 'rust';

    % Load the library
    loadlibrary('../rust/target/debug/rust.dll', '../rust/bindings.h');

    str = repmat('0123456789', 1, 20);

    % Call the add_ffi functionz
    resultPtr = calllib(libName, 'do_something_to_string_ffi', str);
    result = resultPtr.Value{1};
    calllib(libName, 'free_string_pointer', resultPtr);
    
    % Unload the library
    unloadlibrary(libName);
end
