From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.11
Date: Sun, 15 Sep 2013 21:37:31 +0200
Message-ID: <52360C7B.6080908@gmail.com>
References: <3473565.3piOE8Lf58@intelfx-laptop> <522DA671.9040006@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=8oZtri53jkrJmZuJoIivKr2kThNnlFnJPqEqsrQ6jsg=;
        b=q3i8FmZ++jTaxklWecwkyNScVgcrVPeHKnEDJBEniLkqHVMLlBBCAZfpAnrYcVqvYj
         Dc2I4WzPqQIPDY5Yfy12lrA9qN0HEwiEHWZawMapPfkMRYQXMMoYQO+D+id5NXmb5bjs
         EjUESQI+Y7jhobU1h0ZscqYBtGUQWrpdP0EtCLUAcmPdG6JJq2rcUuZGC1CPHReZklHQ
         4fZh419TDFoavwcbWo3S7S2biP0L1odJ21DuCXjikaMScAZY4tf11r380N9v6dIfGkPl
         LAg2WuYS0JNNIr1DMcE0vMGQQhxRKYiXaEJiLHpG9LXafefGXCyQ14xr19dVpC7J8CgT
         PcpQ==
In-Reply-To: <522DA671.9040006@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 09/09/2013 12:44 PM, Edward Shishkin wrote:
> On 09/06/2013 07:36 AM, Ivan Shapovalov wrote:
>> Hi Edward!
>>
>> I'm sorry for the silence... The summer, as it usually happens, 
>> turned out to
>> be not-easier-than-studying-days (personal life and all), so 
>> unfortunately
>> there is not much progress with TRIM implementation for reiser4. 
>> There is some
>> code, but it's stability is zero.
>>
>> Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 
>> got a
>> significant API change (readdir() of file_operations changed to 
>> iterate()),
>> and I'm unsure if I done that correctly. But it works, unlike TRIM. :)
>
>
> Cool. Thanks!!!
>
>
>>
>> (FYI, iterate() differs from readdir() mostly in that it works with a 
>> copy of
>> f_pos instead of with f->f_pos directly.)
>
>
> AFAIK they fixed races in readdir() and friends.
> I'll take a look at this more carefully...


Vfs people have introduced a new field (.for_sync) of  struct 
wb_writeback_work,
it should be initialized as 1 in reiser4_sync_fs().

The next comment is that all PF_FOO flags should be "independent". In 
particular,
"compound" values like 0x80000002 are unacceptable for PF_FLUSHER (is it 
clear,
why so?). I would recommend 0x00000001, or 0x00000002.

In other bits the patch looks OK.

Thanks!
Edward.
