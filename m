From: Hans Reiser <reiser@namesys.com>
Subject: Re: [ANNOUNCE] new reiser4 snapshot released.
Date: Mon, 29 Mar 2004 08:19:56 -0800
Message-ID: <40684CAC.3030702@namesys.com>
References: <16484.24086.167505.94478@laputa.namesys.com> <1080321833.19218.7.camel@localhost.localdomain> <16484.29281.375363.39808@laputa.namesys.com> <40646424.7000407@namesys.com> <20040329050047.GB19805@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17573-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040329050047.GB19805@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Cyrille Chepelov wrote:

>Le Fri, Mar 26, 2004, =C3  09:11:00AM -0800, Hans Reiser a =E9crit:
>
> =20
>
>>Nikita, would you confirm that the default fibration is to sort all=20
>>files with '.' as the penultimate character by their last character=20
>>first and then by the rest of the name in the usual lexicographic order? =

>>(If that is not the default, then please make it the default.)
>>   =20
>>
>
>Wouldn't it be slightly beneficial to expand this policy to not just
>look for extensions matching .*\.(?) but .*\.(.*) as well?
>
>	-- Cyrille, needing some time to dive back into reiser4 testing
>
> =20
>
I thought about that, but other than compiles I don't know of an=20
application that would benefit from this performance wise, and compiles=20
usually have . as the penultimate character in their fileset filenames. =20
I would actually much like to get feedback from others on this.

--=20
Hans


