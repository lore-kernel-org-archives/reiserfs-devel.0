From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 25 Apr 2003 12:12:55 +0200
Message-ID: <1051265575.1656.37.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com>
	 <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com>
	 <1051263219.1642.10.camel@localhost>  <20030425094630.GH10802@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030425094630.GH10802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-04-25 at 11:46, Oleg Drokin wrote:

> Well, fsck is expected to fix things.

actually I don't know why a wait_buffer_until_released (waiting forever)
can happen...

> The strange thing is how you get into error state.
> 
> > IIRC there was no unclean reboot before that vs-3050 thing appeared.
> 
> Hm. But do you run reiserfsck on boot?

Honestly I don't know... if debian does then yes...
Hmmhh, from the scripts in /etc/rcS.d to tell it checks the rootfs and
later on calls fsck for each filesystem. If fsck calls reiserfsck then
the version in debian unstable, i.e. 3.6.4-5 was used to check the fs.

(The 3.6.6 tools are compiled but not installed) 

So how did I get there... all I did was:

1) partition the disk
2) mkreiserfs (without reboot)
3) copy the stuff over
4) reboot
5) boot into single user copy the rest from /home over
6) mount partition on /home

no crash inbetween that.

if a wrong partition table can cause that then good+ shame on me... if
not well then its bad.

> > Or could this be caused by "repartitioning but not reboot and then
> > mkreiserfs" ? I did not reboot as the last partition was hfs+ and all I
> > did was deleting+creating a linux partition instead...
> 
> Well, if fdisk told you to reboot and you did not, this is bad,
> but it may not cause such things.

well it definitely did, but as I said I recreated a partition of same
size... maybe it is all different with apple partition tables. next time
.
> > Can one check whether partition sizes are the same as reiserfs thinks ?
> 
> Sure. reiserfsck does this. (it checks that fs is less or equal than underlying block device)
> 
> > Count of blocks on the device: 5476231
> (20.89016342163085937500 G)
> 
> > /dev/hda7         Apple_UNIX_SVR2 home                43809856 @ 73400384  ( 20.9G)  Linux native
> 
> This looks close enough, but is subject to rounding errors ;)

:-))

S.

