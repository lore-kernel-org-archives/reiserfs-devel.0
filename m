From: Yury Umanets <yury@clusterfs.com>
Subject: Re: Reiser4 support on parted program ...
Date: Wed, 15 Sep 2004 16:31:53 +0300
Message-ID: <41484449.8060301@clusterfs.com>
References: <41472F46.4000109@futuretg.com> <41477625.304@slaphack.com> <4147E95B.8090108@futuretg.com> <20040915094952.GA5137@backtop.namesys.com> <414840FC.4090505@clusterfs.com> <20040915132013.GG26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915132013.GG26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Alex Zarochentsev <zam@namesys.com>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>On Wed, Sep 15, 2004 at 04:17:48PM +0300, Yury Umanets wrote:
> =20
>
>>Alex is right in both. To add such a support one should write resizing=20
>>stuff in libreiser4 first. Then write glue code in parted. IMHO both are =

>>not so difficult. Probably Vitaly or Alex self could do that in week=20
>>(may be few days).
>>   =20
>>
>
>How long for Dr. Orlando and his crew in cooperation with Namesys?-)
> =20
>
Have no idea :) I do not know anything about Dr. Orlando and his crew.
Suff itself is not difficult, as there is not tree modifications, etc.

Rough sequence is like this:

(1) make sure, that there is no not replied transactions.

(2) tree traverse and move all nodes and unformatted blocks which do not=20
fit to new range (new_start - new_end) one by one to new area. Block=20
allocator info should be updated on this stage too.

(3) update some fields in super block. Probably one more update of block=20
allocator.

The framework for all these actions exists in libreiser4.

Parted's part is trivial -- just follow the API.

> =20
>
>>The only problem Hans seems does not want such a support or does not=20
>>count it as somethinf serious attention should be paid to :(
>>   =20
>>
>
>I think his followers would disagree ;)
>
> =20
>


--=20
umka

