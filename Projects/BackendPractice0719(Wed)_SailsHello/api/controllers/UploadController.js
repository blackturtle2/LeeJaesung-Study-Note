/**
 * UploadController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {
	index : function(req,res){
        sails.log('upload started')

        req.file('test').upload({
    // don't allow the total upload size to exceed ~10MB
    maxBytes: 10000000
  },function whenDone(err, uploadedFiles) {
      sails.log('upload done')
    if (err) {
      return res.negotiate(err);
    }

    // If no files were uploaded, respond with an error.
    if (uploadedFiles.length === 0){
      return res.badRequest('No file was uploaded');
    }

    if (err) return res.negotiate(err);
      return res.json({
          message: uploadedFiles.length + ' file(s) uploaded successfully!'
      })

  });
}

};

