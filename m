From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting processes and process oriented permissions got funded
Date: Wed, 14 Apr 2004 08:10:28 -0700
Message-ID: <407D5464.4070501@namesys.com>
References: <20040414094426.GK14134@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17938-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040414094426.GK14134@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:

>Hans Reiser wrote:
>
> =20
>
>>I am still thinking through how we will implement views in Reiser4.
>>   =20
>>
>
>A question of grace, again, if you please.
>
>Does the current plugin architecture allow views to be implemented
>directly or will it affect the on-disk layout in a manner which
>requires mkfs?
>
>I'm fairly certain that it should not require mkfs, but as something
>of the local Reiser4 advocate I just want to make sure :)
>
>BTW, the READ.ME for 2004.04.26:
>d. readdir() over NFS has known problems.
>
>I think I may be something of a successful advocate; a friend is consideri=
ng
>Reiser4 for his RAIDed NFS file server, because it needs an overhaul.
>
>Although it's not a production system, I think his input on possible
>failures would be welcome and of course some stability (no need to mkfs
>a big-assed system) on the filesystem's part would be good to guarantee.
>
>So, basically, have you decided on when the next snapshot is due
>with NFS issues fixed? ;)
>
>Thanks!
>
> =20
>
nikita is the one to ask about NFS.

any infrastructure required by views will be handled by creating new=20
plugins, and won't require mkfs.  that is why we made the effort to=20
create new plugins.

--=20
Hans

