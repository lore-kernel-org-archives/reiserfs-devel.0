From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: Reiser4 support on parted program ...
Date: Wed, 15 Sep 2004 17:34:39 +0200
Message-ID: <4148610F.5020508@futuretg.com>
References: <41472F46.4000109@futuretg.com> <41477625.304@slaphack.com> <4147E95B.8090108@futuretg.com> <20040915094952.GA5137@backtop.namesys.com> <414840FC.4090505@clusterfs.com> <20040915132013.GG26192@nysv.org> <41484449.8060301@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41484449.8060301@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Yury Umanets <yury@clusterfs.com>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, Alex Zarochentsev <zam@namesys.com>, David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

Yury Umanets wrote:

> Markus T=F6rnqvist wrote:
>
>> On Wed, Sep 15, 2004 at 04:17:48PM +0300, Yury Umanets wrote:
>> =20
>>
>>> Alex is right in both. To add such a support one should write=20
>>> resizing stuff in libreiser4 first. Then write glue code in parted.=20
>>> IMHO both are not so difficult. Probably Vitaly or Alex self could=20
>>> do that in week (may be few days).
>>>  =20
>>
>>
>> How long for Dr. Orlando and his crew in cooperation with Namesys?-)
>> =20
>>
Hi,

    FTOSX adopt ReiserFS four years ago, before ReiserFS enter in the=20
Kernel.

    All three and next editions of FTOSX, had been made by me, like examples
    of the Personal Operating System.

    I will dedicate to solve the parted problem on the weekend, because=20
I am busy
    with other tasks actually.

    As soon the installer works fine supporting Reiser4, including=20
parted support
    it, I will comment in this mailing list, and offer for free donwload.

Thanks,
Giovanni

> Have no idea :) I do not know anything about Dr. Orlando and his crew.
> Suff itself is not difficult, as there is not tree modifications, etc.
>
> Rough sequence is like this:
>
> (1) make sure, that there is no not replied transactions.
>
> (2) tree traverse and move all nodes and unformatted blocks which do=20
> not fit to new range (new_start - new_end) one by one to new area.=20
> Block allocator info should be updated on this stage too.
>
> (3) update some fields in super block. Probably one more update of=20
> block allocator.
>
> The framework for all these actions exists in libreiser4.
>
> Parted's part is trivial -- just follow the API.
>
>> =20
>>
>>> The only problem Hans seems does not want such a support or does not=20
>>> count it as somethinf serious attention should be paid to :(
>>>  =20
>>
>>
>> I think his followers would disagree ;)
>>
>> =20
>>
>
>


--=20

--=20

--
Check FT Websites ...=20
http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
	http://www.FTLinuxCourse.com/Certification
http://www.rpmparadaise.org
http://GNULinuxUtilities.com
http://www.YourPersonalOperatingSystem.com

--

