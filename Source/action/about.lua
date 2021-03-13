
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "java.io.File"
import "com.androlua.LuaUtil"
import "android.content.res.ColorStateList"
activity.ActionBar.hide()--隐藏标题栏

catkey=(activity.getGlobalData().key)
if catkey and catkey==2020/01/11 then--建议在文件中替换自己的比对key
 else
  print("Running error")
  activity.finish()--关闭当前页面
end
about=
{
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  orientation="vertical";
  {
    LinearLayout;
    layout_width="fill";
    id="status_bar";
    background="#FF56B2DB";
    elevation="2dp";
  };
  {
    LinearLayout;
    layout_height="54dp";
    elevation="2dp";
    layout_width="fill";
    orientation="horizontal";
    background="#FF56B2DB";
    {
      LinearLayout;
      layout_width="55dp";
      layout_height="55dp";
      id="Sideslip";
      gravity="center";
      {
        ImageView;
        src="drawable/back.png";
        layout_height="28dp";
        layout_width="25dp";
        colorFilter="#ffffffff";
      };
    };
    {
      LinearLayout;
      layout_height="fill";
      orientation="horizontal";
      layout_weight="1";
      {
        TextView;
        text="关于";
        textSize="22sp";
        textColor="#ffffffff";
        id="title";
        layout_gravity="center";
      };
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    orientation="vertical";
    layout_height="fill";
    id="主框架";
    {
      ScrollView;
      layout_width="fill";
      layout_height="fill";
      backgroundColor="#DFF7F7F7";
      verticalScrollBarEnabled=false,--隐藏纵向滑条

      {
        LinearLayout;
        layout_width="fill";
        orientation="vertical";
        layout_height="fill";
        id="滑动框架";
        {
          CardView;
          layout_margin="7dp";
          radius="5dp";
          layout_height="wrap";
          elevation="2dp";
          layout_width="fill";
          id="介绍卡片";
          CardBackgroundColor="#ffffffff";
          layout_marginTop="10dp";
          {
            LinearLayout;
            layout_width="fill";
            layout_height="fill";
            orientation="vertical";
            {
              ImageView;
              src="drawable/code.png";
              scaleType="centerInside";
              layout_width="fill";
              id="介绍卡片_图片";
              layout_height="40%w";
              layout_margin="5dp";
            };
            {
              LinearLayout;
              layout_width="fill";
              layout_height="wrap";
              gravity="right";
              {
                TextView;
                layout_margin="6dp";
                text=[==[本应用应用于FusionApp的工程备份。
          如因不兼容问题,用户操作失误,不可抗力等造成的问题，需要用户自行承担责任。
          应用备份目录AProject_Copy,备份目录不完整将无法识别。
]==];
                textSize="12sp";
                layout_height="wrap";
                layout_width="80%w";
                textColor="#FF8A8A8A";
                layout_gravity="right";
                gravity="end";
              };
            };
          };
        };
        {
          CardView;
          layout_margin="7dp";
          layout_height="wrap";
          elevation="2dp";
          layout_width="fill";
          CardBackgroundColor="#ffffffff";
          radius="5dp";
          layout_marginTop="10dp";
          {
            LinearLayout;
            layout_width="fill";
            orientation="vertical";
            layout_height="wrap";
            backgroundColor="#ffffffff";
            {
              TextView;
              layout_height="45dp";
              textSize="15sp";
              text="开发者";
              id="Developer_title";
              layout_width="fill";
              textColor="#FF56B2DB";
              gravity="left|center";
              layout_marginLeft="10dp";
            };
            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              
              

              {
                LinearLayout;
                layout_width="fill";
                orientation="vertical";
                layout_height="wrap";
                backgroundColor="#ffffffff";

                {
                  LinearLayout;
                  layout_height="wrap";
                  layout_width="fill";
                  orientation="horizontal";
                  id="Developer02";
                  backgroundColor="#ffffffff";
                  {
                    CircleImageView;
                    layout_margin="10dp";
                    layout_height="40dp";
                    layout_gravity="center";
                    id="Developer_01";
                    layout_width="40dp";
                  };
                  {
                    LinearLayout;
                    layout_gravity="center";
                    layout_height="wrap";
                    layout_width="fill";
                    orientation="vertical";
                    {
                      TextView;
                      textColor="#F5141414";
                      text="洛樱";
                      textSize="16";
                      id="Developer_name01";
                    };
                    {
                      TextView;
                      id="Developer_info01";
                      text="丢失";
                    };
                  };
                };
              };
            };





            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              {
                LinearLayout;
                layout_width="fill";
                orientation="vertical";
                layout_height="wrap";
                backgroundColor="#ffffffff";
                {
                  LinearLayout;
                  layout_height="wrap";
                  layout_width="fill";
                  orientation="horizontal";
                  id="Developer02";
                  backgroundColor="#ffffffff";
                  {
                    CircleImageView;
                    layout_margin="10dp";
                    layout_height="40dp";
                    layout_gravity="center";
                    id="Developer_02";
                    layout_width="40dp";
                  };
                  {
                    LinearLayout;
                    layout_gravity="center";
                    layout_height="wrap";
                    layout_width="fill";
                    orientation="vertical";
                    {
                      TextView;
                      textColor="#F5141414";
                      text="小奶猫";
                      textSize="16";
                      id="Developer_name02";
                    };
                    {
                      TextView;
                      id="Developer_info02";
                      text="修改优化";
                    };
                  };
                };
              };
            };


            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              {
                LinearLayout;
                layout_width="fill";
                orientation="vertical";
                layout_height="wrap";
                backgroundColor="#ffffffff";
                {
                  LinearLayout;
                  layout_height="wrap";
                  layout_width="fill";
                  orientation="horizontal";
                  id="Developer03";
                  backgroundColor="#ffffffff";
                  {
                    CircleImageView;
                    layout_margin="10dp";
                    layout_height="40dp";
                    layout_gravity="center";
                    id="Developer_03";
                    layout_width="40dp";
                  };
                  {
                    LinearLayout;
                    layout_gravity="center";
                    layout_height="wrap";
                    layout_width="fill";
                    orientation="vertical";
                    {
                      TextView;
                      textColor="#F5141414";
                      text="小奶猫";
                      textSize="16";
                      id="Developer_name03";
                    };
                    {
                      TextView;
                      id="Developer_info03";
                      text="修改优化";
                    };
                  };
                };
              };
            };


          
          
          
          };
        };


        {
          CardView;
          layout_margin="7dp";
          layout_height="wrap";
          elevation="2dp";
          layout_width="fill";
          CardBackgroundColor="#ffffffff";
          radius="5dp";
          layout_marginTop="10dp";
          {
            LinearLayout;
            layout_width="fill";
            orientation="vertical";
            layout_height="wrap";
            backgroundColor="#ffffffff";
            {
              TextView;
              layout_height="45dp";
              textSize="15sp";
              text="设置";
              id="set_title";
              layout_width="fill";
              textColor="#FF56B2DB";
              gravity="left|center";
              layout_marginLeft="10dp";
            };

            {
              LinearLayout;
              orientation="vertical";
              layout_height='60dp';
              layout_width="fill";
              {
                LinearLayout;
                {
                  TextView;
                  layout_width='74%w';
                  layout_height='60dp';
                  gravity='left|center';
                  textColor="#FF222222";
                  text='计算文件大小';
                  layout_marginLeft="6%w";
                  layout_marginTop='0dp';
                  textSize='15sp';
                  --   style="?android:attr/buttonBarButtonStyle";
                };
                {
                  Switch;
                  layout_marginTop='0dp';
                  id="iscount";
                };
              };
            };

            {
              LinearLayout;
              orientation="vertical";
              layout_height='60dp';
              layout_width="fill";
              {
                LinearLayout;
                {
                  TextView;
                  layout_width='74%w';
                  layout_height='60dp';
                  gravity='left|center';
                  textColor="#FF222222";
                  text='显示剩余空间';
                  layout_marginLeft="6%w";
                  layout_marginTop='0dp';
                  textSize='15sp';
                  --   style="?android:attr/buttonBarButtonStyle";
                };
                {
                  Switch;
                  layout_marginTop='0dp';
                  id="is剩余";
                };
              };
            };
            {
              LinearLayout;
              layout_width="fill";
              layout_height="wrap";
              orientation="vertical";
              {
                TextView;
                text="自定义备份目录";
                textColor="#FF222222";
                layout_marginLeft="2%w";
                layout_width="fill";
                gravity="left|center";
                id="DIY目录";
                style="?android:attr/buttonBarButtonStyle";
                textSize="15sp";
                layout_height="wrap";
              };
              {
                TextView;
                text="The path is here";
                textColor="#FF222222";
                layout_marginLeft="2%w";
                layout_width="fill";
                gravity="left|center";
                id="路径喵";
                textSize="10sp";
                layout_marginTop="0dp";
                layout_height="30dp";
              };
            };



          };
        };





        {
          CardView;
          layout_margin="7dp";
          layout_height="wrap";
          elevation="2dp";
          layout_width="fill";
          CardBackgroundColor="#ffffffff";
          radius="5dp";
          layout_marginTop="10dp";
          {
            LinearLayout;
            layout_width="fill";
            orientation="vertical";
            layout_height="wrap";
            backgroundColor="#ffffffff";
            {
              TextView;
              layout_height="45dp";
              textSize="15sp";
              text="其他";
              id="other_title";
              layout_width="fill";
              textColor="#FF56B2DB";
              gravity="left|center";
              layout_marginLeft="10dp";
            };


            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              {
                LinearLayout;
                layout_width="15%w";
                layout_height="15%w";
                gravity="center";
                {
                  ImageView;
                  layout_width="28dp";
                  layout_height="28dp";
                  src="drawable/codes.png";
                };
              };
              {
                TextView;
                layout_margin="1dp";
                text="开源使用";
                textSize="16sp";
                textColor="#FF222222";
                style="?android:attr/buttonBarButtonStyle";
                layout_width="fill";
                id="开源";
                layout_height="fill";
                gravity="top";
                layout_marginTop='4dp';
              };
            };
            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              {
                LinearLayout;
                layout_width="15%w";
                layout_height="15%w";
                gravity="center";
                {
                  ImageView;
                  layout_width="28dp";
                  layout_height="28dp";
                  src="drawable/email.png";
                };
              };
              {
                TextView;
                layout_margin="1dp";
                text="反馈问题";
                textSize="16sp";
                textColor="#FF222222";
                style="?android:attr/buttonBarButtonStyle";
                layout_width="fill";
                id="反馈";
                layout_height="fill";
                -- layout_marginTop='4dp';
                gravity="top";
              };
            };
          };
        };
        --{
        --CardView;
        --};
      };
    };
  };
};


