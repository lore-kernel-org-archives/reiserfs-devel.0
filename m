From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Severe problem with fsck.reiser4 1.0.3
Date: Thu, 13 Jan 2005 01:46:42 +0300
Message-ID: <20050112224641.GB14327@backtop.namesys.com>
References: <1105558209.41e57ac12b109@www.hosting-agency.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1105558209.41e57ac12b109@www.hosting-agency.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Raffeiner <sturmflut@lieberbiber.de>
Cc: reiserfs-list@namesys.com

Hello,

On Wed, Jan 12, 2005 at 08:30:09PM +0100, Simon Raffeiner wrote:
> I managed to boot my Box with Kanotix and this is the result of a mount
> Operation:
> 
> reiser4[mount(2457)]: zget (fs/reiser4/znode.c:567)[jmacd-504]:
> WARNING: Wrong level for cached block 936512: 2 expecting 1
> reiser4[mount(2457)]: key_warning (fs/reiser4/plugin/object.c:97)[nikita-717]:
> WARNING: Error for inode 42 (-5)

isn't your system amd64?

> 
> This is exactly the same error as Kernel 2.6.9-mm1 and 2.6.10-mm1 display when I
> try to boot Gentoo Linux, with 2.6.10-mm1 showing a slightly different
> behaviour: It tries to remount the root partition 10 times and than fails
> (displaying the error message from above 10 times), 2.6.9-mm1 fails after the 
> first mount attempt.
> 
> Could this be due to a faulty hard drive (it's about 3 years old and has been
> heavily used) or is it some kind of file system corruption? In the second case
> please fix reiser4progs to deal with such errors and make fsck.reiser4 fix it
> so I can get my machine back up working.

do you mean that fsck.reiser4 reports that no fs corruption found?

> 
> Regards,
> Simon Raffeiner

-- 
Alex.
