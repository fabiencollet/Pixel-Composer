function __EXPORT_JSON(project = PROJECT) {
	if(DEMO) return false;
	
	var path = get_save_filename_compat("JSON (.json)|*.json", ""); 
	key_release();
	if(path == "") return false;
	
	var _map = project.serialize();
	var _str = json_stringify(_map, true);
	file_text_write_all(path, _str);
	
	return true;
}

function __EXPORT_FOLDER(project = PROJECT) {
	if(DEMO) return false;
	
	var path = get_save_filename_compat("Directory", filename_name_only(project.path)); 
	key_release();
	if(path == "") return false;
	
	directory_verify(path);
	
	var _fName = filename_name_only(path);
	var _pName = $"{_fName}_{SAVE_VERSION}.pxc";
	var _tName = $"thumbnail.png";
	var _mName = $"metadata.json";
	
	SAVE_AT(project, filename_combine(path, _pName));
	
	var _thumbSurf = PANEL_PREVIEW.getNodePreviewSurface();
	if(is_surface(_thumbSurf))
		surface_save_safe(_thumbSurf, filename_combine(path, _tName));
	
	json_save_struct(filename_combine(path, _mName), project.meta, true);
	
	return true;
}