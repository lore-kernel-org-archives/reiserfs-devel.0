From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 errors
Date: Mon, 15 Dec 2003 16:35:53 +0300
Message-ID: <200312151635.53344.vitaly@namesys.com>
References: <20031213180246.3042.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031213180246.3042.qmail@ninja.dynup.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jedi Ninja <jedi@ninja.dynup.net>, reiserfs-list@namesys.com

Hello, 

On Saturday 13 December 2003 21:02, Jedi Ninja wrote:
> trinity root # fsck.reiser4 /dev/hda8
>  *** note about $25 support ***
>
> Fscking the /dev/hda8 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Will use (default) params.
> Continue?
> (Yes/No): Yes
> Fatal: Device operation "read" isn't implemented.
> Fatal: Can't read master super block.
> Fatal: Failed to open teh master super block.
> Fatal: Cannot open the FileSystem on (/dev/hda8).
> Segmentation fault

hm, this is strange. what reiser4progs do you use?
there are a lot of fixes have been made recently, I will send 
you the uptodate code in the next email, you should try it first.

-- 
Thanks,
Vitaly Fertman
