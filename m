From: Walter Landry <wlandry@ucsd.edu>
Subject: Re: reiser4 non-free?
Date: Fri, 30 Apr 2004 08:20:21 -0400 (EDT)
Message-ID: <20040430.082021.71090903.wlandry@ucsd.edu>
References: <20040424193246.GA2490@raptus.homelinux.org>
	<4091DAFE.5030809@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4091DAFE.5030809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiser@namesys.com
Cc: cavok@tiscali.it, sliedes@cc.hut.fi, ed@debian.org, debian-legal@lists.debian.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
> Someone posted the following on slashdot, presumably a debian someone:
> 
>     Nobody's saying that your proprietary hardware will cease to work in
>     Debian. The packages will still exist; they'll just be in the
>     "non-free" section, separated out so that people who don't want any
>     non-free software can omit that section from their sources.list
>     file. Non-free packages are technically not part of Debian, but if
>     you have a non-free line in your sources.list, there's no difference
>     whatsoever in how you use them.
> 
> So hopefully, Debian can print out some nice warning that Reiser4 is not 
> plagiarizable, and if the user indicates that they still want to use it 
> anyway, they can go forward.

The largest problem is that with the "clarification", you seem to have
changed the license, making it slightly more restrictive than the
plain old GPL.  The combination of Reiser4 and the kernel triggers GPL
Section 2.  That means that Debian will not be able to distribute
Reiser4 at all.

If you changed the clarification to a request, then Debian would have
no problems distributing it, even with the blurb.

> I find Debian's aggressive behavior toward myself, and especially 
> Richard Stallman and his GFDL, to be inappropriate and ungrateful, but I 
> also understand that Debian is striving to define its morality, and that 
> much of the world shares its rather asian attitude towards whether it is 
> acceptable to not credit others for their contributions to science. I do 
> not. I think the western approach of rigor in attribution has been of 
> great value in stimulating innovation over the centuries, and think it 
> should be applied to free software as much as it was to free science 
> research.

There are many, many software authors who have given away extremely
useful things for no cost.  That doesn't mean that Debian will
distribute those things.

> I don't expect to convince Debian of this, especially not after your 
> vote that you recently had, but it would be pleasant if users who don't 
> mind attribution are able to select reiser4 if they want it.

Make the license GPL-compatible, and Debian probably will make it
available.

Regards,
Walter Landry
wlandry@ucsd.edu


