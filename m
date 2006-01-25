From: "Barry K. Nathan" <barryn@pobox.com>
Subject: Re: Reiser4 corruption (fsck.reiser4 broken?)
Date: Tue, 24 Jan 2006 16:25:38 -0800
Message-ID: <986ed62e0601241625l1d0bd33fx7ac36de10186d82c@mail.gmail.com>
References: <200601242257.43836.rik@osrc.info>
	 <1138135840.29441.124.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: barrykn@gmail.com
In-Reply-To: <1138135840.29441.124.camel@gentoo>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Roman I Khimov <rik@osrc.info>, reiserfs-list@namesys.com

On 1/24/06, Jake Maciejewski <maciejej@msoe.edu> wrote:
> Someone correct me if I'm wrong, but kernels since 2.6.11-5 have the new
> plugin set which isn't supported by reiser4progs 1.0.4, so fscking with
> 1.0.4 was probably a big mistake.

Uh... this is bad. reiser4progs 1.0.4 is what ships with the current
Debian release:
http://packages.debian.org/stable/admin/reiser4progs

(A couple of weeks ago, I had a reiser4 filesystem that needed
fscking, and reiser4progs 1.0.4's fsck would claim that it fixed the
filesystem with --build-fs, but running it again would show that the
corruption was still there -- I had to manually compile 1.0.5 and use
that in order to actually fix the filesystem.)

Maybe I should file a bug report with Debian about this (ideally with
the goal of getting a reiser4progs 1.0.5 update package for Debian
stable)...
--
-Barry K. Nathan <barryn@pobox.com>
