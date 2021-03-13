

require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

BaoMing=tostring(activity.getPackageName())
if BaoMing ~= "com.fix.Fa.BackupHelper" then
  Toast.makeText(activity,"应用被修改" , Toast.LENGTH_SHORT ).show()
   --activity.finish()
end

import "android.graphics.Color"
activity.getGlobalData()['key']=2020/01/11--默认key，建议自己改改
import "java.io.*"
import "libs.core"

--import "com.nirenr.Color"
import "chart.layout"
import "item"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"


--导入类
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"

import "com.androlua.ZipUtil"
import "com.androlua.util.ZipUtil"
import "java.lang.String"


activity.ActionBar.hide()--隐藏标题栏

--activity.ActionBar.hide()activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
设置状态栏颜色(0xFF56B2DB)
 activity.setContentView(loadlayout("chart/layout"))

--activity.setLuaExtDir("Android/data/"..activity.getPackageName())

Pro1.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(0xFF74AAFF,PorterDuff.Mode.SRC_ATOP))

Ripple(startBackup,淡色强调波纹)

AutoSetToolTip(startBackup,"备份工程")


--import "com.androlua.R"
--activity.setTheme(R.style.一斥染)

startBackup.onClick=function()
  AlertDialog.Builder(this)
  .setTitle("备份工程")
  .setMessage("确定要备份吗？这可能需要一些时间。\n备份至/storage/emulated/0/AProject_Copy/")
  .setPositiveButton("确定",function()
    backupProject()
  end)
  .setNegativeButton("取消",nil)
  .show()
end




--getFolderSize(文件夹路径,是否进行转换true或false)


