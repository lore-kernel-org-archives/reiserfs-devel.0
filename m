From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Sun, 13 Jul 2003 17:03:24 +0400
Message-ID: <20030713130324.GA6208@namesys.com>
References: <200307112151.05829.Dieter.Nuetzel@hamburg.de> <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe Gramoull? <philippe.gramoulle@mmania.com>

Hello!

On Sat, Jul 12, 2003 at 03:37:48AM +0200, Szakacsits Szabolcs wrote:
 
> Ok, last complain for today :) I couldn't find an API (I admit, because of
> the above reasons, I didn't search hard) to query the map of disk blocks or
> [offsets, length] couples used by a file, like XFS's XFS_IOC_GETBMAPX does.

Something like FIBMAP ioctl?

> This makes also ReiserFS inadequate to work with sparse files efficiently.

The real lack is for the API to "punch a hole" that was recently discussed
on the list already.

Bye,
    Oleg
