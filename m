From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Fibration questions
Date: Mon, 26 Jul 2004 14:11:56 +0400
Message-ID: <200407261411.56569.vitaly@namesys.com>
References: <40FE0B47.3010600@slaphack.com> <200407231309.55295.vitaly@namesys.com> <4104A488.2060103@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4104A488.2060103@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Markus =?utf-8?q?T=C3=B6rnqvist?= <mjt@nysv.org>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Monday 26 July 2004 10:28, Hans Reiser wrote:
> Vitaly Fertman wrote:
> >>wait -- what does this do:
> >>echo -e "tea\0" > somedir/metas/plugin/hash
> >
> >will set the hash tea in 'somedir' if it is empty.
> >if it has 'subdir' already, nothing happens.
> >
> >>echo -e "something_differenet\0" > somedir/subdir/metas/plugins/hash
> >
> >will set the hash 'something_differenet' if any of [r5 | tea | fnv1 |
> >rupasov | degenerate hash | all future hash plugins] in 'somedir/subdir'
> >if 'subdir' is empty.
>
> is something_different constrained to
>
>  [r5 | tea | fnv1 | rupasov | degenerate hash | some future hash plugin
> existing at time of command]
>
> ?

yes, right.

-- 
Thanks,
Vitaly Fertman

