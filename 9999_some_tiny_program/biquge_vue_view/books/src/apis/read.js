import service from "@/utils/request.js";

export function GetCates(){
    return service.request({
        method: "get",
        url: "/books_cates",
        // transformResponse: [function (data) {
        //     // Do whatever you want to transform the data
        //     console.log("read.js : data = ", data);
        //     return data;
        // }],
    })
}

export function GetInfoPOST(postParams){
    return service.request({
        method: "post",
        url: postParams.url,
        data: {
            "key":postParams.key,
            "domain":'' //
        }
    })
}

export function GetInfoGET(getParams){
    return service.request({
        method: "get",
        url: getParams.url,
        params: {
            key: getParams.key
          }
    })
}


// axios.get("/api/singer").then((data)=>{

//     console.log(data)

//     })
