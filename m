From: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 15:53:00 +0100
Message-ID: <20050624145259.GS29811@parcelfarce.linux.theplanet.co.uk>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <42BB7083.2070107@cisco.com> <42BBAD0F.2040802@namesys.com> <20050624071159.GQ29811@parcelfarce.linux.theplanet.co.uk> <42BBCC65.8060709@namesys.com> <20050624144522.GR29811@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050624144522.GR29811@parcelfarce.linux.theplanet.co.uk>
Sender: Al Viro <viro@www.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Zarochentcev <zam@namesys.com>, Lincoln Dale <ltd@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Jun 24, 2005 at 03:45:23PM +0100, Al Viro wrote:
> On Fri, Jun 24, 2005 at 02:03:33AM -0700, Hans Reiser wrote:
> > Al Viro wrote:
> > 
> > >Have I missed the posting with analysis of changes in locking scheme
> > >and update of proof of correctness?  If so, please give the message ID.
> > >
> > >_That_ had been the major showstopper for any merges, IIRC.
> > >  
> > >
> > Ah, the prince of helpfulness has arrived.
> > 
> > Yes, as I remember,
> 
> Kindly put some efforts into remembering the thread that contains e.g.
> http://marc.theaimsgroup.com/?l=linux-kernel&m=109347094309283&w=2
> 
> If that work (summary: introduction of hybrid objects invalidates the
> existing locking scheme for directories and that had lead at least to
> several user-exploitable deadlocks described in details in the same
> thread; current proof of correctness is in the tree, see
> Documentation/filesystems/Directory-Locking.txt and at the very least

	gaaack...  Sorry - should've proofread better -
s/Directory-Locking.txt/directory-locking/ in the above.
> it needs to be updated) had been done - please, give the message ID
> of posting with such update.  If not - please, arrange getting it done.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
