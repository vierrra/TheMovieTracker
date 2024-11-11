# Uncomment the next line to define a global platform for your project
# platform :ios, '15.0'

target 'TheMovieTracker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'

  target 'TheMovieTrackerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TheMovieTrackerUITests' do
    # Pods for testing
  end

end

# O bloco post_install é executado após a instalação dos pods.
# Aqui, garantimos que todos os pods usem o mesmo IPHONEOS_DEPLOYMENT_TARGET que o projeto principal.
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # Esta linha define a versão mínima do iOS para todos os pods instalados, garantindo que eles
      # sejam compatíveis com a versão mínima do iOS definida para o projeto principal.
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
