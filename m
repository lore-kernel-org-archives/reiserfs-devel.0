From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Permission denied !? - will i ever update my system again ? [Slightly OT]
Date: Thu, 18 Jul 2002 08:28:51 -0400
Message-ID: <200207180828.51415.kuba@mareimbrium.org>
References: <1026942850.826.13.camel@prototype> <200207181306.26325.vitaly@namesys.com> <20020718114053.5b1c56cd.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020718114053.5b1c56cd.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On czwartek 18 lipiec 2002 05:40 am, Philippe Gramoull=E9 wrote:
> On Thu, 18 Jul 2002 13:06:26 +0400
>
> Vitaly Fertman <vitaly@namesys.com> wrote:
>   |  > Hm. So you have duplicate oid issue most probably, reiserfsck
>   |  > --rebuild-tree will cure that. Be sure to update to latest
>   |  > reiserfsprogs
>   |
>   |  --fix-fixable will cure about that also.
>
> BTW, would there be a noticeable difference in term of time it takes
> between --fix-fixable and --rebuild-tree ?

Definitely so. --fix-fixable is much faster, rebuilding tree on 600gigs of =

storage can take from two hours up to a day, AFAIK, depending on your syste=
m=20
speed.

Cheers, Kuba Ober
