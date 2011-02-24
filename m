From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question about reiser performance - short system freezes
Date: Thu, 24 Feb 2011 19:29:24 +0100
Message-ID: <4D66A384.9000005@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D664A0E.8020900@gmail.com> <4D65CEAF.31101.5A677E@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D65CEAF.31101.5A677E@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 02/24/2011 04:21 AM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
>>> May be that my comment might be userfull for your reiser development:
>>>
>>> I am facing following performance issue. The reiser works without data loss,
>>> but system sometimes hangs for 15s, mouse cursor is frozen and after this
>>> period it continues to work without any problem. It is strange, because I have 6 cores
>>> and all of them seems to be locked and waiting for something.
>>>
>>> Hanging occurs during intensive file search like find, or first phase
>>> of rsync.
>>>
>>> It seems to me that both reiser3 and reiser4 suffer by this issue.
>>> I have found BKL inside reiser3, but reiser4 seems to be without BKL.
>>>
>>> It is also strange that OS resides on different partition that should not
>>> be affected by reiser locking.
>>>
>>> May be that it could be problem large say 600GB HDD partition. But these partitins
>>> are normal nowadays.
>>>
>>> Is there any idea how to overcome this issue?
>>>
>>
>> Which kernel version?
>
> I have tested these kernels: 2.6.32.11 and 2.6.34.

Hello Jaroslav.

It might be a regression that have been fixed in the latest
kernels. Consider upgrading to .37. If it doesn't disappear,
then please send the SysRq-w output.

Thanks,
Edward.
