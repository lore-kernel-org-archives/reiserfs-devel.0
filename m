From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: Wed, 13 Nov 2002 19:40:08 +0100
Message-ID: <20021113194008.6dadeed5.philippe.gramoulle@mmania.com>
References: <20021031210828.45F4A216991@server5.fastmail.fm>
	<1036099804.14984.165.camel@tiny>
	<20021112182949.45436c95.philippe.gramoulle@mmania.com>
	<1037211258.288.97.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1037211258.288.97.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 13 Nov 2002 13:14:18 -0500
Chris Mason <mason@suse.com> wrote:

  |  Ok, I was hoping for some confirmation that you've seen the bug fixed
  |   with the quota code.  Which kernel version + list of patches are you
  |   best able to test on?  I'll make you patch against that.
  |  
  |   -chris

Unfortunately, we hit the bug again this afternoon :-(

We use to have 2.4.19-pre6 with the quota patches from
ftp.suse.com:/pub/people/mason/patches/reiserfs/quota-2.4/2.4.19
( 0xFFFF test removed in sys_quotactl() in fs/dquot.c to support 32 bit UIDS)
and IIRC NFS_ALL patch for 2.4.19

Being unable to run the quota anyway with 2.4.19-pre6,as it would make the filer crash, i upgraded to
2.4.20rc1 + data-logging patches and mounted the fs witn noatime,nodiratime and data=journal

Filer is still heavily loaded but runs fine. Problem now is that we don't have quota working anymore
and this is a _big_ issue as warez lovers do test our systems every single minute.

BTW, should i apply the patch posted on LKML ?
Subject:2.[45] fixes for design locking bug in wait_on_page/wait_on_buffer/get_request_wait

Ideally, i'd like to stay with 2.4.20rc1 thus having working quota.
I couldn't check closely enough because of being too busy but i think many important patches have been
set into RC1 (new block allocator, etc..).
I tried to have a look to merge the quota code with RC1 but unfortunately my knowledge of quota/reiserfs
prevent me from doing anything but cosmetic merge :o)

Let me know what are you plans.

Thanks much,

Philippe
