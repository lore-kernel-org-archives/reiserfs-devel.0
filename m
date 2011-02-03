From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Thu, 03 Feb 2011 23:09:02 +0100
Message-ID: <4D4B277E.5030700@gmail.com>
References: <4D4B1887.3020306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D4B1887.3020306@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Gleb Baryshev wrote:
> 03.02.2011 22:09, Edward Shishkin writes:
>> Sorry, but this file looks corrupted.
>> Could you please try again?
>>
>> Also make sure that packed meta-data are
>> extracted correctly by the following way:
>>
>> #touch meta_tmp
>> #bzcat meta.bz2 | debugfs.reiser4 -U meta_tmp
>
> For some reason, debugfs was adding junk every time - 8 bytes (1B 5B 3F
> 31 30 33 34 68) before 'VRSN'; in other respects the metadata file is
> all right. Finally I ran debugfs from LiveCD and got correct dump:
> http://tootiny.net/813h25

OK, thanks,
Eventually I have reproduced the segfault.
I'll try to figure out what is wrong with fsck, but it can take some time..

Edward.

>
> BTW, fsck from LiveCD segfaulted, too.
>
> Gleb
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

