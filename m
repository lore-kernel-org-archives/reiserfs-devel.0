From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 07:27:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309130726000.30030-100000@localhost.localdomain>
References: <1063451900.1285.3.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1063451900.1285.3.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Reiser FS mailing list <reiserfs-list@namesys.com>

On Sat, 13 Sep 2003, Felipe Alfaro Solana wrote:

> I've downloaded libaal and reiser4progs as noted above. I applied the
> whole reiser4.diff to 2.6.0-test5-bk3, but, when I run:
> 
> # mkfs.reiser4 /dev/hda4
> # mount -t reiser4 /dev/hda4 /mnt
> 
> I get the following oops:

(snip)

not to beat this dead horse even further, but how did you get the
reiser progs to build.  at least a couple of us have run into the
same "make" error in trying to build them.

so far, what's worked:

  1) patch kernel 2.6.0-test5-bk2, configure, build
  2) build and install libaal

but it's the reiser progs that are not building.  suggestions?

rday

