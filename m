From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: problem in mounting reiserfs
Date: Thu, 5 Aug 2004 13:06:29 +0200
Message-ID: <200408051306.29248.christian.mayrhuber@gmx.net>
References: <41120713.7040706@persistent.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41120713.7040706@persistent.co.in>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 05 August 2004 12:08, Avinesh Kumar wrote:

> ReiserFS is successfully created on /dev/hda6.
> ~ $ mount -t reiserfs /dev/hda6 /rfs
> mount: wrong fs type, bad option, bad superblock on /dev/hda6,
>        or too many mounted file systems
> ~ $
>
>            but the same steps worked when i chose block size of 4096
> bytes. please, help me out.

If I remember right Reiserfs cannot use blocksize != page size and page size 
is 4096 @ x86.
The only way to use reiserfs is with its default blocksize of 4096.

-- 
lg, Chris

