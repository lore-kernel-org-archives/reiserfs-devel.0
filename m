From: Oleg Drokin <green@namesys.com>
Subject: Re: root access complains about permission
Date: Fri, 12 Sep 2003 13:27:22 +0400
Message-ID: <20030912092722.GA4745@namesys.com>
References: <3F60B916.6040408@zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F60B916.6040408@zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Sep 11, 2003 at 11:04:06AM -0700, Fong Vang wrote:
> Any thoughts as to why permission would be denied for root when 
> accessing a file on a ReiserFS file system?  Here's a sample output
> [root@sc15-172-31 log]# id
> 
> uid=0(root) gid=0(root)
> groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel)
> [root@sc15-172-31 /root]# cd /var/log
> [root@sc15-172-31 log]# ls
> ls: wtmp: Permission denied

Usually this means you have names that point to nowhere.
You need to run reiserfsck (pick latest one from our site)

> kernel is 2.4.19.  Reiserfs ver 3.6.25.  File system is mounted 
> read-write.  No ACL.  This is a production system that's been up for 2-3 
> months.  Any help would be appreciated.

You may also consider upgrading to at least 2.4.21

Bye,
    Oleg
