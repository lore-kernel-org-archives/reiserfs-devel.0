From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 2 Jun 2004 16:58:17 +0400
Message-ID: <200406021658.17346.vitaly@namesys.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <200406012240.33075.vitaly@namesys.com> <pan.2004.06.01.19.37.08.75221@unternehmen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2004.06.01.19.37.08.75221@unternehmen.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Helge Hielscher <hhielscher@unternehmen.com>, reiserfs-list@namesys.com

On Tuesday 01 June 2004 23:37, Helge Hielscher wrote:
> On Tue, 01 Jun 2004 22:40:33 +0400, Vitaly Fertman wrote:
> > On Tuesday 01 June 2004 15:57, Helge Hielscher wrote:
> >> fsck.reiser4 segfaulted when I tried to check /dev/hda6 (see below).
> >
> > which version do you have? the latest was 0.5.4 in
> > www.namesys.com/snapshots/2004.04.21-internal.testing.fixed/
> > would you try it first?
>
> Tried it and got the same result: fsck.reiser4 segfaults at semantic tree
> checking.

Can you provide the packed fs metadata for downloading?
(debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2)
-- 
Thanks,
Vitaly Fertman

