// https://develop.sentry.dev/sdk/event-payloads/breadcrumbs

/// Adds a breadcrumb to an array of breadcrumbs which will be send to Sentry whenever the game crashes
///
/// @param string  Human-readable message
/// @param struct  Custom struct with optional extra data

function SnitchSentryBreadcrumb(_message, _data=undefined)
{
	if (SNITCH_BREADCRUMBS_MAX <= 0) return;

	var _struct = {
		message : string(_message)
	}
	
	// Add optional data if its defined
	if (_data != undefined)
	{
		_struct.data = _data;
	}
	
	//Route this struct into SnitchSentryBreadcrumbExt()
	SnitchSentryBreadcrumbExt(_struct);
}