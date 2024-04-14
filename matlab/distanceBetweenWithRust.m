function result = distanceBetweenWithRust()
    libName = 'rust';

    % Load the library
    loadlibrary('../rust/target/debug/rust.dll', '../rust/bindings.h');
    

    p1 = libstruct('PointFFI');
    p1.x = 12.3;
    p1.y = 4.56;

    p2 = libstruct('PointFFI');
    p2.x = 7.8;
    p2.y = 9.0;

    % Call the add_ffi functionz
    result = calllib(libName, 'distance_between_ffi', p1, p2);    
    
    % Unload the library
    clear p1 p2
    unloadlibrary(libName);
end

