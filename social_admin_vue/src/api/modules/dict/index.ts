import http from '@/api'

/** 字典管理API */
export const DictList = (params: any) => {
  return http.post('/dict/page ', params)
}

export const DictAdd = (params: any) => {
  return http.post('/dict/save', params)
}

export const DictEdit = (params: any) => {
  return http.post('/dict/edit ', params)
}

export const DictDel = (params: any) => {
  return http.post('/dict/remove ', params)
}
