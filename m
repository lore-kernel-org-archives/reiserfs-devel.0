From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Bad root block 0. (--rebuild-tree did not complete)
Date: Tue, 02 Dec 2003 22:17:54 +0100
Message-ID: <3FCD0182.3050206@gmx.net>
References: <3FCCE7CA.7090306@inf.ethz.ch> <200312022306.49388.vitaly@namesys.com> <3FCCF5E4.8020908@inf.ethz.ch> <3FCCF88D.5050006@gmx.net> <3FCCFBDE.50909@inf.ethz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCCFBDE.50909@inf.ethz.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Schmitt <mschmitt@inf.ethz.ch>
Cc: Vitaly Fertman <vitaly@namesys.com>, ReiserFS-List <reiserfs-list@namesys.com>

Hi Marc,

Marc Schmitt wrote:
> 
> Carl-Daniel Hailfinger wrote:
> 
>> Marc Schmitt wrote:
>>  
>>> [...]
>>>
>>> It is running now. I'll make the file metadata.bz2 available for
>>> downloading asap. ETA is 10h, right, if the `reiserfsck --rebuild-tree`
>>> took 10h before it segfaulted?
>>
>> No. More like a few minutes for disk accesses and some time for
>> compressing the result. The command is of the "read all metadata and dump
>> it without any additional checks whatsoever" variety.
>>
> Hmm, it's running for 15' now and it does not look like it's going to
> finish soon:
> 
[...]
> Super block, bitmaps, journal - 13590 blocks - done, 162967267 blocks left
> 0%                                                    left 161169318,
> 1250 /sec
> 
> The file metadata.bz2 is still growing. The 1250 /sec increased slowly
> during fsck and went up to 6000 /sec towards the end. At the current
> pace, it would take 36h...

Sorry, I totally underestimated your disk_size/transfer_rate ratio. Your
disks are probably 1000x larger than mine (4GB), but not 1000x faster.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

