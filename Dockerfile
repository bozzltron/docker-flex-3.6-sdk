FROM java:6

# Install Flex SDK 3.6
WORKDIR /tmp
RUN wget http://fpdownload.adobe.com/pub/flex/sdk/builds/flex3/flex_sdk_3.6.0.16995A.zip
RUN mkdir /flex && unzip flex_sdk_3.6.0.16995A.zip -d /flex
RUN rm /tmp/flex_sdk_3.6.0.16995A.zip

# Install ant
RUN apt-get update && apt-get install ant -y

# Add flexTasks and ant-contrib jar files 
ADD /lib /usr/lib

# Update class path
ENV PATH=/flex/bin:/usr/lib:$PATH

WORKDIR /usr/src/
