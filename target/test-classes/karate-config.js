function karateConfig() {

    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);
    karate.configure('logPrettyRequest', true);
    karate.configure('logPrettyResponse', true);
    karate.configure('ssl', true);
    karate.configure('lowerCaseResponseHeaders', true);
    karate.configure('abortedStepsShouldPass', true);


    const defaultEnv = 'dev1';
    const env = karate.env || defaultEnv;
    const apiUrl = 'https://wmxrwq14uc.execute-api.us-east-1.amazonaws.com'

    const endpoints = karate.callSingle('classpath:karate/common/aliases.feature@alias=endpoint')
    const requestSchemas = karate.callSingle('classpath:karate/common/aliases.feature@alias=requestSchema')
    const responseSchemas = karate.callSingle('classpath:karate/common/aliases.feature@alias=responseSchema')
    const defaultAuth = {Authorization: 'Basic VGVzdFVzZXI0MDc6ayo+I14wT30kNSp4'}

    return {
        apiUrl: apiUrl,
        env:env,
        defaultAuth: defaultAuth,
        endpoints: endpoints,
        requestSchemas: requestSchemas,
        responseSchemas: responseSchemas
    };
}