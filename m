From: Oleg Drokin <green@namesys.com>
Subject: Re: Simple preformance test
Date: Thu, 11 Apr 2002 16:56:27 +0400
Message-ID: <20020411165627.A992@namesys.com>
References: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204111506300.2077-100000@magic.vamo.orbitel.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Apr 11, 2002 at 03:14:03PM +0300, Ivan Ivanov wrote:
> 		    dd if=/dev/zero of=testdir/$d1/$f1$f2$f3$f4 \
> 		        bs=$block_size count=$blocks_count \
> 		        >/dev/null 2>&1
> 		    rm -f testdir/$d1/$f1$f2$f3$f4

This is the explanation of your speedup.
You try to write to a file, but there is not enough space and file is not
created, but you did not notice.
And then you delete nonexistent files, and no doubts this is very fast
operation ;)

BTW, if you turn off tails, your numbers might get faster, but space usage
will get worse.

Bye,
    Oleg
