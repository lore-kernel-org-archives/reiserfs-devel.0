From: Oleg Drokin <green@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released ...
Date: Fri, 25 Apr 2003 13:46:30 +0400
Message-ID: <20030425094630.GH10802@namesys.com>
References: <1051258287.5564.1.camel@fortknox> <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com> <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com> <1051263219.1642.10.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051263219.1642.10.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Apr 25, 2003 at 11:33:40AM +0200, Soeren Sonnenburg wrote:
> > > > There are no known endianness issues in reiserfs code now.
> > > > You di not had reboot or something like that after you copied the data over?
> > > I rebooted ... it is the /home partition.
> > Do you start reiserfsck on boot (3.6.6 one?) ?
> > Was the reboot clean?
> Hmmhhh, I can now access the file (after I did --fix-fixable) ...
> strange. I also rebooted and checked the fs again... it reports to be
> ok.

Well, fsck is expected to fix things.
The strange thing is how you get into error state.

> IIRC there was no unclean reboot before that vs-3050 thing appeared.

Hm. But do you run reiserfsck on boot?

> Or could this be caused by "repartitioning but not reboot and then
> mkreiserfs" ? I did not reboot as the last partition was hfs+ and all I
> did was deleting+creating a linux partition instead...

Well, if fdisk told you to reboot and you did not, this is bad,
but it may not cause such things.

> Can one check whether partition sizes are the same as reiserfs thinks ?

Sure. reiserfsck does this. (it checks that fs is less or equal than underlying block device)

> Count of blocks on the device: 5476231
(20.89016342163085937500 G)

> /dev/hda7         Apple_UNIX_SVR2 home                43809856 @ 73400384  ( 20.9G)  Linux native

This looks close enough, but is subject to rounding errors ;)

Bye,
    Oleg
