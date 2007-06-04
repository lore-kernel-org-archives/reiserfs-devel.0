From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: Filesystem corruption
Date: Mon, 4 Jun 2007 04:55:28 +0200
Message-ID: <20070604025528.GA19513@efil.de>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com> <200705301503.15105.ninja@slaphack.com> <20070531001151.GA9933@efil.de> <4661F8ED.4070001@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4661F8ED.4070001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 2007-06-03 03:10, Edward Shishkin wrote:
> Ingo Bormuth wrote:
> >Hm, same here. I lost /bin/sleep several times.

> Would you please describe the problem in more details?
> What kernel version? What does "I lost /bin/sleep" mean?
> Does it mean that:
> 1. /bin/sleep was truncated to 0 bytes, i.e. "ls -l /bin/sleep" shows  
> something like
> -rwxr-xr-x  1 root root 0 2005-04-20 18:32 /bin/sleep
> 2. /bin/sleep disappeared ("ls -l /bin" doesn't show this file)
> 3. /bin/sleep exists, but filled by zeros
> etc...

The file was removed by 'fsck.reiser4 --fix' which emmitted a
message about deleting a corrupted file. (Case 2 in your list).

This always happened after a system freeze or power loss.
The machine freezes quite frequently - I think it has a DMA problem.
Nevertheless I don't see how a file that was not written to can
get corrupted.

Current kernel is 2.6.20.5 (the reiser4 patch I submitted to this 
list on may 2nd).

Root is mounted rw,noatime,nodiratime,onerror=remount-ro,tmgr.atom_max_age=60

Hope that helps.



-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

