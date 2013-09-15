From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 for 3.11
Date: Sun, 15 Sep 2013 20:13:49 +0000
Message-ID: <523614FD.6010708@gmail.com>
References: <3473565.3piOE8Lf58@intelfx-laptop> <522DA671.9040006@gmail.com> <52360C7B.6080908@gmail.com> <5377295.oFoUDLQBZJ@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Jv1LxsF4KcBC6FXFGG8doQJWFdFmQEfbf7bmftFS1K8=;
        b=vMdfgxzv6alYn+3AECGlUaEGEtJOwJMfZVuU+i0xsN7Uw20G46DIKW7BB/Ua2kfPzL
         9KNWmvinmGxxUhYRo2fBkyeIGVDeA87bJukiVFfc9k88hZeMxoH/vhSsVo4JkNbHl/G6
         V3F8M4IfVC/oYhV6h5qFg97hZ2vbnUSCrX2kr4mDHfsdFY0azJxQLvBU/H2D47fTPdaW
         bkvuSVbE5EoUR3I6oUWedOD7izkKtLJx3cNWLiVqXRhop95PPLWvO5dW4NKIwdz+sWNj
         3MrXowdt72lxsoOBCa6FbhivxaEaJRuFHFUx0/TgqaSDb1vACmeGwtFF/kExPlzIFnpD
         bTiA==
In-Reply-To: <5377295.oFoUDLQBZJ@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 09/15/13 19:51, Ivan Shapovalov wrote:
> On Sunday 15 September 2013 at 21:37:31, Edward wrote:
>> On 09/09/2013 12:44 PM, Edward Shishkin wrote:
>>> On 09/06/2013 07:36 AM, Ivan Shapovalov wrote:
>>>> Hi Edward!
>>>>
>>>> I'm sorry for the silence... The summer, as it usually happens, 
>>>> turned out to
>>>> be not-easier-than-studying-days (personal life and all), so 
>>>> unfortunately
>>>> there is not much progress with TRIM implementation for reiser4. 
>>>> There is some
>>>> code, but it's stability is zero.
>>>>
>>>> Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 
>>>> got a
>>>> significant API change (readdir() of file_operations changed to 
>>>> iterate()),
>>>> and I'm unsure if I done that correctly. But it works, unlike TRIM. :)
>>>
>>> Cool. Thanks!!!
>>>
>>>
>>>> (FYI, iterate() differs from readdir() mostly in that it works with a 
>>>> copy of
>>>> f_pos instead of with f->f_pos directly.)
>>>
>>> AFAIK they fixed races in readdir() and friends.
>>> I'll take a look at this more carefully...
>>
>> Vfs people have introduced a new field (.for_sync) of  struct 
>> wb_writeback_work,
>> it should be initialized as 1 in reiser4_sync_fs().
> Ah, missed that.
>
>> The next comment is that all PF_FOO flags should be "independent". In 
>> particular,
>> "compound" values like 0x80000002 are unacceptable for PF_FLUSHER (is it 
>> clear,
>> why so?). I would recommend 0x00000001, or 0x00000002.
> That seems to be a typo... Of course, I know it's a bitmask :)
>
>> In other bits the patch looks OK.
>>
>> Thanks!
>> Edward.
> Thanks for the review! I'll fix the points and send an updated patch shortly.
>

Please forward to me as well if you don't mind?
Thanks!
Chris

