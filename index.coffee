aliasField = require 'mongoose-aliasfield'

module.exports = (schema, options) ->
	schema.plugin aliasField
	schema.methods.toJSON = () ->
		obj = @.toAliasedFieldsObject()
		# swap _id in id and remove _id
		obj.id = obj._id
		delete obj._id
		obj