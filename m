From: Hans Reiser <reiser@namesys.com>
Subject: Re: disk or reiserfs problem?
Date: Thu, 05 Jun 2003 17:20:09 +0400
Message-ID: <3EDF4389.7090308@namesys.com>
References: <E19L7Co-0002Sb-00@rode.parc.com> <20030529054511.GA30925@namesys.com> <3EDB9910.7040005@namesys.com> <1054584035.21053.65.camel@rode> <20030603053336.GC8667@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030603053336.GC8667@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Jeff Breidenbach <jbreiden@parc.com>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Jun 02, 2003 at 01:00:36PM -0700, Jeff Breidenbach wrote:
>
>  
>
>>Incidentally, during the restoration I find that cp is 
>>giving a throughput of about 1 MB/s when copying from 
>>harddrive to harddrive. Both source and destination disks 
>>use reiserfs and hdparm -tT reports about 50MB/s read rate. 
>>Is a 1MB/s throughput expected when copying many small files?
>>(There is a lot of data involved, so I probably have a couple 
>>of days to ponder the question.)
>>    
>>
>
>Copying lots of small files can take lots of time just because you
>cannot read those in order they are stored on disk platter. And you do not know
>the order most probably. So the end result is the disk does constant seeking and
>the speed is reduced. If you know the order in which files were written (e.g. alphabetically),
>then you can read them in the same order (plain "cp -R . somedir" will read files in readdir order)
>I am not very sure what can be done in such a case if you do not know the order in
>which files were written. Perhaps if you copy the mounted backup drive to /dev/zero
>(e.g. dd if=/dev/hdb1 /dev/zero bs=1024k count=500 (replace 500 with the half of your RAM
>in megabytes) and you have large enough RAM, there is a chance that this will cache
>enough data to keep stuff moving more quickly. 
>
>Bye,
>    Oleg
>
>
>  
>
Your performance will improve after the restoration though....

-- 
Hans


