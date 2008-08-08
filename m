From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: [PATCH] new code cleanups
Date: Fri, 8 Aug 2008 11:04:59 -0400
Message-ID: <48f7fe350808080804w2512e855xbc0bb6fe27593839@mail.gmail.com>
References: <a08621850808050554s19fedabcn1810df53826c812e@mail.gmail.com>
	 <a08621850808060634n573bfd2bi189893416d938fb6@mail.gmail.com>
	 <a08621850808061057j123840aeie76eaa8ed85b1308@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=e4irBiQXoXKk5qzocX16PDLFztGTJWAPrVbi8xfWwM4=;
        b=Qf5/gnr/BgBm75rvt9O3nCY8zPhCj/VipdRF33+W2PIenCRVIfT1LTYh9ZqJWw+wvr
         EGwOdgsYgjwHgYzwpjMond8hGsIq/wh0asEHFbsg4a3waZy6sWIxTCy5w31/Je6LqG4F
         JgAjUD47xJ65X8xUB6WR36gNL+3OM4PACE5i4=
In-Reply-To: <a08621850808061057j123840aeie76eaa8ed85b1308@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

Where are the other 2 patches you mention here, I cant find them anywhere.
-Ryan

On Wed, Aug 6, 2008 at 1:57 PM, Dushan Tcholich <dusanc@gmail.com> wrote:
> Hi
> Have these mails passed to m-l? I can't see these mails in archives,
> but I haven't recieved the rejected mail notifications too.
> Mail me if you need patches sent some other way.
>
> Thanks
> Dushan
>
> On Wed, Aug 6, 2008 at 3:34 PM, Dushan Tcholich <dusanc@gmail.com> wrote:
>> Hello
>> I've made more cleanups ontop of the patch from yesterday.
>> This new patch removes around 1200 errors and 40 warnings reported by
>> checkpatch-0.21
>> Errors removed are: ERROR: "foo * bar" should be "foo *bar"
>> Warnings removed are from extra spaces around parenthesis.
>> Patch was compile tested against 2.6.27-rc1-mm1+newcodecleanups.patch
>>
>> I hope this helps
>>
>> Have a nice day
>> Dushan
>>
>> PS. patch is about 400kB so i had to compress it
>>
>> On Tue, Aug 5, 2008 at 2:54 PM, Dushan Tcholich <dusanc@gmail.com> wrote:
>>> Hello
>>>
>>> While running checkpatch on newest r4 in -mm kernels I noticed that I
>>> already did some cleanups that were reported.
>>> Then I realised that one patch that I sent that removed about
>>> 300errors and 500 warnings was misplaced in that patchstorm :) and not
>>> sent to akpm.
>>> Here it is again rebased on 2.6.27-rc1-mm1, compile tested.
>>> Please review
>>>
>>> Thanks for your time
>>> Dushan
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
