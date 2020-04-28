ARG NODE_VERSION="12"

FROM node:$NODE_VERSION

LABEL name="Expo for Docker"
LABEL repository="https://github.com/whitelabelco/expo-cli-images"
LABEL homepage="https://github.com/whitelabelco/expo-cli-images"
LABEL maintainer="Daniel Graham <dgraham@wlabel.co>"

ARG EXPO_VERSION="latest"

RUN yarn global add expo-cli@$EXPO_VERSION \
	&& yarn cache clean

COPY entrypoint.sh LICENSE.md README.md /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
