From: Christian Kujau <evil@g-house.de>
Subject: Re: Fatal File System Corruption -Software RAID + NFS
Date: Mon, 17 Nov 2003 21:58:53 +0100
Message-ID: <3FB9368D.7050109@g-house.de>
References: <3FB7AE00.4070409@uiuc.edu> <3FB7CFEB.9080705@g-house.de> <3FB8DF75.4020802@insightbb.com> <3FB8FE96.2080203@uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB8FE96.2080203@uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Poulakos <poulakos@uiuc.edu>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Steven Poulakos wrote:
> at 33MHz.   Since I'm using a Promise Ultra100Tx2 controller card, it 
> might not be able to operate fast enough to support UDMA 5.  Is this 
> correct?

are you using the promise chipset drivers then? did you try without 
these and instead using plain generic ide drivers?

i dunno much of the innards of any bus-subsystems, but "good drives and 
good cabling" are a must, of course. i myself experience SCSI related 
problems when using high-speed scsi disks in a low-end machine....


Christian.
-- 
BOFH excuse #65:

system needs to be rebooted

