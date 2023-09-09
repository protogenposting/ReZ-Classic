// Message Display shenanigans
show_message_time	= 0;
msg					= "";

// Sets our upload URL
base_url	= "protogenposting.net"
url			= "https://protogenposting.net";

file = get_open_filename("*.*","");
file_name = filename_name(file);

//Create DS Map to hold the HTTP Header info
map = ds_map_create();

//Add to the header DS Map
ds_map_add(map,"Host", base_url);
ds_map_add(map,"User-Agent", "gmuploader");
ds_map_add(map,"Content-Type", "application/x-www-form-urlencoded");
ds_map_add(map,"Accept", "*/*");

// Loads the file into a buffer
send_buffer = buffer_create(1,buffer_grow,1);
buffer_load_ext(send_buffer, file, 0);

// Encodes the data as base64
data_send = buffer_base64_encode(send_buffer, 0, buffer_get_size(send_buffer));

// Posts the data to the upload script
http_request(url+ "upload.php", "POST", map, "name=" + file_name + "&data=" + data_send);

// Cleans up!
buffer_delete(send_buffer);
ds_map_destroy(map);