From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 19:15:38 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20040422181538.GR25281@parcelfarce.linux.theplanet.co.uk>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org> <1082640853.12989.54.camel@watt.suse.com> <40880610.9050207@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40880610.9050207@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Jure Pe?ar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Thu, Apr 22, 2004 at 10:51:12AM -0700, Hans Reiser wrote:
> Chris Mason wrote:
> >
> >Online check is easy, just use lvm or evms to make a snapshot and then
> >check the snapshot. 
> >
> Requires that users use lvm before discovering the need for fsck, but, 
> yes.  What would be ideal would be some support for finding the 
> inconsistency on the snapshot, and then fixing it on the real fs using 
> the information learned from the snapshot fsck.

Taking a snapshot of the entire FS to fix metadata seems somewhat
expensive.  Any thoughts on intercepting FS activity to locate
metadata that needs to be checked now rather than during the next moment
the fs or disk is idle?

Snapshotting 40G has a pretty small additional cost.  Snapshotting 1TB
is somewhat more expensive.
> 
> >Online rebuild tree would be impossible by
> >definition (since it throws out everything above the leaf level and
> >rebuilds).

Build a new tree and keep the old tree until the new tree is finished?
-- 
Chris Dukes
Been there, done that, got the slightly-charred t-shirt. -- Crowder
