From: Harald van Pee <pee@iskp.uni-bonn.de>
Subject: Re: crash after kernel: clm-6004: convert tail failed inode ... error -28
Date: Fri, 21 Jun 2002 18:22:24 +0200
Message-ID: <200206211622.g5LGMPc07743@klee.cb.uni-bonn.de>
References: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de> <20020621195906.A1333@namesys.com> <1024675773.13539.6.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1024675773.13539.6.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Friday 21 June 2002 18:09, Chris Mason wrote:
> On Fri, 2002-06-21 at 11:59, Oleg Drokin wrote:
> > On Fri, Jun 21, 2002 at 05:52:52PM +0200, Harald van Pee wrote:
> > > capacity availible on this disk. But my jobs don't stop writing and=
 so
> > > I got a lot of clm-6004: convert tail failed messages,
> > > until the kernel the kernel stops working. The last 6 entries in
> > > /var/log/messages
> > > Is this a known problem and does a patch exists?
>
> This was fixed in 2.4.19-pre3.  The problem was that I didn't restart
> the transaction before freeing the block.

Does a patch against 2.4.18 exists?
