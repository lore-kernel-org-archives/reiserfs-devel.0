From: Marc Schmitt <mschmitt@inf.ethz.ch>
Subject: Re: Bad root block 0. (--rebuild-tree did not complete)
Date: Tue, 02 Dec 2003 21:53:50 +0100
Message-ID: <3FCCFBDE.50909@inf.ethz.ch>
References: <3FCCE7CA.7090306@inf.ethz.ch> <200312022306.49388.vitaly@namesys.com> <3FCCF5E4.8020908@inf.ethz.ch> <3FCCF88D.5050006@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCCF88D.5050006@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Vitaly Fertman <vitaly@namesys.com>, ReiserFS-List <reiserfs-list@namesys.com>

Hi Carl-Daniel,

Carl-Daniel Hailfinger wrote:

>Marc Schmitt wrote:
>  
>
>>Hi Vitaly,
>>
>>Thanks for the fast answer.
>>
>>Vitaly Fertman wrote:
>>
>>    
>>
>>>Hi Marc,
>>>
>>>      
>>>
>[...]
>  
>
>>>Would you run    debugreiserfs -p /dev/problem_device | bzip2 -c >
>>>metadata.bz2
>>>and make it available for downloading. I will debug the problem
>>>locally then.
>>>
>>>      
>>>
>>It is running now. I'll make the file metadata.bz2 available for
>>downloading asap. ETA is 10h, right, if the `reiserfsck --rebuild-tree`
>>took 10h before it segfaulted?
>>    
>>
>
>No. More like a few minutes for disk accesses and some time for
>compressing the result. The command is of the "read all metadata and dump
>it without any additional checks whatsoever" variety.
>
Hmm, it's running for 15' now and it does not look like it's going to 
finish soon:

debugreiserfs 3.6.11 (2003 www.namesys.com)

Loading on-disk bitmap .. 162980857 bits set - done
super block..ok
bitmaps..(5396).. ok
journal (from 18 to 8210)..ok
Super block, bitmaps, journal - 13590 blocks - done, 162967267 blocks left
0%                                                    left 161169318, 
1250 /sec

The file metadata.bz2 is still growing. The 1250 /sec increased slowly 
during fsck and went up to 6000 /sec towards the end. At the current 
pace, it would take 36h...

Greetz
    Marc



