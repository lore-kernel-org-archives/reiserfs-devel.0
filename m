From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch 0/7] per-bdi flushing model improvements. reiser4
Date: Tue, 02 Feb 2010 23:26:20 +0100
Message-ID: <4B68A68C.6030001@gmail.com>
References: <201002020255.46920.edward.shishkin@gmail.com>	 <20100202081728.GA2384@infradead.org> <4B6843E9.9070600@gmail.com>	 <20100202194208.GD5733@kernel.dk> <5e2ec5ac1002021345g569c743dtc5ccf77cde6738ae@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5e2ec5ac1002021345g569c743dtc5ccf77cde6738ae@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ronni Holm-Nielsen <theronni@gmail.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com, Johannes Buchner <buchner.johannes@gmx.at>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Hello everyone.

The patches 1-3 are reverses for the following -mm stuff:

http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-fixed-null-pointer-dereference.patch
http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-generic_sync_sb_inodes-doesnt-exist-anymore.patch
http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-vfs-add-super_operationssync_inodes-2.patch

This is incorrect attempts to adjust reiser4 to the new per-bdi flushing 
model.
The authors are cc-ed,
any comments, suggestions are welcome.

Thanks,
Edward.


Ronni Holm-Nielsen wrote:
> To clarify (being a ReiserFS subscriber):
>
> patch 0, 4-6 sent to Andrew, ReiserFS, linux-fsdevel, linux-kernel, xfs,
> jens.axboe
> patch 1-3, 7 sent to Andrew, ReiserFS
>
> - Ronni
>
> On Tue, Feb 2, 2010 at 11:42 PM, Jens Axboe <jens.axboe@oracle.com> wrote:
>
>   
>> On Tue, Feb 02 2010, Edward Shishkin wrote:
>>     
>>> Christoph Hellwig wrote:
>>>       
>>>> I got this introduction twice, but patches 1-3 didn't make it to any of
>>>> the lists.
>>>>
>>>>
>>>>
>>>>         
>>> done
>>>       
>> Where?
>>
>> --
>> Jens Axboe
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>     
>
>
>
>   

