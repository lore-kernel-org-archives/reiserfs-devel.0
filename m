From: Marcelo Pacheco <marcelo@macp.eti.br>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 12:58:52 -0300
Message-ID: <200404221258.52056.marcelo@macp.eti.br>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org> <20040422152409.GO25281@parcelfarce.linux.theplanet.co.uk> <16519.59524.529494.545461@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16519.59524.529494.545461@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Dukes <pakrat@www.uk.linux.org>, Jure Pe??ar <pegasus@nerv.eu.org>

On Thursday 22 April 2004 12:45, Nikita Danilov wrote:
> Chris Dukes writes:
>  > On Thu, Apr 22, 2004 at 04:24:02PM +0200, Jure Pe??ar wrote:
>  > > On Thu, 22 Apr 2004 09:34:14 -0400
>  > >
>  > > Chris Mason <mason@suse.com> wrote:
>  > > > Online check is easy, just use lvm or evms to make a snapshot and
>  > > > then check the snapshot.  Online rebuild tree would be impossible by
>  > > > definition (since it throws out everything above the leaf level and
>  > > > rebuilds).
>  > >
>  > > Well yes, one can do --check on ro mounted fs.
>  > >
>  > > I was thinking about fixing things up on an active rw filesystem ...
>  > > where if something is found that does not look right, it is reported
>  > > and fixed on the fly.
>  >
>  > It is worth mentioning that FreeBSD supposedly has an online in the
>  > background fsck for UFS2.
>
> Wait a second. Assuming that kernel code has no bugs, the only
> corruption that may happen when soft-updates are used is leaked disk
> space. As I understand it, FreeBSD's background fsck fixes this problem
> and only it.
>
> But, under the same assumption, journalled file system needs _no_ fsck
> at all.
>
>  > I don't know the implementation details as I am busy fighting XF86 4.4
>  > on FreeBSD.
>  >
>  > > So is it theoretically posible to fix stuff like these on the fly?
>  >
>  > --
>  > Chris Dukes
>  > Been there, done that, got the slightly-charred t-shirt. -- Crowder
>
> Nikita.
That's exactly my thought. Wasn't write cache enabled on those disks ? That 
certainly would defeat any journaling filesystem.

Marcelo Pacheco
