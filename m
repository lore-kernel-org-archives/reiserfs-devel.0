From: Hans Reiser <reiser@namesys.com>
Subject: Re: "Metas"
Date: Wed, 21 Apr 2004 10:00:26 -0700
Message-ID: <4086A8AA.9020904@namesys.com>
References: <35813986328-BeMail@cr593174-a> <407C1A80.2090207@namesys.com> <4086A487.7050500@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4086A487.7050500@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

So you want some sort of ....this_name_will_never_collide_with_anything 
that is a synonym for metas, so that metas can be renamed?

I don't think programmers will bother to code for it in their apps.  
Otherwise it would be okay with me.

Hans

John D. Heintz wrote:

> How would we look up the current name of the "metas" pseudo directory? 
> This affects tools (GUI, scripts) that would need to reliably find the 
> "metas" pseudo directory regardless of renames.
>
> If there is a good answer to this question I think I would be 
> absolutely happy.
>
> Thanks,
> John D. Heintz
>
>
> >> -----Original Message-----
> >> From: Hans Reiser [mailto:reiser@namesys.com]
> >> Sent: Wednesday, April 21, 2004 10:18 AM
> >> To: reiserfs-list@namesys.com
> >> Subject: Re: "Metas"
> >>
> >> so if rename works on metas, are you guys happy?  that is, if mv
> >> filename/metas filename/... works, are you less worried about the one
>
> in
>
> >> 10 million users who will actually hit the reserved keyword?
>
>
>

