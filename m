From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4.1
Date: Thu, 03 Mar 2005 03:09:01 -0800
Message-ID: <4226F04D.2090303@namesys.com>
References: <4461b4b458db80949fe1830f90501153@hotmail.com> <1109776277.3504.469.camel@tribesman.namesys.com> <42263473.7050900@namesys.com> <37288019.20050303095520@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <37288019.20050303095520@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

Pysiak Satriani wrote:

>Hi
>
>  
>
>>Compression is what will be in 4.1, not the repacker.  At least, I hope
>>edward gets it done soon.....
>>    
>>
>I've read an interview with Hans in the polish edition of Chip Special some
>time ago.
>I remember Hans saying that nowadays CPUs are so fast, they compress
>faster than HDDs move the heads around and do the writes.
>

That is the fact. Moreover CPUs tends to develop faster then hard drives.

> So compression,
>if done properly, can be with no negative impact to speed.
>
>Can you say what level of compression with which processors would handle
>it without speedloss?
>
We don't have comprehensive benchmarks as it is not quite stable. The 
following is some
results for 'cp'. Note that the cpu time doesn't include flushing and 
compression:

belka workstation:
Dual Intel(R) Xeon(TM) CPU 2.40GHz;
1G RAM;
36G ide   partition;
SMP on;
Linux 2.6.9-rc1-mm5
reiser4 (Large keys)

Creation of 20 linux source trees

UNIX_FILES:

(policy=tails)
real    2m32.505s
sys     1m18.876s
df      3205900

(policy=smart)
real    2m22.251s
sys     1m1.100s
df      3292936

CRYPTCOMPRESS FILES
(64K compression):

NONE
real    2m27.448s
sys     0m46.702s
df      3214952

GZIP1
real    2m50.132s
sys     0m44.647s
df      1045660

LZO1
real    1m52.028s
sys     0m44.779s
df      1343188

LZRW1
real    1m50.048s
sys     0m44.644s
df      1504196


>Regards,
>Maciej
>
>  
>

