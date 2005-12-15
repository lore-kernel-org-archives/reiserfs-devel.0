From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 Pseudo Directory Segfault
Date: Thu, 15 Dec 2005 22:33:08 +0300
Message-ID: <43A1C4F4.9090102@namesys.com>
References: <200512142139.15315.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070804060109050800050609"
Return-path: <reiserfs-list-return-27313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200512142139.15315.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

--------------070804060109050800050609
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Peter van Hardenberg wrote:

>How to produce the error:
>
>$ chmod +w "file/...."
>$ touch file/..../newattr
>Segmentation fault.
>  
>

What the basic setup (kernel, patches) do you use?
Indeed, in the old one the problem exists, because init_pseudo()
does not care about missed regular plugin, so the attached patch
fixes the problem.

Thanks,
Edward.

>We tried setting "dir_eperm" on the pseudo directory plugin's create member. 
>Why didn't this fix it?
>
>-pvh
>
>  
>


--------------070804060109050800050609
Content-Type: text/x-diff;
 name="create_pseudo_fix.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="create_pseudo_fix.diff"

--- inode_ops.c~	2005-10-06 21:54:52.000000000 +0400
+++ inode_ops.c	2005-12-15 21:56:55.927839866 +0300
@@ -90,6 +90,8 @@
 
 	memset(&data, 0, sizeof data);
 	data.mode = S_IFREG | mode;
+	if (!inode_regular_plugin(parent))
+		return -EINVAL;
 	data.id = inode_regular_plugin(parent)->id;
 	return invoke_create_method(parent, dentry, &data);
 }

--------------070804060109050800050609--
