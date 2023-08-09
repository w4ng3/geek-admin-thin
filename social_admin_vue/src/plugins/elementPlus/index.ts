import type { App } from 'vue'
import * as Icons from '@element-plus/icons-vue'
import ElementPlus from 'element-plus'

export const setupElementPlus = (app: App<Element>) => {
  Object.keys(Icons).forEach((key) => {
    app.component(key, Icons[key as keyof typeof Icons])
  })
  app.use(ElementPlus)
}
