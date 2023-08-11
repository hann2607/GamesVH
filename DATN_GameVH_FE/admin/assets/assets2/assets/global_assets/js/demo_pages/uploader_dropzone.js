/* ------------------------------------------------------------------------------
 *
 *  # Dropzone multiple file uploader
 *
 *  Demo JS code for uploader_dropzone.html page
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

var DropzoneUploader = function() {


    //
    // Setup module components
    //

    // Dropzone file uploader
    var _componentDropzone = function() {
        // Removable thumbnails
        Dropzone.options.dropzoneRemove = {
            paramName: "file", // The name that will be used to transfer the file
            dictDefaultMessage: 'Drag and drop a file here or click<span>VERTICAL PHOTO</span>',
            maxFiles: 3,
            addRemoveLinks: true
        };
    };

    //
    // Return objects assigned to module
    //

    return {
        init: function() {
            _componentDropzone();
        }
    }
}();


// Initialize module
// ------------------------------

DropzoneUploader.init();
