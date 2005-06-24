From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 02:03:33 -0700
Message-ID: <42BBCC65.8060709@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <42BB7083.2070107@cisco.com> <42BBAD0F.2040802@namesys.com> <20050624071159.GQ29811@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050624071159.GQ29811@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>, Alexander Zarochentcev <zam@namesys.com>
Cc: Lincoln Dale <ltd@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Al Viro wrote:

>Have I missed the posting with analysis of changes in locking scheme
>and update of proof of correctness?  If so, please give the message ID.
>
>_That_ had been the major showstopper for any merges, IIRC.
>  
>
Ah, the prince of helpfulness has arrived.

Yes, as I remember, last time with V3 you announced that there were race
conditions that we needed to fix if V3 was to be merged, you would not
tell us what they were when asked, Linus merged us anyway, you never did
tell us what they were, later vs fixed some race conditions but I have
no idea if they were the same ones you found, oh well, getting rid of
bugs never was your objective was it?  Does V3 still have those race
conditions you spoke of?

Proof of correctness, is that where we check and see if the filesystems
all mount/unmount before checking in code changes to the stable release
branch?  Oh dear, that was unkind of me.

Ok, sure, define what you want in the way of a proof of correctness and
an analysis.  Is this a new VFS tradition?  Is it documented anywhere? 
Are there tools for it?  Probably I should ask Zam if we already did it
too.....  Zam?

Hans
