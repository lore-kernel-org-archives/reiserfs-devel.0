From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruptions on every filesystem with 02-reiserfs_file_write.diff.gz
Date: Fri, 23 Aug 2002 11:42:23 +0400
Message-ID: <20020823114223.A894@namesys.com>
References: <20020820151701.GA15499@jerry.boludo.cjb.net> <20020821101343.B10765@namesys.com> <20020821163122.GA6628@jerry.boludo.cjb.net> <20020821204141.A919@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020821204141.A919@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Marcet <jmarcet@pobox.com>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 21, 2002 at 08:41:41PM +0400, Oleg Drokin wrote:

> > If you tell me any way to further investigate this situation and find a
> > possible solution, I'll be glad to. My only fear is running a kernel
> > with the patch applied for too long. After all I value my date and do
> > want to keep it safe, not only access to it fast.
> Can you try compiling your kernel with gcc 2.95.3? (I just don't have
> gcc 3.2 at hand, that's it).

Ok, I downloaded gcc 3.2 and compiled with it as I see no problems.
But at the other hand I have found that in some cases it is possible that
new code write incorrect information (if it is fed with write requests
of more than 128k in size at once).
I have updated out ftp with fixed patches.
But I still do not see how corruption might affect other filesystems.
Can you try with new patches and see if your problem is cured?

Bye,
    Oleg
