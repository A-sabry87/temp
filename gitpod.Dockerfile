FROM ghcr.io/gitpod-io/workspace-full

# Java & Android dependencies
RUN sudo apt-get update && sudo apt-get install -y openjdk-11-jdk wget unzip

# Install Android SDK
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip && \
    unzip cmdline-tools.zip -d /home/gitpod/android && \
    rm cmdline-tools.zip

ENV ANDROID_SDK_ROOT=/home/gitpod/android
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

RUN yes | sdkmanager --sdk_root=$ANDROID_SDK_ROOT --licenses && \
    sdkmanager --sdk_root=$ANDROID_SDK_ROOT \"platform-tools\" \"platforms;android-34\" \"build-tools;34.0.0\"
