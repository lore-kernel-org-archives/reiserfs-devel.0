From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: New reiser4 snapshot (2003.09.12) is out
Date: Sat, 13 Sep 2003 07:59:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0309130753440.6794-100000@localhost.localdomain>
References: <1063453831.1661.7.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1063453831.1661.7.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Reiser FS mailing list <reiserfs-list@namesys.com>

On Sat, 13 Sep 2003, Felipe Alfaro Solana wrote:

> On Sat, 2003-09-13 at 13:27, Robert P. J. Day wrote:
> > On Sat, 13 Sep 2003, Felipe Alfaro Solana wrote:
> > 
> > > I've downloaded libaal and reiser4progs as noted above. I applied the
> > > whole reiser4.diff to 2.6.0-test5-bk3, but, when I run:
> > > 
> > > # mkfs.reiser4 /dev/hda4
> > > # mount -t reiser4 /dev/hda4 /mnt
> > > 
> > > I get the following oops:
> > 
> > (snip)
> > 
> > not to beat this dead horse even further, but how did you get the
> > reiser progs to build.  at least a couple of us have run into the
> > same "make" error in trying to build them.
> 
> If my memory serves me well, that's the only patch needed to make it
> compile.

i'm confused.  the "patch" i refer to is the kernel patch to build
reiser 4 support into the kernel.  the fact that this works on 
patching the kernel doesn't seem to prevent the reiser4 progs build
problem.

i'm going to start from scratch, to verify what does and does not work.  
in order to speed things up, here's the recipe i'm going to use -- feel
free to point out what i'm doing wrong.

kernel:
	2.6.0-test5-bk3
	patch with reiser4.diff
	config with reiser4 support
	build

libaal:
	configure, make and make install
	update /etc/ld.so.confB

reiser4progs:
	configure, make and make install


  from memory, this is what i did before and the last step failed
with the error that at least two of us have posted here.

  so, i'm just starting this process over, i'll see if anything
changes.

rday

p.s.  FYI, the clinical definition of insanity is "the fixation that
doing the same thing repeatedly will somehow produce different results."

