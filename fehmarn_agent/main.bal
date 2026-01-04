import ballerina/ai;
import ballerina/http;

listener ai:Listener odinListener = new (listenOn = check http:getDefaultListener());

service /odin on odinListener {
    private final ai:Agent odinAgent;

    function init() returns error? {
        self.odinAgent = check new (
            systemPrompt = {role: string ``, instructions: string ``}, model = odinModel, tools = [], memory = aiShorttermmemory
        );
    }

    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check self.odinAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
