From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 16:24:09 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20040422152409.GO25281@parcelfarce.linux.theplanet.co.uk>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org> <1082640853.12989.54.camel@watt.suse.com> <20040422162402.0b2f3dd6.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040422162402.0b2f3dd6.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jure Pe??ar <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

On Thu, Apr 22, 2004 at 04:24:02PM +0200, Jure Pe??ar wrote:
> On Thu, 22 Apr 2004 09:34:14 -0400
> Chris Mason <mason@suse.com> wrote:
> 
> > Online check is easy, just use lvm or evms to make a snapshot and then
> > check the snapshot.  Online rebuild tree would be impossible by
> > definition (since it throws out everything above the leaf level and
> > rebuilds).
> 
> Well yes, one can do --check on ro mounted fs.
> 
> I was thinking about fixing things up on an active rw filesystem ... where
> if something is found that does not look right, it is reported and fixed on
> the fly.
> 

It is worth mentioning that FreeBSD supposedly has an online in the 
background fsck for UFS2.
I don't know the implementation details as I am busy fighting XF86 4.4
on FreeBSD.

> So is it theoretically posible to fix stuff like these on the fly?
-- 
Chris Dukes
Been there, done that, got the slightly-charred t-shirt. -- Crowder
