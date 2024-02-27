import http from '@/api'
import { COMMON_ADMIN_API } from '@/api/axios/servicePort'
import { Dict } from '@/api/interface/index'

export const dictConfigList = (params: any, loading: boolean = false) => {
  return http.post<Dict[]>(COMMON_ADMIN_API + '/dictConfig/page ', params, { headers: { loading } })
}

export const dictConfigAdd = (params: any) => {
  return http.post(COMMON_ADMIN_API + '/dictConfig/save ', params)
}

export const dictConfigEdit = (params: any) => {
  return http.post(COMMON_ADMIN_API + '/dictConfig/edit ', params)
}

export const dictConfigDel = (params: any) => {
  return http.post(COMMON_ADMIN_API + '/dictConfig/remove ', params)
}
