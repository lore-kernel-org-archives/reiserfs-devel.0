From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruptions on every filesystem with 02-reiserfs_file_write.diff.gz
Date: Wed, 21 Aug 2002 20:41:41 +0400
Message-ID: <20020821204141.A919@namesys.com>
References: <20020820151701.GA15499@jerry.boludo.cjb.net> <20020821101343.B10765@namesys.com> <20020821163122.GA6628@jerry.boludo.cjb.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020821163122.GA6628@jerry.boludo.cjb.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Marcet <jmarcet@pobox.com>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 21, 2002 at 06:31:22PM +0200, Javier Marcet wrote:

> > You said XFS, does that mean you had XFS patched in too in all cases?
> No, that was the first patch I removed - or didn't add, since I began
> from scratch again -, since I only wanted to test it and being such a
> big piece of code which modified so many things, there were good chances
> for it to be the culprit.

Ok, one thing off the equation.
 
> If you tell me any way to further investigate this situation and find a
> possible solution, I'll be glad to. My only fear is running a kernel
> with the patch applied for too long. After all I value my date and do
> want to keep it safe, not only access to it fast.

Can you try compiling your kernel with gcc 2.95.3? (I just don't have
gcc 3.2 at hand, that's it).
To avoid risking your data - you may have empty scratch partition, on which
you can test and boot off rescue CD-ROM, so that your data will be safe.

Bye,
    Oleg
