From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 25 Apr 2003 11:05:56 +0200
Message-ID: <1051261556.3513.31.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
	 <1051259723.3513.7.camel@localhost>  <20030425084742.GA22827@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030425084742.GA22827@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2003-04-25 at 10:47, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Apr 25, 2003 at 10:35:23AM +0200, Soeren Sonnenburg wrote:
> 
> > The filesystem was freshly created (today) and 10G were tarred on the
> > disk...
> > the /home partition is reiserfs (where that file is on), / is ext3
> > As I was using reiserfs for a quite long time on any kind of i386
> > hardware I guess it is a little/big endian issue.
> 
> There are no known endianness issues in reiserfs code now.
> You di not had reboot or something like that after you copied the data over?

I rebooted ... it is the /home partition.

> What is the latest reiserfsck reports for your fs?

the 3.6.6 version did find some corruption in superblock (one bit ?!)
which could be fixed with fix-fixable

I will try to acces that file but first send this mail (as it is send
from that particular machine)

Soeren.

