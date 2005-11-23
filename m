From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Two usage examples for attribute directories.
Date: Wed, 23 Nov 2005 00:57:22 -0800
Message-ID: <200511230057.22520.pvh@uvic.ca>
References: <200511201317.12598.pvh@uvic.ca> <43817B79.6010707@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27096-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <43817B79.6010707@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On November 20, 2005 11:47 pm, Hans Reiser wrote:
> Peter van Hardenberg wrote:
> >We have an implementation plan for the attribute plugin. We plan to base
> > it around the plugin.c so that it can be available for all files,
> > directory or otherwise.
> >
> >Every file which has a pseudo will gain a new user-attributes pseudofile.
> > This pseudofile will essentially wrap a standard directory.
>
> Usage examples please.
>
---------------------------------
Simple moves first:

$ echo "Matmos" >> track01.mp3/..@/artist
$ echo "A Chance to Cut is a Chance to Cure" >> track01.mp3/..@/album
$ grep Matmos track01.mp3/..@/*
artist: Matmos

---------------------------------
Some hypothetical pseudocode from a music player:

playcount = open('track01.mp3/..@/amarok/playcount').read;
playcount = playcount + 1;
open('track01.mp3/..@/amarok/playcount', 'w').write(playcount);

---------------------------------

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
