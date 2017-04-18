/**
 * Created by Administrator on 2016/12/3.
 */
$( document ).ready( function(){
   /* 屏幕大小改变事件 */
   bgSeltAdaption();
   /* 回到顶部 */
   goTOTop();
   // 检测屏幕是否为手机 是 调用 不是 略过
    if (navigator.userAgent.match(/mobile/i)) {
        /*自适应（单击元素，显示下拉菜单）*/
        selfAdaption();
    }
    // bootstrap 工具提示
   $('[data-toggle="tooltip"]').tooltip();
});
/*自适应（单击元素，显示下拉菜单）*/
function selfAdaption() {
   // 获取元素
   var list = $( ".navbar-header .glyphicon-th-list" ).eq( 0 );
   var nav = $( "#nav" );
   // 绑定单击事件
   list.bind( 'click', function () {
      nav.toggle();
   });

}
/* 回到顶部 */
function goTOTop(){
   var to_top = $( '#back-to-top' );
   $( document ).on( 'scroll', function () {
      // 判断当前高度，显示隐藏
      var top_scroll = $(document).scrollTop();
      if ( top_scroll > 200 ){
         $( to_top ).fadeIn( 'slow' ).addClass( 'show' ).removeClass( 'hidden' );
      } else {
         $( to_top ).fadeOut( 'slow' ).addClass( 'hidden' ).removeClass( 'show' );
      }
   })
   $( to_top ).on('click', function(e){
      // 设置滚动条高度为0
      e.preventDefault();
      $('html, body').animate({scrollTop : 0},1000);
      return false;
   });
}
/* 屏幕大小改变事件 */
function bgSeltAdaption() {
   $( window ).resize( function () {
      /* header背景图width设为100% */
      // 获取屏幕宽度
      var width_screen = window.innerWidth;
      var header = $( '#header' );
      header.css( 'width', width_screen );
   });
}