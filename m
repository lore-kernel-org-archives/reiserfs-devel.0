From: Jeff Breidenbach <jbreiden@parc.com>
Subject: Re: disk or reiserfs problem?
Date: Mon, 2 Jun 2003 13:00:36 PDT
Message-ID: <1054584035.21053.65.camel@rode>
References: <E19L7Co-0002Sb-00@rode.parc.com>
	 <20030529054511.GA30925@namesys.com>  <3EDB9910.7040005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDB9910.7040005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Well, I retrieved the disk from the colocation facility - 
it is basically totalled. BIOS and the linux kernel make 
about 5 attempts each at spinning up the drive. It spins 
up then spins down after a few seconds. No software tool 
in the worldwill get data off a disk that isn't spinning. 
I gave up, bought a new disk, and am restoring from backups.

Incidentally, during the restoration I find that cp is 
giving a throughput of about 1 MB/s when copying from 
harddrive to harddrive. Both source and destination disks 
use reiserfs and hdparm -tT reports about 50MB/s read rate. 
Is a 1MB/s throughput expected when copying many small files?
(There is a lot of data involved, so I probably have a couple 
of days to ponder the question.)

Cheers,
Jeff


On Mon, 2003-06-02 at 11:36, Hans Reiser wrote:
> Oleg Drokin wrote:
> 
> >Hello!
> >
> >On Wed, May 28, 2003 at 01:07:27PM -0700, Jeff Breidenbach wrote:
> >  
> >
> >>This is after a hard (power switch) reboot (due to I/O errors). The
> >>disk in question has about 125 GB of data on a single 200GB reiserfs
> >>partition. Do people think the disk is toast, or is this possibly some
> >>correctable filesystem problem? The machine is remote, so I can't
> >>hdb1: bad access: block=35, count=5
> >>end_request: I/O error, dev 03:41 (hdb), sector 35
> >>    
> >>
> >
> >Looks like disk have gone bad. If you are lucky enough, some of the data
> >still can be recovered. Try to copy entire disk into a file/to another
> >disk to see how much bad sectors are there.
> >
> >Bye,
> >    Oleg
> >
> >
> >  
> >
> You should provide more details in such advice, such as telling him 
> about dd_rescue and why it is better than dd, etc.  You should also 
> explain that if it is only a few blocks that are bad, writing to the bad 
> blocks can make them go away most of the time (the drive will remap them).
-- 
Jeff Breidenbach <jbreiden@parc.com>
Member of Research Staff, PARC