function Refresh()
  sr.setRefreshing(true)
  检查目录()
  检查路径()
  if getData("switch","是否剩余")=="true" then
    剩余.setVisibility(View.VISIBLE)
    剩余.setText("剩余:"..GetSurplusSpace())
   else
    剩余.setVisibility(View.INVISIBLE)
  end

  if getData("switch","是否计数")=="true" then
    activity.getGlobalData()["iscount"]="true"
   else
    activity.getGlobalData()["iscount"]="false"
  end
  activity.newTask(function(backupDirFile,backupPath)
    require "import"
    import "java.io.*"
    -- print(activity.getGlobalData()["iscount"])
    fl=luajava.astable(backupDirFile.listFiles())
    table.sort(fl,function(a,b)
      return string.upper(a.Name)<string.upper(b.Name)
    end)

    if pcall(function()------------------------
        datas={}
        function getDirNumber(file,dirname)
          import "java.io.*"
          if not(File(tostring(file).."/"..dirname)).exists() then
            print("缺少需要的目录，已经自动生成")
            File(tostring(file).."/"..dirname).mkdirs()
          end
          --      if File(tostring(file).."/"..dirname).isDirectory() then
          local file=File(tostring(file).."/"..dirname)
          local list=file.listFiles()
          local tableList=luajava.astable(list)
          local number=table.size(tableList)
          luajava.clear(file)
          luajava.clear(list)
          local tableList=nil
          return number
          --     else
          --       File(tostring(file).."/"..dirname).mkdirs()
          -- print("不存在")
          --   end
        end

        function getFolderSize(folderPath,conversion)
          import "java.io.*"
          local size = 0
          local fileList = luajava.astable(File(folderPath).listFiles())
          if(fileList == nil) then
            return 0
          end
          --开始遍历循环获取文件夹底下所有文件的字节大小
          if(fileList ~= nil) then
            for count=1,#fileList do
              if(File(tostring(fileList[count])).isDirectory()) then
                size = size + getFolderSize(tostring(fileList[count]))
               else
                local singleFileSize = File(tostring(fileList[count])).length()
                size = size + singleFileSize
              end
            end
          end
          --字节换算
          if(conversion == true) then
            local GB = 1024 * 1024 * 1024;--定义GB的计算常量
            local MB = 1024 * 1024;--定义MB的计算常量
            local KB = 1024;--定义KB的计算常量
            local countResult = ""
            if(size / GB >= 1) then
              --如果当前Byte的值大于等于1GB
              countResult = string.format("%.2f",size / GB).."GB"
              return countResult
             elseif (size / MB >= 1) then
              --如果当前Byte的值大于等于1MB
              countResult = string.format("%.2f",size / MB).."MB"
              return countResult
             elseif (size / KB >= 1) then
              --如果当前Byte的值大于等于1KB
              countResult = string.format("%.2f",size / KB).."KB"
              return countResult
             else
              local countResult = size.."B"
              return countResult
            end
           elseif(conversion == nil or conversion == false) then
            return size
          end
        end

        function 边框圆角(边宽度,边框色,背景色,圆角度)
          import "android.graphics.drawable.GradientDrawable"
          drawable = GradientDrawable()
          drawable.setShape(GradientDrawable.RECTANGLE)
          drawable.setStroke(边宽度,tonumber(边框色))
          drawable.setColor(tonumber(背景色))
          drawable.setCornerRadius(圆角度)
          return drawable
        end


        for index,content in ipairs(fl) do
          if content.isDirectory() then
            if activity.getGlobalData()["iscount"]=="true" then
              table.insert(datas,{
                date=content.getName(),
                projectNumber="工程数："..getDirNumber(content,"Project"),
                backupNumber="备份数："..getDirNumber(content,"Export"),
                totalsize="大小："..getFolderSize(tostring(content),true),
                apkNumber="APK数："..getDirNumber(content,"apk"),
                卡片={BackgroundDrawable=边框圆角(4,0xFF56B2DB,0xefffffff,22)},
              })

             else
              table.insert(datas,{
                date=content.getName(),
                projectNumber="工程数："..getDirNumber(content,"Project"),
                backupNumber="备份数："..getDirNumber(content,"Export"),
                --          totalsize="大小："..getFolderSize(tostring(content),true),
                apkNumber="APK数："..getDirNumber(content,"apk"),
                卡片={BackgroundDrawable=边框圆角(4,0xFF56B2DB,0xefffffff,22)},
              })
            end

          end
        end
        ------------------------
      end) then
     else
      print("不可预料的错误!请手动修正/AProject_Copy/，备份目录下不要有影响读取的文件，确保含有Project，apk，Export文件夹")
    end------------------------
    return datas
  end
  ,function(datas)
    _G.datas=datas
    Pro1.setVisibility(View.GONE)
    if adp then
      luajava.clear(adp)
    end
    adp=LuaAdapter(activity,datas,item)
    listView.Adapter=adp

    sr.setRefreshing(false)
  end).execute({backupDirFile})
end

--adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(datas))
animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)
lac = LayoutAnimationController(animation)
lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
lac.setDelay(0.7)--单位是秒
--listView.setAdapter(adp)
listView.setLayoutAnimation(lac)

function sharezip(date)
  AlertDialog.Builder(this)
  .setTitle("压缩")
  .setMessage(("确认压缩 “%s” 吗？因文件大小异同，需要不同时长来处理此请求"):format(date))
  .setPositiveButton("确定",function()
    sr.setRefreshing(true)
    showLoadingDia("正在排队")
    activity.newTask(function(backupPath,date)
      require "import"
      this.update("正在压缩中...")
      return ZipUtil.zip(backupPath.."/backup/"..date,backupPath.."/zip")
      -- os.execute(("rm -r '%s'"):format(backupPath.."/"..date))
    end
    ,function(info)
      showLoadingDia(info)
    end
    ,function(succeed,exit,num)
      Refresh()
      closeLoadingDia()
      executeState2Toast(succeed,exit,num,"压缩")
      print("已保存至"..backupPath.."/zip/"..date..".zip".."，删除请手动删除")
      分享文件(backupPath.."/zip/"..date..".zip")
    end).execute({backupPath,date})
  end)
  .setNegativeButton("取消",nil)
  .show()
end


