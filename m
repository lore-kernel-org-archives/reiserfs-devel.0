From: Hans Reiser <reiser@namesys.com>
Subject: Re: umount bug?
Date: Thu, 24 Mar 2005 10:01:03 -0800
Message-ID: <4243005F.8040100@namesys.com>
References: <4241B21B.9070404@cpc.wmin.ac.uk> <424270E5.5050800@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <424270E5.5050800@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "E.Gryaznova" <grev@namesys.com>
Cc: Szabolcs Illes <illes@cpc.wmin.ac.uk>, reiserfs-list@namesys.com

E.Gryaznova wrote:

> Hello.
>
> Szabolcs Illes wrote:
>
>> Hi,
>>
>> When I tried to umount my reiserfs4 partition I got this error
>> message in the kernel log:
>>
> [skip]
>
>>
>> root@project1:~#
>>
>> I am using the latest kernel 2.6.11 with the patch available from
>> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-1.gz
>
>
> reiser4-for-2.6.11-1.gz is bugged. It is known. Wait please the next
> reiser4 release for 2.6.11.
>
> Thanks,
> Lena
>
>> What is strange I rarely use this partition. The bug happend after I
>> had updated my kernel from 2.6.10 to 2.6.11. I did not copy anything
>> from/to that partition, just tried to umount it.
>>
>> Cheers,
>> Szabolcs
>>
>>
>
>
>
>
Why have we left on our website a release known to be buggy?  Fix please.

Hans
