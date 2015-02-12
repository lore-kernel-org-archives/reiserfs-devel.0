From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Thu, 12 Feb 2015 09:14:57 +0300
Message-ID: <3C7880EC-12E3-4621-A3BE-353EFA032293@gmail.com>
References: <5495DB0D.1080005@gmail.com> <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com> <1423649354.10127.16.camel@gmail.com> <54DBE880.4070902@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:mime-version:in-reply-to:content-type
         :content-transfer-encoding:message-id:cc:from:subject:date:to;
        bh=UHQmDbXJVkcTKTvi1rWly/2Wu1bMTdK9nG05nXoBtng=;
        b=qfgRbgR62jsxaVOLuAXf+AHVcVSyLZfrY7NYRyZ+gbNBWgh/AEXYanc7YMiLQPIN6Y
         DtR6/eeUd65m94frDB3MU648If+V2uOwuTTvJFinOAKkjUP1t63JbLa1zPvMywLKruyS
         vyBiGO+kTOvqbjqmi0iNwPNFOtFDKJBYiopzMe7EVGhCpM8vxa2vTn7lcG+0LdtuECBL
         9zhkLisk1fOiLuohRhuNHWWLLticK0MrI3L8o/YH/yX6bfx1ONrZZbdKvawjOSGL4FLS
         a0CgLBQAdogkwoqu3Y70y8WArMPCWZnpIFZJmXXB1YVzJQpRE8HZncdpfiVeynIWpSrh
         irFw==
In-Reply-To: <54DBE880.4070902@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

> 12 =C6=C5=D7=D2. 2015 =C7., =D7 2:40, Edward Shishkin <edward.shishki=
n@gmail.com> =CE=C1=D0=C9=D3=C1=CC(=C1):
>=20
>=20
>> On 02/11/2015 11:09 AM, Ivan Shapovalov wrote:
>>> On 2015-02-11 at 09:23 +0100, Edward Shishkin wrote:
>>>> On 02/10/2015 09:42 PM, Ivan Shapovalov wrote:
>>>>> On 2014-12-20 at 21:24 +0100, Edward Shishkin wrote:
>>>>> This is the promised generalization, which is supposed to work fo=
r all
>>>>> discard
>>>>> offsets and all discard unit sizes without any restrictions.
>>>>>=20
>>>>> Complications in comparison with the previous implementation:
>>>>>=20
>>>>> In this general case we need "precise" coordinates, where every
>>>>> individual byte
>>>>> can be addressed. All local variables, which represent precise
>>>>> coordinates are
>>>>> denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local varia=
bles,
>>>>> which represent
>>>>> "non-precise" coordinates (they are usually of type reiser4_block=
_nr)
>>>>> are denoted
>>>>> without prefixes (start, len, end, tailp, etc).
>>>>>=20
>>>>> Blocks, which contain head and tail paddings are now calculated u=
sing the
>>>>> function size_in_blocks(), which actually is an expression for th=
e
>>>>> minimal number
>>>>> of blocks containing the precise extent.
>>>>>=20
>>>>> The next trouble is "peculiarity in 0", encountered when calculat=
ing the
>>>>> blocks of
>>>>> head padding. if discard offset is different from 0, then the fir=
st
>>>>> discard unit of the
>>>>> partition is partial (its other part doesn't belong to our partit=
ion, so
>>>>> we can not
>>>>> discard it). We handle this peculiarity by an additional check.
>>>>>=20
>>>>> In other bits everything is the same.
>>>>>=20
>>>>> Possible optimization: If discard unit sizes are always powers of=
 2,
>>>>> then it makes
>>>>> sense to replace "do_div(offset, unit_size)" with "offset & (unit=
_size -
>>>>> 1)".
>>>>>=20
>>>>> Mount options discard.offset=3Dxxx,discard.unit=3Dyyy are to emul=
ate various
>>>>> discard unit sizes and offsets on devices _without_ trim support =
(e.g.
>>>>> HDDs).
>>>>> This is only for debugging purposes, don't use it for real SSD de=
vices:
>>>>> the kernel
>>>>> retrieves the discard parameters on its own.
>>>>>=20
>>>>> This patch is against the patch series of Ivan Shapovalov:
>>>>> http://marc.info/?l=3Dreiserfs-devel&m=3D141841865432082&w=3D2
>>>>>=20
>>>>> Current status: not well-tested.
>>>>>=20
>>>>> Edward.
>>>> Hi,
>>>>=20
>>>> I've found a bug in our implementation (don't know when it appeare=
d,
>>>> maybe it was quite some time ago). I've intended to fix it and sen=
d
>>>> a patch along with description, but I still can't think of a viabl=
e fix.
>>>>=20
>>>> So: the problem is that check_free_blocks() isn't idempotent, beca=
use it
>>>> allocates blocks if the whole extent is clean. Therefore, it must =
not be
>>>> called for overlapping ranges. However, in some conditions tail pa=
dding
>>>> of some extent and head padding of next extent may overlap in term=
s of
>>>> disk blocks (gluing code only catches overlapping erase units).
>>>>=20
>>>> This will yield a false negative when checking the head padding, s=
o it
>>>> does not lead to any data losses (just to inefficiency).
>>>=20
>>> You mean that sometimes we perform unneeded checks?
>>> I see nothing criminal, as we don't exceed announced (2N_e)
>>> number of checks, where N_e is number of extents in the
>>> discard set.
>> No, I didn't talk about that.
>>=20
>>> As to fixup: I think that we need to set up the local variable
>>> head_is_known_dirty properly..
>> Hmm, head_is_known_dirty is an optimization: either known dirty
>> (in which case we skip checking and cut the head), or unknown
>> (in which case we do the check).
>>=20
>> I'm talking about a different scenario:
>> - tail padding of an extent is clean
>> - head padding of the next extent is clean
>> - these two paddings overlap in terms of disk blocks
>>=20
>> In this case, the head padding check will yield false ("dirty") beca=
use
>> part of it has been already allocated for the tail padding, but in f=
act
>> it is clean. Thus a false negative: the head will be cut while it ca=
n be
>> padded.
>=20
>=20
> Ah, you suspect non-preciseness (leak of "garbage")?
>=20
> If tail padding of the current extent overlaps with the head padding =
of
> the next extent, then the end of the current extent and the beginning
> of the next extent are in the same erase unit. Otherwise we'll end wi=
th
> contradiction. Correct?

Correct, but I'm talking about a different situation where the end of t=
he current extent and the beginning of the next extent are in distinct =
erase units but in the same disk block. Then we'll end up checking that=
 disk block twice.=20

Suppose it is "clean", i. e. we ideally should pad both extents. Now no=
te that our check_free_blocks() is not actually "check" but rather "try=
-allocate". So, first time we check it for the tail padding, the check =
succeeds, we pad the tail _and allocate that disk block_. The second ti=
me we check it (for the next extent's head padding) we get a false-nega=
tive.

--
Ivan Shapovalov / intelfx /

(Sent from a phone. Havoc may be wreaked on the formatting.)--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
