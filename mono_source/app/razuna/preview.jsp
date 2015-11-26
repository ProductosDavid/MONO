<!--
    MONO
    Copyright (C) 2015  Universidad de los Andes
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
  
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script> 
<script language="JavaScript" type="text/javascript">var dynpath = '/razuna';</script>
<link rel="stylesheet" type="text/css" href="/razuna/global/js/jquery-ui-1.8.21.custom/css/smoothness/jquery-ui-1.8.21.custom.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/host/dam/views/layouts/main.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/host/dam/views/layouts/error.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/videoplayer/css/multiple-instances.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/js/tag/css/jquery.tagit.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/host/dam/views/layouts/tagit.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/js/notification/sticky.min.css?_v=2012.09.02.1" />
<link rel="stylesheet" type="text/css" href="/razuna/global/js/chosen/chosen.css?_v=2012.09.02.1" />
<script type="text/javascript" src="/razuna/global/js/jquery-1.7.2.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jquery.validate.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jquery.form.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jquery-ui-1.8.21.custom/js/jquery-ui-1.8.21.custom.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/videoplayer/js/flowplayer-3.2.6.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/AC_QuickTime.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jqtree/lib/jquery.cookie.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/host/dam/js/global.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jqtree/jquery.tree.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jqtree/plugins/jquery.tree.cookie.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/tag/js/tag-it.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/notification/sticky.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/chosen/chosen.jquery.min.js?_v=2012.09.02.1"></script>
<script type="text/javascript" src="/razuna/global/js/jquery.formparams.js?_v=2012.09.02.1"></script>
<link rel="SHORTCUT ICON" href="/razuna/global/host/dam/images/favicon.ico" />
</head>
<body>


<script type="text/javascript">


    $(document).ready(function(){
        $.ajax({
            url:  "index.cfm?fa=c.images_detail&file_id=<%=request.getParameter("file_id")%>&what=images&loaddiv=container&folder_id=<%=request.getParameter("folder_id") %>&showsubfolders=F",
            cache: false,
            success: function(html){
                $("#content").append(html);
            }
        });
    });
</script>
<div id="content"> 
</div>
</body>

</html>
