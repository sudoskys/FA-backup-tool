require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "android.net.Uri"
import "android.graphics.*"
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"


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
  orientation="vertical";
  layout_height="fill";
  {
    LinearLayout;
    layout_width="fill";
    id="status_bar";
    background="#FF56B2DB";
    elevation="2dp";
  };
  {
    LinearLayout;
    layout_width="fill";
    layout_height="54dp";
    elevation="2dp";
    orientation="horizontal";
    background="#FF56B2DB";
    {
      LinearLayout;
      layout_width="55dp";
      layout_height="55dp";
      gravity="center";
      id="Sideslip";
      {
        ImageView;
        layout_width="25dp";
        colorFilter="#ffffffff";
        src="drawable/back.png";
        layout_height="28dp";
      };
    };
    {
      LinearLayout;
      layout_weight="1";
      orientation="horizontal";
      layout_height="fill";
      {
        TextView;
        textSize="22sp";
        textColor="#ffffffff";
        text="开源使用";
        layout_gravity="center";
        id="title";
      };
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    id="主框架";
    {
      LinearLayout;
      layout_width="fill";
      layout_height="fill";
      orientation="vertical";
      {
        ListView;
        layout_height="match_parent";
        VerticalScrollBarEnabled=false;
        layout_width="match_parent";
        backgroundColor="#DFF7F7F7";
        dividerHeight=0;
        id="github_list";
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
function 浏览器打开(链接)
  if pcall(function()
      import "android.content.Intent"
      import "android.net.Uri"
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(链接))
      activity.startActivity(viewIntent)
    end) then
   else
    print"打开错误"
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


波纹(Sideslip,0x98FFFFFF)


--反馈.onClick=function()
--activity.newActivity("post")--跳转页面
--end





luoying={
  LinearLayout;
  layout_width="fill";
  {
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  gravity="center";
  layout_height="wrap";
  {
    CardView;
    layout_width="fill";
    layout_margin="8dp";
    elevation="3dp";
    radius="6dp";
    layout_height="22%w";
    CardBackgroundColor="#ffffffff";
    id="列表card";
    {
      LinearLayout;
      layout_width="fill";
      layout_margin="4dp";
      orientation="horizontal";
      layout_height="fill";
      {
        LinearLayout;
        layout_width="16%w";
        gravity="center";
        layout_height="fill";
        {
          CircleImageView;
          layout_width="40dp";
          layout_margin="10dp";
          layout_height="40dp";
          layout_gravity="center";
          id="pic";
        };
      };
      {
        LinearLayout;
        layout_width="fill";
        gravity="center";
        orientation="vertical";
        layout_height="fill";
        {
          LinearLayout;
          layout_width="fill";
          layout_height="11%w";
          {
            TextView;
            textSize="18sp";
            textColor="#FF222222";
            layout_height="fill";
            gravity="center";
            layout_margin="6dp";
            text="开源工程";
            id="name";
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          layout_height="11%w";
          {
            TextView;
            layout_margin="6dp";
            text="此工程的介绍FF222222FF222222FF222222FF222222";
            id="jianjie";
          };
          {
            TextView;
            layout_width="0";
            layout_height="0";
            id="url";
          };
        };
      }
      };
    };
  };
};



--载入布局事件
data={}
adp=LuaAdapter(activity,data,luoying)
github_list.Adapter=adp
--列表点击事件
--miao_list.onItemLongClick
github_list.onItemClick=function(parent,v,pos,id)
  local links=v.Tag.url.text
  --调用方法
  浏览器打开(links)
end
--长按动画
github_list.onItemLongClick=function(parent,v,pos,id)
end


pics="drawable/githubpic.png"
pic2="drawable/dingtalk.png"




adp.add{name="Andlua",jianjie="Lua5.3.3 for android pro",pic=loadbitmap(pics),url="https://github.com/nirenr/AndroLua_pro"}
adp.add{name="FA工程备份",jianjie="Jesse205在QQ群内的开源",pic=loadbitmap(pics),url="https://jq.qq.com/?_wv=1027&k=8yvOEaTT"}
adp.add{name="钉钉开放平台",jianjie="反馈功能实现",pic=loadbitmap(pic2),url="https://developers.dingtalk.com/document/app/travis-robot"}


--    adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(datas))
animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)
lac = LayoutAnimationController(animation)
lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
lac.setDelay(0.7)--单位是秒
--    listView.setAdapter(adp)
github_list.setLayoutAnimation(lac)
