From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Re: [STUPID TESTCASE] ext3 htree vs. reiserfs on 2.5.40-mm1
Date: Fri, 4 Oct 2002 16:01:26 -0600
Message-ID: <20021004220126.GB3000@clusterfs.com>
References: <200210042254.23978.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200210042254.23978.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter =?unknown-8bit?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Chris Mason <mason@suse.com>, Paul P Komkoff Jr <i@stingr.net>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>

On Oct 04, 2002  22:54 +0200, Dieter N?tzel wrote:
> Am Mittwoch, 2. Oktober 2002 10:48 schrieb Paul P Komkoff Jr:
> > Replying to Andreas Dilger:
> > > Why do you think data=writeback is better than data=journal?  If the
> > > files have no data then it should not make a difference.
> >
> > It is better than default data=ordered I think :)
> > Reiserfs worked fine because it don't have such kind of limit ...
> 
> Orange and apples, again?
> 
> Try with latest ReiserFS data-logging and see what we get?
> Chris do you have something for 2.5.40+ ready?

I don't think it will make much difference - the files being created
are zero-length files so the journaling mode is irrelevant.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

