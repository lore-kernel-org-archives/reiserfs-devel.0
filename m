From: Oleg Drokin <green@namesys.com>
Subject: Re: 2GB limit won't go away
Date: Mon, 10 Jun 2002 19:47:14 +0400
Message-ID: <20020610194714.A1356@namesys.com>
References: <1023708533.4654.301.camel@xserver> <20020609183534.GC14168@turbolinux.com> <1023754229.4654.1831.camel@xserver> <20020609231608.B8386@namesys.com> <1023780454.3999.52.camel@xserver> <20020610085822.A10921@namesys.com> <1023717954.6272.17.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1023717954.6272.17.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 10, 2002 at 08:05:54AM -0600, Chris Worley wrote:

> I'm wondering if there is a kernel/reiser tools mismatch.  How could I verify what's in the kernel?

Do a dmesg and see throught the output
if you see somethink like this:
reiserfs: checking transaction log (device 03:02) ...
Using r5 hash to sort names
reiserfs: using 3.5.x disk format
ReiserFS version 3.6.25
VFS: Mounted root (reiserfs filesystem) readonly.

Then yuo have old format.
If you do not see "reiserfs: using 3.5.x disk format" part,
you are using 3.6 format.

Bye,
    Oleg
