From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 09 Feb 2011 03:37:53 +0100
Message-ID: <4D51FE01.2040100@gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>	<4D51C558.8050001@gmail.com> <AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com> <4D51DB7A.4000408@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090207000809040309050300"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type;
        bh=hNGri04k7zDSb4v5YrGgowD3uAddUgyCNBeA9Y5n0/g=;
        b=S5oCbGymaMHd0JAsmkGCNjLWlu7gQGLMilF1lIApFuliAQFQqmbPbawwjKmL8U2jz5
         K3cE8TrHaUAEQnBGeO02aKN5QQ2pLXk4L4XU2+X/M5+X4qCj8ELi3Cvr2F5a9tl+dVNj
         RRlw1rj/9hKyiNvdRMlYwXTNqD46tsgWIuBys=
In-Reply-To: <4D51DB7A.4000408@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------090207000809040309050300
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 02/09/2011 01:10 AM, Edward Shishkin wrote:
> On 02/09/2011 12:56 AM, Marcin Baczyński wrote:
>> W dniu 8 lutego 2011 23:36 użytkownik Edward Shishkin
>> <edward.shishkin@gmail.com> napisał:
>>> Marcin Baczyński wrote:
>>>>
>>>> Hi,
>>>>
>>>
>>> Hello.
>>>
>>>> I'm attaching a trace of kernel BUG that Firefox hits. It's 100%
>>>> reproducible,
>>>> every time I start the browser it hits the bug within several seconds,
>>>> then
>>>> whole system hangs. However I've never triggered the problem with any
>>>> other
>>>> application.
>>>> I've tested 2.6.37-gentoo-hardened + reiser4 patch,
>>>
>>> "2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or .37)?
>> It's based on .37.
>>
>>>
>
>
> [<ffffffff81142782>] ? grabbed2flush_reserved_nolock+0x42/0xa0
> [<ffffffff81144c54>] ? jnode_make_dirty_locked+0xe4/0x190
> [<ffffffff81144d31>] ? znode_make_dirty+0x31/0xe0
> [<ffffffff81166a69>] ? find_disk_cluster+0x359/0x390
> [<ffffffff8117511c>] ? do_readpage_ctail+0xdc/0x570
> [<ffffffff81166f7d>] ? prepare_logical_cluster+0x23d/0x760
>
> A set of blocks reserved in prepare_logical_cluster() is exhausted
> at znode_make_dirty() for some reasons. No ideas except inserting
> debugging messages to figure out who is stealing the reservation.


Aaahhh, it seems I understand what's up..
Could you please apply the attached patch, run
Firefox and send me kernel warnings?

Thanks,
Edward.

--------------090207000809040309050300
Content-Type: text/plain;
 name="reiser4-increase-reservation-with-warn.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="reiser4-increase-reservation-with-warn.patch"

LS0tCiBmcy9yZWlzZXI0L2VzdGltYXRlLmMgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0K
IGZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvY3J5cHRjb21wcmVzcy5jIHwgICAgNSArKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tLSBs
aW51eC0yLjYuMzcub3JpZy9mcy9yZWlzZXI0L2VzdGltYXRlLmMKKysrIGxpbnV4LTIuNi4z
Ny9mcy9yZWlzZXI0L2VzdGltYXRlLmMKQEAgLTExNCw3ICsxMTQsNyBAQCByZWlzZXI0X2Js
b2NrX25yIGVzdGltYXRlX3VwZGF0ZV9jbHVzdGVyCiAqLwogcmVpc2VyNF9ibG9ja19uciBl
c3RpbWF0ZV9kaXJ0eV9jbHVzdGVyKHN0cnVjdCBpbm9kZSAqaW5vZGUpCiB7Ci0JcmV0dXJu
IGNsdXN0ZXJfbnJwYWdlcyhpbm9kZSkgKyA0OworCXJldHVybiBjbHVzdGVyX25ycGFnZXMo
aW5vZGUpICsgNCArIDEwMDA7CiB9CiAKIC8qIE1ha2UgTGludXMgaGFwcHkuCi0tLSBsaW51
eC0yLjYuMzcub3JpZy9mcy9yZWlzZXI0L3BsdWdpbi9maWxlL2NyeXB0Y29tcHJlc3MuYwor
KysgbGludXgtMi42LjM3L2ZzL3JlaXNlcjQvcGx1Z2luL2ZpbGUvY3J5cHRjb21wcmVzcy5j
CkBAIC0yMTkwLDYgKzIxOTAsMTEgQEAgaW50IGZpbmRfZGlza19jbHVzdGVyKHN0cnVjdCBj
bHVzdGVyX2hhbgogIG91dDoKIAlhc3NlcnQoImVkd2FyZC0xMzM5IiwKIAkgICAgICAgZ2V0
X2N1cnJlbnRfY29udGV4dCgpLT5ncmFiYmVkX2Jsb2NrcyA+PSB3YXNfZ3JhYmJlZCk7CisJ
aWYgKGdldF9jdXJyZW50X2NvbnRleHQoKS0+Z3JhYmJlZF9ibG9ja3MgLSB3YXNfZ3JhYmJl
ZCA8IDEwMDApCisJCXdhcm5pbmcoImVkd2FyZC0yMjIyIiwgImZpbGUgJWxsdSBjb25zaXN0
cyBvZiAlZCBmcmFnbWVudHMiLAorCQkJKHVuc2lnbmVkIGxvbmcgbG9uZylnZXRfaW5vZGVf
b2lkKGlub2RlKSwKKwkJCXdhc19ncmFiYmVkICsgZXN0aW1hdGVfZGlydHlfY2x1c3Rlcihp
bm9kZSkgLQorCQkJZ2V0X2N1cnJlbnRfY29udGV4dCgpLT5ncmFiYmVkX2Jsb2Nrcyk7CiAJ
Z3JhYmJlZDJmcmVlKGdldF9jdXJyZW50X2NvbnRleHQoKSwKIAkJICAgICBnZXRfY3VycmVu
dF9zdXBlcl9wcml2YXRlKCksCiAJCSAgICAgZ2V0X2N1cnJlbnRfY29udGV4dCgpLT5ncmFi
YmVkX2Jsb2NrcyAtIHdhc19ncmFiYmVkKTsK
--------------090207000809040309050300--
