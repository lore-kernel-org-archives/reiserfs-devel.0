From: Wes Janzen <superchkn@sbcglobal.net>
Subject: Re: root access complains about permission
Date: Thu, 11 Sep 2003 19:24:30 -0500
Message-ID: <3F61123E.9090809@sbcglobal.net>
References: <3F60B916.6040408@zantaz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F60B916.6040408@zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fong Vang <FVang@Zantaz.com>
Cc: reiserfs-list@namesys.com

Hi,

I haven't seen anyone post any answers so I'll chip in my 2 cents...

I've seen this when the drive needed fsck to be run.  I always got 
errors that accompanied this, are you seeing anything in your logs?

I'd be wondering how that happened in the first place though, if this is 
the case.  I've had an SuSE 8.0 2.4.18 system running for over a year 
that's lost power or been reset at least a dozen times without any fs 
problems (though I did have to clear out the squid cache).  Then again 
it wasn't doing much io except writing to the log on a couple 
occasions.  Still, the only time I had trouble was with my personal 
system and that was traced to a hardware problem or a bug in a test 
kernel (say 2.6.0-test3).

-Wes-

Fong Vang wrote:

>Any thoughts as to why permission would be denied for root when 
>accessing a file on a ReiserFS file system?  Here's a sample output
>
>[root@sc15-172-31 log]# id
>
>uid=0(root) gid=0(root)
>groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel)
>[root@sc15-172-31 /root]# cd /var/log
>[root@sc15-172-31 log]# ls
>ls: wtmp: Permission denied
>ls: messages: Permission denied
>ls: messages.1: Permission denied
>ls: messages.2: Permission denied
>ls: messages.3: Permission denied
>ls: maillog: Permission denied
>ls: spooler.1: Permission denied
>ls: secure.4: Permission denied
>ls: secure: Permission denied
>ls: maillog.2: Permission denied
>ls: maillog.3: Permission denied
>
>
>kernel is 2.4.19.  Reiserfs ver 3.6.25.  File system is mounted 
>read-write.  No ACL.  This is a production system that's been up for 2-3 
>months.  Any help would be appreciated.
>
>
>This e-mail has been captured and archived by the ZANTAZ Digital Safe(tm)
>service.  For more information, visit us at www.zantaz.com. 
>IMPORTANT: This electronic mail message is intended only for the use of the
>individual or entity to which it is addressed and may contain information
>that is privileged, confidential or exempt from disclosure under applicable
>law.  If the reader of this message is not the intended recipient, or the
>employee or agent responsible for delivering this message to the intended
>recipient, you are hereby notified that any dissemination, distribution or
>copying of this communication is strictly prohibited.  If you have received
>this communication in error, please notify the sender immediately by
>telephone or directly reply to the original message(s) sent.  Thank you.
>
>  
>

