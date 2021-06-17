#import "DigitalProjectManagerPlugin.h"
#if __has_include(<digital_project_manager/digital_project_manager-Swift.h>)
#import <digital_project_manager/digital_project_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "digital_project_manager-Swift.h"
#endif

@implementation DigitalProjectManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDigitalProjectManagerPlugin registerWithRegistrar:registrar];
}
@end
