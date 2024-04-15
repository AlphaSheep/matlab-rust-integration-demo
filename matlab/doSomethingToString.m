function result = doSomethingToString()
    libName = 'matlab_rust_integration_demo';

    % Load the library
    loadlibrary('../rust/target/debug/matlab_rust_integration_demo.dll', '../rust/bindings.h');

    str = 'This is an example string';

    % Call the do_something_to_string_ffi function
    resultPtr = calllib(libName, 'do_something_to_string_ffi', str);
    result = resultPtr.Value{1};
    calllib(libName, 'free_string_pointer', resultPtr);
    
    % Unload the library
    unloadlibrary(libName);
end
