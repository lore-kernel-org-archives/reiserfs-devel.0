From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Reiser4 installation & kernel patching
Date: Thu, 19 Jun 2003 17:55:11 +0200
Message-ID: <002101c3367b$2aab90f0$0200a8c0@xpstation>
References: <000e01c33621$2ced8490$0200a8c0@xpstation> <200306191537.30489.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS ML <reiserfs-list@namesys.com>

Thank you for your answers ;)

Now I'd like to know how I could just patch my 2.5.72-mm1 kernel, do you
plan to release kernel patch snapshot as you do for reiserprogs ?
I just tried to install libaal & reiserprogs from the latest snapshot, and
reiserprogs ./configure stops after libaal detection without any error
message else than "libaal vx.xx detection ... no". There should be an error
message or something, and the library has been compiled and installed
though. Hopefully this will be fixed in the upcomming snapshots ;).

How far are you from achieving the Darpa-related features, so that you could
launch the first beta-test ? I just saw on your website "Reiser4 is due June
30, 2003!" : you're not serious, Hans told me a few weeks ago the
beta-testing process should take about two month from the first beta if
everything's working well, and the first beta is still to come ...
Another thing : you should update you're website "download" section, so that
the reiser4 progs links point to the official snapshots url.

Fred

> regarding reiser4progs - they are supposed to be used from snapshots for
now
> from from packages in the future with ready-to-use configure script, not
from bk
> repository where you need to make it by you yourself and need some last
> autoconf version for that. Probably you will prefere to get some snapshot
from
> http://thebsh.namesys.com/snapshots. And you will need libaal installed
before
> reiser4progs compiling.
>
> Thanks,
> Vitaly Fertman

