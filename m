From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format
 4.0.2
Date: Mon, 27 Nov 2017 14:46:23 +0100
Message-ID: <8db85297-34f8-980c-dab9-c98b95fb592c@gmail.com>
References: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
 <1511788205.5344.2.camel@z-51.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=z6uuyywcxPoQsamA/vjymUy5pqES+Bp+r/WbU+UJR/E=;
        b=nzMRa8//LICit01BQv3hqRlYlIuXThVPVIT+QhdLkee/2yx08gU0RZyJhxcLaUHDrF
         Jpx15NnH6cW51UEGPqBA/wGxGZBd5/EK66e5h8l9V36/pLOrWaG1Th6kwYhiYYrThSaR
         2I6G811LCLvT38I3ROf9wqCgUMobofFvUvUkogpnGW4SpvQUQzNR5POGMzZTiIjxdaau
         QyW9zig5XbeW2b1SCAJNrQl88LHdr6f57IDxkq98u9bqNNsFbuAy11Z8kOcvPwKqIqsA
         YhLt0+XKCQAslzRKchR8nzsRG0oUGViAwowFPUk4o479sQ3DLIrpRWA4Ng629C5OIpgs
         XOpw==
In-Reply-To: <1511788205.5344.2.camel@z-51.de>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felix Zielcke <fzielcke@z-51.de>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Hi Felix,

Thank you for the report, I'll try to find out, what is wrong.

Edward.

On 11/27/2017 02:10 PM, Felix Zielcke wrote:
> Am Montag, den 27.11.2017, 00:01 +0100 schrieb Edward Shishkin:
>> Hi all,
>>
>> ZSTD compression support in Reiser4 is brought for you by BratSinot.
>> We recommend it as a replacement of gzip1. To enjoy ZSTD compression,
>> please build and install kernel stuff for linux-4.14, reiser4progs-
>> 1.2.0,
>> and specify mkfs option "-o compress=zstd1".
>>
>> In accordance with Reiser4 development model we announce a new
>> software framework release 4.0.2 of Reiser4 kernel module and
>> Reiser4progs. So, before the next mount session please don't forget
>> to check your old reiser4 partitions by new fsck to update things
>> (not urgently).
>>
>> The latest stuff can be found here:
>> https://sourceforge.net/projects/reiser4/files
>> https://github.com/edward6/
>>
>> Thanks,
>> Edward.
>>
> Hi Edward,
>
> I have now uploaded the new versions of reiser4progs and libaal to
> Debian. But reiser4progs fail to build now on every architecture except
> amd64 and i386
> See: https://buildd.debian.org/status/package.php?p=reiser4progs
> Previous 1.1.0 version worked fine.
>
> Regards,
> Felix

