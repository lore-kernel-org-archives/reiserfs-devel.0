From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: bad block management
Date: Fri, 4 Apr 2008 00:21:48 -0400
Message-ID: <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de> <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com> <1207268072.379391.7.camel@localhost>
Mime-Version: 1.0 (Apple Message framework v753)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1207268072.379391.7.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Zan Lynx <zlynx@acm.org>
Cc: Jeff Mahoney <jeffm@suse.com>, ric@emc.com, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


On 3-Apr-08, at 8:14 PM, Zan Lynx wrote:
> On Tue, 2008-04-01 at 15:51 -0400, Jeff Mahoney wrote:
>
>> Ric's right about disk drives, though. They'll remap the bad sectors
>> automatically at the hardware level. When you start to see bad  
>> sectors
>> at the file system level, it means that the sectors reserved for
>> remapping have been exhausted and you should replace the disk.
>
> There are a couple of cases where you can see bad block errors on a  
> good
> drive.
>
> If a block is written with a bad CRC for some reason...the write head
> got a freak blip or it lost power as it was writing, or the data went
> corrupt while sitting on disk, then it will read as a bad block, but
> rewriting would fix it.
>
> A RAID media verify or a badblocks -n run can usually fix these.

Only if your RAID uses CRCs (most don't).

ZFS is the real answer to undetected corruption.

--Toby

> -- 
> Zan Lynx <zlynx@acm.org>

