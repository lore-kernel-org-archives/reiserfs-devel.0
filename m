From: Ric Wheeler <ric@emc.com>
Subject: Re: bad block management
Date: Fri, 04 Apr 2008 14:58:35 -0400
Message-ID: <47F67A5B.1010903@emc.com>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de> <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com> <1207268072.379391.7.camel@localhost> <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au>
Reply-To: ric@emc.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Toby Thain <toby@telegraphics.com.au>
Cc: Zan Lynx <zlynx@acm.org>, Jeff Mahoney <jeffm@suse.com>, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


Toby Thain wrote:
> 
> On 3-Apr-08, at 8:14 PM, Zan Lynx wrote:
>> On Tue, 2008-04-01 at 15:51 -0400, Jeff Mahoney wrote:
>>
>>> Ric's right about disk drives, though. They'll remap the bad sectors
>>> automatically at the hardware level. When you start to see bad sectors
>>> at the file system level, it means that the sectors reserved for
>>> remapping have been exhausted and you should replace the disk.
>>
>> There are a couple of cases where you can see bad block errors on a good
>> drive.
>>
>> If a block is written with a bad CRC for some reason...the write head
>> got a freak blip or it lost power as it was writing, or the data went
>> corrupt while sitting on disk, then it will read as a bad block, but
>> rewriting would fix it.
>>
>> A RAID media verify or a badblocks -n run can usually fix these.
> 
> Only if your RAID uses CRCs (most don't).
> 
> ZFS is the real answer to undetected corruption.
> 
> --Toby

Zan is right - even on a local drive, a write can repair some sectors with bad 
protection bits. All disks have per sector data protection (reed solomon 
encoding, etc) and there are lots of those bits per sector.

There is work on adding DIF (data integrity f?) which is extra bytes that arrays 
or local drives can store for application level protection. Martin Petersen has 
some good slides about this on linux:

http://oss.oracle.com/projects/data-integrity/documentation/

ZFS, for example, or more specifically its lvm layer, could use DIF to add this 
kind of protection.

The other way to go is to use an enterprise class array - they all have multiple 
layers of data integrity baked in to deal with and correct these kind of errors.

ric
