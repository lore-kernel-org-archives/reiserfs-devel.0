From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 00:58:53 +0300
Message-ID: <3E49721D.9060205@namesys.com>
References: <3E494808.413781E@interface-ag.com> <3E495CC6.8020202@namesys.com> <20030211144144.A5A9.MIKE@mystica.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030211144144.A5A9.MIKE@mystica.cx>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Hodson <mike@mystica.cx>
Cc: reiserfs-list@namesys.com, vs@namesys.com, Oleg Drokin <green@namesys.com>

Mike Hodson wrote:

>After this I completely re-checked the drive with Maxtor's disk tools
>disk, and it showed that the drive was 'certified error-free'. 
>
This does not mean that there were no bad blocks that were remapped, 
does it? 

If you have data corruption that we can analyze, please contact us. 

We believe that our current release is very stable.  We have one known 
bug relating to unlink we are still working on, fsck still gets bug 
reports, all the linux journaling filesystems have trouble with write 
caching being turned on (this is being fixed in the latest 2.5 kernel, 
and some have argued over whether it is a bug or a lack of a feature) 
because they don't know how to flush disk caches on commit, and other 
than that we simply aren't getting bug reports for V3 in 2.4 (oleg's 
write performance improvements have gotten some bug reports, but those 
aren't in the stable kernel yet).

Oleg and Vladimir, what is the status of the unlink bug?  I'd prefer to 
say that we have no bugs at all....

-- 
Hans


