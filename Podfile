# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Pointer' do
 pod 'SDWebImage'
  pod 'IQKeyboardManagerSwift'
  pod 'ObjectMapper', '~> 3.5'
  pod 'TagListView', '~> 1.4.1'
  pod 'FittedSheets', '~> 2.5'
  pod 'Alamofire', '~> 4.6'
  pod 'MBProgressHUD'
  pod 'razorpay-pod', '1.2.5'
  pod 'FittedSheets', '~> 2.5'
  pod 'ChatGPTSwift'
  pod 'Cosmos'
  pod 'TinyConstraints'
  pod 'Switches'
  pod 'FSCalendar'
  pod 'JGProgressHUD'
  pod 'AWSS3'
  pod 'AWSCore'
  pod 'ADDatePicker'
  
  post_install do |installer| 
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
                 end
            end+
     end
  end

end
