export default class RequestLogger{

    static ipLogs = []
    static idLogs = []

    getRequestCountID(req, id){
        let logs = RequestLogger.idLogs.filter(
            (idLog) => (idLog.id == id && idLog.request == req)
        )

        return logs.length
    }

    getRequestCountIP(req, ip){
        let logs = RequestLogger.ipLogs.filter(
            (ipLog) => (ipLog.ip == ip && ipLog.request == req)
        )

        return logs.length
    }

    addIPLog(request, ip){
        RequestLogger.ipLogs.push({
            ip,
            request
        })
    }

    addIDLog(request, id){
        RequestLogger.idLogs.push({
            id,
            request
        })
    }
}