activity.setContentView(loadlayout(about))--设置窗口视图
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)--淡入淡出
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF56B2DB)



Sideslip.onClick=function()
  activity.finish()--关闭当前页面
end

function 中部提示(info)
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

function 波纹(id,颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end
function FakeBoldText(ID)
  if pcall(function()
      import "android.graphics.Paint"
      ID.getPaint().setFakeBoldText(true)
    end) then
   else
    print"字体粗化设置出错"
  end
end

function setbitmap(ID,address)
  if pcall(function()
      address=tostring(address)
      ID.setImageBitmap(loadbitmap(address))
    end) then
   else
    print"图片设置错误"
  end
end
--写入数据函数
function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end

function getData(name,key)--验证
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end

波纹(Sideslip,0x98FFFFFF)
FakeBoldText(other_title)
FakeBoldText(Developer_title)
FakeBoldText(set_title)


Developer_name01.setText("洛樱")
Developer_info01.setText("美化修改打包")
Developer_name02.setText("Jesse205")
Developer_info02.setText("核心功能开源原作者")
Developer_name03.setText("小奶猫")
Developer_info03.setText("优化处理")

setbitmap(Developer_01,"https://i0.hdslb.com/bfs/face/7865ed1e1a9bb699ebed3838b81cda09b0655f8e.jpg")
setbitmap(Developer_02,"http://q.qlogo.cn/headimg_dl?dst_uin=2055675594&spec=640&img_type=jpg")
setbitmap(Developer_03,"http://q.qlogo.cn/headimg_dl?dst_uin=2673026892&spec=640&img_type=jpg")


InputLayouts={
  LinearLayout;
  orientation="vertical";
  Focusable=true,
  FocusableInTouchMode=true,
  {
    TextView;
    id="Prompt",
    textSize="15sp",
    layout_marginTop="10dp";
    layout_marginLeft="3dp",
    layout_width="80%w";
    layout_gravity="center",
    text="路径格式要正确哦,末尾不要加 / ";
  };
  {
    EditText;
    hint="输入新路径";
    layout_marginTop="5dp";
    layout_width="80%w";
    layout_gravity="center",
    id="edit";
  };
  {
    CheckBox;
    text="删除旧目录";
    id="删除";
    layout_marginLeft="5dp",
  };
};

DIY目录.onClick=function()
  AlertDialog.Builder(this)
  .setTitle("自定义[不稳定]")
  .setView(loadlayout(InputLayouts))
  .setPositiveButton("确定",{onClick=function(v)
      pathto=edit.getText()

      backupPaths=getData("str","backupPath")
      olds=getData("str","backupPath_old")
      --判断
      if pathto==nil or pathto=="" then
        中部提示("请输入路径")
       else
        if tostring(pathto)==(backupPaths) then
          中部提示("重复设置")
         else
          putData("str","backupPath_old",tostring(backupPaths))
          putData("str","backupPath",tostring(pathto))
          中部提示("设置成功")
          移动到新路径(backupPaths,pathto)
        end

      end
      刷新布局路径()
  end})
  .setNeutralButton("恢复默认",{onClick=function(v)

      backupPaths=getData("str","backupPath")
      olds=getData("str","backupPath_old")
      默认=(Environment.getExternalStorageDirectory().toString().."/AProject_Copy")
      if getData("str","backupPath")==默认 then
        中部提示("已是默认")
       else
        putData("str","backupPath_old",tostring(backupPaths))
        putData("str","backupPath",默认)
        中部提示("已恢复默认")
        移动到新路径(backupPaths,默认)
      end
      刷新布局路径()
  end})
  .setNegativeButton("取消",nil)
  .show()


  local paths=getData("str","backupPath")
  --putData("str","backupPath_old",tostring(paths))
  if paths==nil or paths=="" then
    --putData("str","backupPath_old",tostring(paths))
    edit.setText(Environment.getExternalStorageDirectory().toString().."/AProject_Copy")
   else
    edit.setText(getData("str","backupPath"))
  end
  监听开关(删除,"是否删除")
end

开源.onClick=function()
  activity.newActivity("action/git")
end

反馈.onClick=function()
  activity.newActivity("action/post")
end


function 监听开关(ID,path)
  --启动模式选择监听
  if pcall(function()
      path=tostring(path)
      ID.setOnCheckedChangeListener{
        onCheckedChanged=function(g,c)
          if c==true then
            putData("switch",path,"true")
            --   io.open(path,"w+"):write("true"):close()
           else
            -- io.open(path,"w+"):write("false"):close()
            putData("switch",path,"false")
          end
      end}
      if getData("switch",path)=="true" then
        ID.setChecked(true)
       else
        ID.setChecked(false)
      end
    end) then
   else
    print("请开放存储权限")
  end
end
function 设置开关颜色(ID,Groove,Keys)
  if pcall(function()
      ID.ThumbDrawable.setColorFilter(PorterDuffColorFilter(Groove,PorterDuff.Mode.SRC_ATOP))
      ID.TrackDrawable.setColorFilter(PorterDuffColorFilter(Keys,PorterDuff.Mode.SRC_ATOP))
    end) then else
    print("按钮颜色设置错误")
  end
end


监听开关(iscount,"是否计数")
设置开关颜色(iscount,0xFF74AAFF,0xDA0E45A0)

监听开关(is剩余,"是否剩余")
设置开关颜色(is剩余,0xFF74AAFF,0xDA0E45A0)


--设置开关颜色(删除,0xFF74AAFF,0xDA0E45A0)



function executeState2Toast(succeed,exit,num,name)
  if succeed then
    中部提示(name.."成功")
   else
    中部提示(name.."失败")
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

function 刷新布局路径()
  路径喵.setText(getData("str","backupPath"))
end



function 移动到新路径(backupPathto,cofile)

  --[

  --]]
  activity.getGlobalData()["cofile"]=cofile
  activity.getGlobalData()["backupPathto"]=backupPathto
  AlertDialog.Builder(this)
  .setTitle("复制目录？")
  .setMessage(("复制旧目录“%s”工程至新目录吗？新目录中的文件会被替换。   \n 警告: 如果文件太多请手动转移目录，使用LuaUtil.copyDir处理大量文件，有复制缺失风险。"):format(backupPathto))
  .setPositiveButton("确定",function()
    showLoadingDia("正在排队")
    activity.newTask(function(backupPath,cofile)
      cofile=activity.getGlobalData()["cofile"]
      backupPathto=activity.getGlobalData()["backupPathto"]

      -- print(cofile)
      -- print(backupPathto)
      require "import"
      import "java.io.File"
      import "android.os.Environment"
      f=File(tostring(cofile).."/backup").mkdirs()
      file=File(backupPathto)
      this.update("正在复制文件")
      -- return os.execute(("cp -r '%s' '%s'"):format(cofile,backupPathto))
      -- end
      --[
      for index,content in ipairs(luajava.astable(file.listFiles())) do

        if not(os.execute(("cp -r -f '%s' '%s'"):format(tostring(content),cofile)))
          return false
        end
      end
      luajava.clear(file)
      return true
    end
    --]]
    ,function(info)
      showLoadingDia(info)
    end
    ,function(succeed,exit,num)
      closeLoadingDia()
      executeState2Toast(succeed,exit,num,"复制")
      if succeed then
        if getData("switch","是否删除")=="true" then
          os.execute("rm -r "..backupPathto)
          中部提示("已删除旧目录")
         else
        end
       else
      end
    end).execute({backupPath,date,FAPath})
  end)
  .setNegativeButton("取消",nil)
  .show()
end


刷新布局路径()

