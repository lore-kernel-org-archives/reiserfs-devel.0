From: Edward Shishkin <edward@namesys.com>
Subject: Re: External journals and NVRAM devices
Date: Fri, 01 Nov 2002 17:30:18 +0300
Sender: edward
Message-ID: <3DC28FFA.462FF30F@namesys.com>
References: <3DC21358.5040808@fastmail.fm> <20021101062957.GE554@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Howard <jh_lists@fastmail.fm>
Cc: Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>

Andreas Dilger wrote:
> 
> On Nov 01, 2002  16:38 +1100, Jeremy Howard wrote:
> > I'm looking at buying solid state drives / NVRAM drives for our servers
> > to hold an external ReiserFS journal.
> >
> > We are using 2.4.20pre11, and Chris Mason's data logging patches.
> >
> > I'm looking for any tips on how large the journal is when using
> > data=journal, and whether the external log patches are stable and work OK
> > in data=journal mode. 

Yes. And the experience said that external logging brings a bit better effect 
for this journal mode then for other ones. 

> >Is there a command to show the current journal size? 

#debugreiserfs main_device

> > Does the size vary over time? We need to ensure we buy a card with
> > enough memory so this is important information for us.

The journal size remains the same unless you specify another one by
reiserfstune utility.  

Thanks,
Edward.

> >
> > Is anyone currently using NVRAM for the journal? If so, how do you find
> > the performance of this configuration?
> 
> When people were testing this with ext3 external journals, they just
> used a RAMDISK for getting the performance measurements.  Obviously,
> (I hope ;-) this is not something you can do in real life, but for
> performance measurement it is OK.
> 
> Most people found that the ramdisk (and presumably the NVRAM device too)
> didn't perform much, if any, better than having a separate fast disk for
> the journal, because you are doing sequential I/O to the journal anyways.
> If it is on a separate disk/controller from the filesystem you don't have
> any seek or channel contention with the filesystem.  Of course, using a
> regular disk for the journal is MUCH cheaper than an NVRAM card, so you
> probably want to test this out before you go ahead and buy the NVRAM card.
> 
> NVRAM devices are great for disks you are doing a lot of random I/O
> on (maybe database indexes or something), because there is zero seek
> latency, but for sequential I/O (like the journal) it really isn't
> anything special.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/
