import service from "@/utils/request.js";

export function GetCate(){
    return service.request({
        method: "get",
        url: "/books_cate",
        // transformResponse: [function (data) {
        //     // Do whatever you want to transform the data
        //     console.log("read.js : data = ", data);
        //     return data;
        // }],
    })
}

export function GetInfo(params){
    return service.request({
        method: "post",
        url: params.url,
        data: params.data
    })
}


// axios.get("/api/singer").then((data)=>{ 

//     console.log(data) 
    
//     })
