From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: External journals and NVRAM devices
Date: Fri, 1 Nov 2002 07:29:44 UT
Message-ID: <20021101072944.33C2B47683B@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Thu, 31 Oct 2002 23:29:57 -0700, "Andreas Dilger"
<adilger@clusterfs.com> said:
> When people were testing this with ext3 external journals, they just
> used a RAMDISK for getting the performance measurements.  Obviously,
> (I hope ;-) this is not something you can do in real life, but for
> performance measurement it is OK.
> 
> Most people found that the ramdisk (and presumably the NVRAM device too)
> didn't perform much, if any, better than having a separate fast disk for
> the journal, because you are doing sequential I/O to the journal anyways.
<...>

Yes, I'd heard something like this. Our servers aren't going to have a
spare drive bay, I think, so a PCI NVRAM card may turn out to be a more
economical solution (although I haven't received quotes back from the
vendors yet...).

If I do find a spare drive bay, how unsafe would it be to use a single
drive, rather than RAID 1 mirroring? What does ReiserFS do if it gets an
IO error on the journal device? Could that bring down our whole system? I
assume that it would--in which case using NVRAM would actually save two
drive bays, since it should be reliable enough to not need redundency.

So, how big is a ReiserFS journal when using data=journal anyways?...
