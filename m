From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Scrambled Files
Date: Tue, 23 Apr 2002 23:32:02 -0400
Message-ID: <20020424033202.GA30417@willow.seitz.com>
References: <20020423210501.GA28270@willow.seitz.com> <20020423214642.GI7481@ariel.karmak.org> <3CC5E81E.7080903@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CC5E81E.7080903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Michael Carmack <karmak@karmak.org>, reiserfs-list@namesys.com

On Wed, Apr 24, 2002 at 03:02:54AM +0400, Hans Reiser wrote:
> Michael Carmack wrote:
> >On Tue, Apr 23, 2002 at 05:05:01PM -0400, Ross Vandegrift wrote:
> >
> >>	Files all over the system have been scrabled - replaced with
> >>garbage text, other executables, sections of data files.  There doesn't
> >>seem to be a pattern to the file corruption.  There are no messages in
> >>the logs.
> >
> >I've read about this before, and it's something I've been meaning to
> >ask about but never quite got around to. IIRC this is related to the
> >tail-packing feature of reiserfs, and there's not a whole lot that can
> >be done to salvage data once it's corrupted. Here are some questions
> >that maybe the reiser developers can answer:
> >
> >1. Is it correct that this corruption is due to tail-packing?
> >
> If you crash while writing, garbage possibly appears in the file being 
> written to.

I'm curious - does it have anything to do with mmaped files?  I've been
using ReiserFS for a very long time on my home workstation where
I use very few applications that mmap files (that I know of...).  OTOH
dpkg does mmap files.

I'm not sure why I think this could be the cause.  Has there been bug
reports about mmaping files before?

Over the years I've had more than a few crashes during write activity -
the only time it resulted in any data loss was due to the 2.4.5 infamous
umount bug.  Perhaps I've just been lucky?

> >2. Is the corruption in any way deterministic? For example, does
> >  it only affect files that have been modified since the last
> >  sync, or perhaps files that are in the process of being modified 
> >  at the time the system goes down?

In my case it seemed to affect file that were either 1) recently written
(probably in cache somewhere) 2) being written.

For example, apt-get was messing around with xfs when it died.  xfs was
completely hosed, as were a bunch of things related to X.  However, the
files were hosed with completely non-deterministic contents - german
text, what appeared to be UUEncoded binaries, random data, as well as
some kind of regular-looking data.  It wasn't like a bunch of the writes
got crossed and files ended up backwards.  It also wasn't like random
junk was written.

Ross Vandegrift
ross@willow.seitz.com
