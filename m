From: Oleg Drokin <green@namesys.com>
Subject: Re: merge 2.4.21-pre4 with Direct IO bug fix
Date: Tue, 4 Mar 2003 17:29:42 +0300
Message-ID: <20030304172942.A8825@namesys.com>
References: <20030304013450.249cc096.philippe.gramoulle@mmania.com> <20030304111807.A18814@namesys.com> <200303041523.43434.m.c.p@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13061-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303041523.43434.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc-Christian Petersen <m.c.p@gmx.net>
Cc: Philippe Gramoull? <philippe.gramoulle@mmania.com>, Chris Mason <mason@suse.com>, reiserfs <reiserfs-list@namesys.com>

Hello!

On Tue, Mar 04, 2003 at 03:23:43PM +0100, Marc-Christian Petersen wrote:

> > Also another patch you probably want to apply is my iget5_locked bugfix for
> > 2.4, You can find it at
> > ftp://namesys.com/pub/reiserfs-for-2.4/testing/iget5_locked_for_2.4.21-pre5
> >-datalogging.diff.gz it should be applied on top of datalogging/quota stuff
> > I mentioned above.
> is it also possible to do a patch ontop of the XFS v1.2 tree? It seems XFS 
> uses a similar approach.

This patch's idea came from XFS. Then it was implemented for 2.5.
And then I just backported changes to 2.4
First we need to make this patch into 2.4, then XFS people would need to catch up
(in fact it should be pretty easy for them, I think).

Bye,
    Oleg
