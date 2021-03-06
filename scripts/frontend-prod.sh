#/bin/sh

cd ../../frontend
npm install
NODE_OPTIONS='--max-old-space-size=4096' npm run build
aws s3 sync dist s3://app.mipaquete.com --delete --profile mipaquete-prod
aws cloudfront create-invalidation --distribution-id E24OJDWEYF09KH --paths "/*" --profile mipaquete-prod
