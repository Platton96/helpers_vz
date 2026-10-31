# helpers_vz

Flutter app for web, iOS and Android.

- Repository: https://github.com/Platton96/helpers_vz
- Web: https://helpers-vz.netlify.app

## Develop

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

## Deploy the web build to Netlify

The site `helpers-vz` is deployed by hand from a local build; there is no git auto-deploy.
The Netlify CLI must be logged in to the account that owns the site (`npx -y netlify-cli login`).

```bash
flutter build web --release
npx -y netlify-cli deploy --prod --dir build/web --site helpers-vz --no-build
```
