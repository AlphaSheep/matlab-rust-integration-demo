function result = distanceBetweenWithRust()
    libName = 'matlab_rust_integration_demo';

    % Load the library
    loadlibrary('../rust/target/debug/matlab_rust_integration_demo.dll', '../rust/bindings.h');
    

    p1 = libstruct('PointFFI');
    p1.x = 12.3;
    p1.y = 4.56;

    p2 = libstruct('PointFFI');
    p2.x = 7.8;
    p2.y = 9.0;

    % Call the distance_between_ffi function
    result = calllib(libName, 'distance_between_ffi', p1, p2);    
    
    % Unload the library
    clear p1 p2
    unloadlibrary(libName);
end

