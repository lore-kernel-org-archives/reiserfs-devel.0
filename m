From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Disk full and writting to pre-allocated area on ReiserFS
Date: Mon, 18 Oct 2004 14:45:10 +0400
Message-ID: <1098095855.3638.41.camel@tribesman.namesys.com>
References: <1097876157.6553.22.camel@sphere.site>
	 <41713CB3.3010005@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-iwgxhGR7cAJT85uifyua"
Return-path: <reiserfs-list-return-22088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41713CB3.3010005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "reiserfs-dev@namesys.com" <reiserfs-dev@namesys.com>
Cc: reiserfs-list@namesys.com

--=-iwgxhGR7cAJT85uifyua
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

Could someone please forward this mail to peter@mysql.com (for unknown
reasons I can not send anything to some addresses).


On Sat, 2004-10-16 at 19:22, Hans Reiser wrote:
> Peter Zaitsev wrote:
> 
> >Hi,
> >
> >I'm running SuSE 9.1  Kernel 2.6.5-7.108-default 
> >But I would guess it applies to large variety of platforms as we have
> >customers reporting the same problem.
> >
> >I'm using reiserfs:
> >/dev/md0 on /data type reiserfs (rw,noatime,notail,data=writeback)
> >
> >The problem is in case of disk full condition,  "Disk full" error is
> >being reported even if write happens to Pre-Allocated area, in my case
> >to Innodb recovery log files.
> >
> >This is very unfortunate as in such case Innodb has no way but to
> >terminate database server.  These logs are specially pre-allocated so 
> >one would not run in such condition.
> >
> >Question: Is there any way to avoid this problem with Reiserfs ? 
> >

Would you please check whether attached patch fixes the problem?


> >
> >  
> >
> vs or chris or jeff, can you comment?
> 

This looks like a bug in reiserfs_file_write. It does not distinguish
whether new disk space is to be allocate.


--=-iwgxhGR7cAJT85uifyua
Content-Disposition: attachment; filename=file.c.diff2
Content-Type: text/plain; name=file.c.diff2; charset=KOI8-R
Content-Transfer-Encoding: 7bit

--- file.c~	2004-10-02 12:29:33.223660850 +0400
+++ file.c	2004-10-08 10:03:03.001561661 +0400
@@ -1137,6 +1137,8 @@
 	return result;
     }
 
+    return generic_file_write(file, buf, count, ppos);
+
     if ( unlikely((ssize_t) count < 0 ))
         return -EINVAL;
 

--=-iwgxhGR7cAJT85uifyua--

