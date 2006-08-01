From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 1 Aug 2006 15:40:37 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608011540020.32227@yvahk01.tjqt.qr>
References: <44CE7C31.5090402@gmx.de> <5c49b0ed0607311621i54f1c46fh9137f8955c9ea4be@mail.gmail.com>
 <Pine.LNX.4.63.0607311621360.14674@qynat.qvtvafvgr.pbz>
 <5c49b0ed0607311650j4b86d0c3h853578f58db16140@mail.gmail.com>
 <Pine.LNX.4.63.0607311651410.14674@qynat.qvtvafvgr.pbz>
 <5c49b0ed0607311705t1eb8fc6bs9a68a43059bfa91a@mail.gmail.com>
 <20060801010215.GA24946@merlin.emma.line.org> <20060801095141.5ec0b479.reiser4@blinkenlights.ch>
 <20060801090947.GA2974@merlin.emma.line.org> <Pine.LNX.4.61.0608011255130.29748@yvahk01.tjqt.qr>
 <20060801131553.GA8249@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29393-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801131553.GA8249@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, nate.diller@gmail.com, dlang@digitalinsight.com, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>> >I didn't mean to say your particular drive were crap, but 200GB SATA
>> >drives are low end, like it or not --
>> 
>> And you think an 18 GB SCSI disk just does it better because it's SCSI?
>
>18 GB SCSI disks are 1999 gear, so who cares?
>Seagate didn't sell 200 GB SATA drives at that time.
>
>> Esp. in long sequential reads.
>
>You think SCSI drives aren't on par? Right, they're ahead.
>98 MB/s for the fastest SCSI drives vs. 88 MB/s for Raptor 150 GB SATA
>and 74 MB/s for the fastest other ATA drives.

Uhuh. And how do they measure that? Did they actually ran sth like...
  dd_rescue /dev/hda /dev/null




Jan Engelhardt
-- 
