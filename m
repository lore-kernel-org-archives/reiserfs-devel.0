From: David Masover <ninja@slaphack.com>
Subject: Re: Unexpected reset corrupted Reiser4 filesystem
Date: Tue, 24 May 2005 23:49:51 -0500
Message-ID: <429403EF.4030803@slaphack.com>
References: <200505242338.32420.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505242338.32420.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew James Wade <ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew James Wade wrote:
> Hello,
> 
> One of my Reiser4 filesystems was corrupted by a power glitch.

No filesystem can prepare for a power glitch, AFAIK.

> fsck fixed the corruption, but my understanding is that an
> unexpected reset should not have corrupted the filesystem. I

It's my understanding that an unexpected _should_ not have corrupted the
filesystem.  Generally, this means that if we have everything working
the way it's supposed to right up until someone hits the Reset switch,
there _should_ be zero corruption.

Caveats:
1.)  _should_ is not _is_.  Just because the developers can't crash it
doesn't mean it's invulnerable.
2.)  power flicker is different than the power/reset button.  It really
all depends on what your hardware actually does when power is cut, but
most hard drives do some sort of write caching, and some of them make it
impossible to turn that off.

To say more, I'd have to know about the physical mechanics involved, but
even if you could make the system absolutely invulnerable to power loss,
you're still going to lose data (not corrupt -- LOSE) in such an event,
unless you have a battery backup.  Even then, your drive is eventually
going to fail -- so use RAID.  And someone is eventually going to rm -rf
your RAID, or spill coffee on it, or hit it with a
tornado/earthquake/nuke, so have multiple sites and make backups.

That's what it all comes down to -- make backups.  The fact that you
have journalling/transactions/fsck/batteries/RAID is all just to make it
a little less catostrophic when stuff does fail.

> have an image of the corrupted filesystem, is it of any use to
> anyone?

Probably someone, not me.  I don't work here, but I'll bet money that
they are going to ask for something from debugfs.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpQD7ngHNmZLgCUhAQLvSA//bPqBcYMs/NRS7mT//zlGF0WK2YlnNUCd
2hvzXxQhKcLMIvaTo9DJ9wzkaDIHot1DZUcuFIU3f4qmb7QIlMbkVoYE1AW34Wg/
/G06KTkHUi0iU+GJ9Dq65Oj4nK1SM4AtBHMpLqhpcW0FExsj9ScmewcSehFNSzDS
Frptzvk/iWtkip2rJxReF8rKr170Y2aR+1DNaCUiLLoESTgbF5WMmcJFyyuaa0/y
JbP8/kTz4mbLuZuIt6qKswHqUACUA98sK32zeylUOeccKih35FkiaZtegIwti6Op
QwfuCQNyhlODVxAUCghMxz6RtF59Zk4hfoWv5f1GHB7/MHgHGQmMeBy3G/Y/y8D/
P29LVyjhyStVmRyfYtDewMIBQz+nx1+StTqZ3jimfwlpMZxOxeGc0IbV9qiM4o6U
uYgtf9nrdeywn2HruijYO5xiTUcIbaBUGsvCCxNYrdzMYKEDsk3iTR/Jrxl/8GJl
d88NwSAdiU+uUcPkfdlcl+bHk3SB1yX7sjbItOtrUgZxFYsjtuFOusaOo5CkT84l
2lduqioG2u4zWirRk3d3QJEWETykhX4JnjnCjw/qAQ9+JOLc5xjUbgO2fB8d1toy
QKGGVTH1P3i8Ux5ISrtP3noNtA/zzGRlhYShzc50bq8c8+/CAiqnx9FZGv854Ttp
hpTuQ1Ht0FA=
=1k9p
-----END PGP SIGNATURE-----
