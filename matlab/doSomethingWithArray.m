function result = doSomethingWithArray()
    libName = 'matlab_rust_integration_demo';

    array = [4, 7, 12];

    % Load the library
    loadlibrary('../rust/target/debug/matlab_rust_integration_demo.dll', '../rust/bindings.h');
    
    % Call the do_something_with_array_ffi function
    result = calllib(libName, 'do_something_with_array_ffi', array, numel(array));
    
    % Unload the library
    unloadlibrary(libName);
end
