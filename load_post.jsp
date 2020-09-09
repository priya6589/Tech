<%@page import="com.tech.dao.LikeDao"%>
<%@page import="com.tech.entities.User"%>
<%@page import="com.tech.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.dao.PostDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>

<div class="row">
<%
    User u=(User)session.getAttribute("currentUser");
    Thread.sleep(10);
PostDao d=new PostDao(ConnectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0){
 posts=d.getAllPost();
}else{
    posts=d.getPostByCatId(cid);
}

if(posts.size()==0)
{
 out.println("<h4 class='display-3 text-center'>No Posts  in this Category Type.</h4>");
 return;
}
for(Post p:posts)
{
%>
<div class="col-md-6">
    <div class="card">
        <img class="card-img-top" src="post_pics/<%=p.getpPic()%>" alt="Card image cap">
        <div class="card-body">
             <b><%= p.getpTitle()%></b>
             <p><%=p.getpContent()%></p>
             
             
        </div>
             <div class="card-footer bg-primary text-center">
                  <%
                     LikeDao l= new LikeDao(ConnectionProvider.getConnection());
                    %>
     <a href="#" onclick="doLike(<%=p.getPid()%>,<%= u.getId()%>)" class="btn btn-outline-light btn-sm">
         <i class="fa fa-thumbs-o-up"></i><span><%=l.countLikeOnPost(p.getPid()) %></span></a>
     <a href="show_blog.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">READ MORE..</a>
     <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>25</span></a>
            
             </div>
    </div>    
</div>
    
    
<%
}
%>
</div>