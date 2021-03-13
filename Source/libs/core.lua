
App={}
import "android.content.res.ColorStateList"
import "android.support.v4.widget.*"
import "android.os.*"
import "java.util.Formatter"
import "java.util.logging.Formatter"
import "java.lang.Integer"
import "android.net.Uri"


catkey=(activity.getGlobalData().key)
if catkey and catkey==2020/01/11 then--建议在文件中替换自己的比对key
 else
  print("Running error")
  activity.finish()--关闭当前页面
end


function MyToast(info)
  sth=tostring(info)
  body={
    CardView;
    CardBackgroundColor="#C0000000";
    elevation="0dp";
    -- layout_width="95%w";
    layout_height="42dp";
    radius="18dp";
    id="Toastbody";
    {
      TextView;
      textSize="15sp";
      TextColor="#FFffffff";
      layout_width="45%w";
      layout_height="42dp";
      gravity="center";
      text="出错";
      id="Toastmessage";
    };
  }
  local Toastbody=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(body))
  Toastbody.setGravity(Gravity.CENTER,0,60)
  Toastmessage.Text=tostring(sth)
  Toastbody.show()
  return Toastbody
end

function 修改颜色强度(强度,颜色)--16进制
  return (tonumber("0x"..强度..string.sub(Integer.toHexString(颜色),3,8)))
end

function Ripple(id,color,t)
  local ripple
  if t=="circle" or not(t) then
    if not(RippleCircular) then
      RippleCircular=activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    end
    ripple=RippleCircular
   elseif t=="square" then
    if not(RippleSquare) then
      RippleSquare=activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    end
    ripple=RippleSquare
  end

  local drawable=activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color}))
  if id then
    id.setBackground(drawable)
   else
    return drawable
  end

end


function AutoSetToolTip(view,text)
  if tonumber(Build.VERSION.SDK) >= 26 then
    view.setTooltipText(text)
  end
end

MyStyle={}
function MyStyle.SwipeRefreshLayout(view)
  view.setProgressViewOffset(true,0,64)
  --  view.setColorSchemeColors({强调色})
  view.setProgressBackgroundColorSchemeColor(背景颜色)
  return view
end
function executeState2Toast(succeed,exit,num,name)
  if succeed then
    MyToast(name.."成功")
   else
    MyToast(name.."失败")
  end
end
function showLoadingDia(message)
  if not(loadingDia) then
    loadingDia=ProgressDialog(this)
    loadingDia.setProgressStyle(ProgressDialog.STYLE_SPINNER)
    loadingDia.setTitle("耐心等候...")
    loadingDia.setCancelable(false)
    loadingDia.setCanceledOnTouchOutside(false)
    loadingDia.setOnCancelListener{
      onCancel=function()
        loadingDia=nil
    end}
    loadingDia.show()
  end
  loadingDia.setMessage(message)
end

function closeLoadingDia()
  if loadingDia then
    loadingDia.dismiss()
    loadingDia=nil
  end
end


local array = activity.getTheme().obtainStyledAttributes({
  android.R.attr.colorAccent,
  android.R.attr.windowBackground,
})
App.color={}

App.color.colorAccent=array.getColor(0,0x51A8DD)
App.color.windowBackground=array.getColor(1,0x51A8DD)
强调色=App.color.colorAccent
背景颜色=App.color.windowBackground
淡色强调波纹=修改颜色强度(34,强调色)


--写入数据函数
function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end

function getData(name,key)--验证
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end



function 分享文件(路径)
  --  print(路径)
  if pcall(function()
      import "android.webkit.MimeTypeMap"
      import "android.content.Intent"
      import "android.net.Uri"
      import "java.io.File"
      FileName=tostring(File(路径).Name)
      ExtensionName="txt"
      --FileName:match(".+%.(%w+)$")
      Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
      intent=Intent()
      intent.setAction(Intent.ACTION_SEND)
      intent.setType(Mime)
      file=File(路径)
      uri=Uri.fromFile(file)
      intent.putExtra(Intent.EXTRA_STREAM,uri)
      intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      activity.startActivity(Intent.createChooser(intent,"分享工程压缩包"))
    end) then
   else
    print("分享出错")
  end
end



function 获取SDK版本()
  return tonumber(Build.VERSION.SDK)
end
function 设置状态栏颜色(n)
  window=activity.getWindow()
  window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
  window.setStatusBarColor(n)
  if n==0x3f000000 then
    if 获取SDK版本()>=23 then
      window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
      window.setStatusBarColor(0xffffffff)
    end
  end
end




function 波纹(id,颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end










function 提示(text,color)
  text=tostring(text)
  if color==nil then
    color="#CC4E93D8"
  end
  color=tostring(color)
  Toastbody={
    LinearLayout,
    layout_width="100%w";
    gravity="center";
    layout_height="fill";
    background=color;
    {
      TextView;
      gravity="center";
      text="空!";
      id="Toast_TextView";
      textColor="#FFFDFDFD";
      textSize=="15sp";
      layout_width="110%w";
      layout_height="36dp";
    };
  }
  local Toastbody=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(Toastbody))
  --LENGTH_SHORT     2s
  --LENGTH_LONG      3.5s
  --Gravity.BOTTOM   底部
  --Gravity.CENTER   中部
  --Gravity.TOP      顶部
  Toastbody.setGravity(Gravity.BOTTOM,0,0)
  Toast_TextView.Text=tostring(text)
  Toastbody.show()
end

function 检查路径()
  local nowto=getData("str","backupPath")
  if nowto==nil or nowto=="" then
    backupPath=Environment.getExternalStorageDirectory().toString().."/AProject_Copy"
    putData("str","backupPath",backupPath)
   else
    backupPath=getData("str","backupPath")
    --print(backupPath)
    if backupPath==nil then
      backupPath=Environment.getExternalStorageDirectory().toString().."/AProject_Copy"
    end
  end
  backupDirFile=File(backupPath.."/backup")
  if not(backupDirFile).exists() then
    backupDirFile.mkdirs()
  end
end
--backupPath="/data/data/"..activity.getPackageName().."/backupFA"


FAPath=Environment.getExternalStorageDirectory().toString().."/FusionApp"
检查路径()





function 检查目录()
  if pcall(function()------------------------

      import "java.io.*"
      fl=luajava.astable(backupDirFile.listFiles())
      local POS={}
      if (dump(fl))==(dump(POS)) then
        提示("暂无备份")
        没有工程.setVisibility(View.VISIBLE)
        Pro1.setVisibility(View.GONE)
        点击刷新.onClick=function()
          Refresh()
        end
       else
        没有工程.setVisibility(View.GONE)
      end
    end) then
   else
    print("刷新错误  :(")
  end
end


function GetSurplusSpace()
  import "java.io.*"
  import "android.text.format.Formatter"
  fs = StatFs(Environment.getDataDirectory().getPath())
  size = Formatter.formatFileSize(activity, (fs.getAvailableBytes()))
  return size
end




function 检测更新(URL,PURL,headerua)

end