function delBackup(date)
  AlertDialog.Builder(this)
  .setTitle("删除备份")
  .setMessage(("确定删除备份 “%s” 吗？删除后不可恢复哦"):format(date))
  .setPositiveButton("确定",function()
    sr.setRefreshing(true)
    showLoadingDia("正在排队")
    activity.newTask(function(backupPath,date)
      require "import"
      this.update("正在删除文件")
      return os.execute(("rm -r '%s'"):format(backupPath.."/backup/"..date))
    end
    ,function(info)
      showLoadingDia(info)
    end
    ,function(succeed,exit,num)
      Refresh()
      closeLoadingDia()
      executeState2Toast(succeed,exit,num,"删除")
    end).execute({backupPath,date})
  end)
  .setNegativeButton("取消",nil)
  .show()
end


function reBackup(date)
  AlertDialog.Builder(this)
  .setTitle("恢复备份")
  .setMessage(("确定恢复备份“%s”吗？这会覆盖当前的工程"):format(date))
  .setPositiveButton("确定",function()
    sr.setRefreshing(true)
    showLoadingDia("正在排队")
    activity.newTask(function(backupPath,date,FAPath)
      require "import"
      import "java.io.File"
      file=File(backupPath.."/backup/"..date)
      this.update("正在复制文件")
      for index,content in ipairs(luajava.astable(file.listFiles())) do
        if not(os.execute(("cp -r -f '%s' '%s'"):format(tostring(content),FAPath))) then
          return false
        end
      end
      luajava.clear(file)
      return true
    end
    ,function(info)
      showLoadingDia(info)
    end
    ,function(succeed,exit,num)
      Refresh()
      closeLoadingDia()
      executeState2Toast(succeed,exit,num,"恢复")
    end).execute({backupPath,date,FAPath})
  end)
  .setNegativeButton("取消",nil)
  .show()
end


function backupProject(callback)
  sr.setRefreshing(true)
  showLoadingDia("正在排队")
  activity.newTask(function(backupPath,FAPath)
    require "import"
    import "android.os.Environment"
    this.update("正在复制文件")
    return os.execute(("cp -r '%s' '%s'"):format(FAPath,backupPath.."/backup"..os.date("/Project_%Y-%m-%d%H%M%S")))
  end
  ,function(info)
    showLoadingDia(info)
  end
  ,function(succeed,exit,num)
    Refresh()
    closeLoadingDia()
    executeState2Toast(succeed,exit,num,"备份")
    if callback then
      callback(succeed,exit,num)
    end
  end).execute({backupPath,FAPath})
end


items={}
table.insert(items,"还原备份")
table.insert(items,"压缩分享")


listView.onItemClick=function(l, v, d, p)
  local date=datas[p].date
  local apk=datas[p].apkNumber
  local bac=datas[p].backupNumber
  local pro=datas[p].projectNumber
  AlertDialog.Builder(this)
  .setTitle("工程备份")
  .setMessage("名称 :"..date.."\n"..pro.."\n"..bac.."\n"..apk)
  .setPositiveButton("其他操作",function()
    --列表对话框
    AlertDialog.Builder(this)
    .setTitle("选择操作")
    .setItems(items,{onClick=function(l,v)
        if (items[v+1])=="还原备份" then
          reBackup(date)
        end
        if (items[v+1])=="压缩分享" then
          sharezip(date)
        end
    end})
    .show()

  end)
  .setNeutralButton("删除备份",function()
    delBackup(date)
  end)
  .setNegativeButton("取消",function()

  end)
  .show()
end


sr.setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{onRefresh=function()
    Refresh()
    --    sr.setRefreshing(false);
end})
sr.setColorSchemeColors({0xFF74AAFF});


--MyStyle.SwipeRefreshLayout(sr).setOnRefreshListener(SwipeRefreshLayout.OnRefreshListener{onRefresh=Refresh})
function onResume()
  Refresh()
end


波纹(menus,0x5FFFFFFF)
menus.onClick=function()
  activity.newActivity("action/about")--跳转页面
end


--此函数不开源，抱歉

--检测更新("https://wds.ecsxs.com/205.html","https://wds.ecsxs.com/25.html",nil)
