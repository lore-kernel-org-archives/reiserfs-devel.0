From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Snapshot 2004.07.13 build problems (was: Re: fsck.reiser4 segfaults)
Date: Thu, 15 Jul 2004 16:57:43 +0300
Message-ID: <200407151657.43868.rmeijer@internet.gr>
References: <200407151559.41256.kos@supportwizard.com> <200407151637.46453.rmeijer@internet.gr> <200407151739.17893.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19637-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407151739.17893.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Thu 15 July 2004 16:39, Vitaly Fertman wrote:

> > > there is a new version of libaal package that needs to be installed
> > > first.

> > That's the one I used...

> probably you have occasionally not uninstalled libaal.h file somewhere ?
> have you run ldconfig after installing the libaal ?

There was indeed an old one lying around. I removed that, ran ldconfig, 
reconfigured and reinstalled libaal, reconfigured reiser4progs and now it 
compiled and installed cleanly.


Thanks once again,

Ray
