import http from '@/api'
import { Dict } from '@/api/interface/index'

export const dictConfigList = (params: any, loading: boolean = false) => {
  return http.post<Dict[]>('/dictConfig/page ', params, { headers: { loading } })
}

export const dictConfigAdd = (params: any) => {
  return http.post('/dictConfig/save ', params)
}

export const dictConfigEdit = (params: any) => {
  return http.post('/dictConfig/edit ', params)
}

export const dictConfigDel = (params: any) => {
  return http.post('/dictConfig/remove ', params)
}
