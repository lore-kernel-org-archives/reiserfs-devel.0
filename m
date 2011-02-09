From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 09 Feb 2011 01:10:34 +0100
Message-ID: <4D51DB7A.4000408@gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>	<4D51C558.8050001@gmail.com> <AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=p8zo89b/IFofLzK9UPqDsjyqKwV0KJ87Pu7T+X1SmvU=;
        b=epmxcS3B8QIlIukok8MUsqdkulDelgydY28jMyzyxO5lsXFCR+MW/916GUvz2lseKC
         2oeGQ269Legu/rcUG7GWIATgJpYuxaRLKYazKxU7GLI80UlU4K7/Ou8sXaPa5qrnsHwC
         gDIzM3ZDNBG5CvjhCBqsEeWoWACBxZpaFsFkY=
In-Reply-To: <AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 02/09/2011 12:56 AM, Marcin Baczy=C5=84ski wrote:
> W dniu 8 lutego 2011 23:36 u=C5=BCytkownik Edward Shishkin
> <edward.shishkin@gmail.com>  napisa=C5=82:
>> Marcin Baczy=C5=84ski wrote:
>>>
>>> Hi,
>>>
>>
>> Hello.
>>
>>> I'm attaching a trace of kernel BUG that Firefox hits. It's 100%
>>> reproducible,
>>> every time I start the browser it hits the bug within several secon=
ds,
>>> then
>>> whole system hangs. However I've never triggered the problem with a=
ny
>>> other
>>> application.
>>> I've tested 2.6.37-gentoo-hardened + reiser4 patch,
>>
>> "2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or .37=
)?
> It's based on .37.
>
>>


  [<ffffffff81142782>] ? grabbed2flush_reserved_nolock+0x42/0xa0
  [<ffffffff81144c54>] ? jnode_make_dirty_locked+0xe4/0x190
  [<ffffffff81144d31>] ? znode_make_dirty+0x31/0xe0
  [<ffffffff81166a69>] ? find_disk_cluster+0x359/0x390
  [<ffffffff8117511c>] ? do_readpage_ctail+0xdc/0x570
  [<ffffffff81166f7d>] ? prepare_logical_cluster+0x23d/0x760

A set of blocks reserved in prepare_logical_cluster() is exhausted
at znode_make_dirty() for some reasons. No ideas except inserting
debugging messages to figure out who is stealing the reservation.
Will try to reproduce on weekends..

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
