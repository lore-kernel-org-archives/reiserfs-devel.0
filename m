From: Oleg Drokin <green@namesys.com>
Subject: Re: trouble with reiserfs on ppc vs-3050: wait_buffer_until_released ...
Date: Fri, 25 Apr 2003 14:28:12 +0400
Message-ID: <20030425102812.GA24352@namesys.com>
References: <1051258287.5564.1.camel@fortknox> <1051259723.3513.7.camel@localhost> <20030425084742.GA22827@namesys.com> <1051261556.3513.31.camel@localhost> <20030425091916.GG10802@namesys.com> <1051263219.1642.10.camel@localhost> <20030425094630.GH10802@namesys.com> <1051265575.1656.37.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1051265575.1656.37.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <reiserfs@nn7.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Apr 25, 2003 at 12:12:55PM +0200, Soeren Sonnenburg wrote:

> > Well, fsck is expected to fix things.
> actually I don't know why a wait_buffer_until_released (waiting forever)
> can happen...

Well, we know why the wait_buffer_until_released problem,
because of bitmap corruption. (block that is used was marked free and was allocated for
new data).

> > Hm. But do you run reiserfsck on boot?
> Honestly I don't know... if debian does then yes...
> Hmmhh, from the scripts in /etc/rcS.d to tell it checks the rootfs and
> later on calls fsck for each filesystem. If fsck calls reiserfsck then
> the version in debian unstable, i.e. 3.6.4-5 was used to check the fs.

Well, ok, 3.6.4-5 does not doo anything on boot yet. Hm.

> So how did I get there... all I did was:
> 1) partition the disk
> 2) mkreiserfs (without reboot)
> 3) copy the stuff over
> 4) reboot
> 5) boot into single user copy the rest from /home over
> 6) mount partition on /home
> no crash inbetween that.

Hm.
Ok, is this a new box? any chance to check if the memory is right?

Bye,
    Oleg
