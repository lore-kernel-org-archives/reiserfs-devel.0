From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 13:09:55 +0400
Message-ID: <200407231309.55295.vitaly@namesys.com>
References: <40FE0B47.3010600@slaphack.com> <200407221410.25043.vitaly@namesys.com> <41007B56.2030103@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41007B56.2030103@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Markus =?utf-8?q?T=C3=B6rnqvist?= <mjt@nysv.org>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

> wait -- what does this do:
> echo -e "tea\0" > somedir/metas/plugin/hash

will set the hash tea in 'somedir' if it is empty.
if it has 'subdir' already, nothing happens.

> echo -e "something_differenet\0" > somedir/subdir/metas/plugins/hash

will set the hash 'something_differenet' if any of [r5 | tea | fnv1 | 
rupasov | degenerate hash | all future hash plugins] in 'somedir/subdir' 
if 'subdir' is empty.

> echo -e "r5\0" > somedir/metas/plugins/hash

nothing happens as 'subdir' exists.

> What is the hash of "subdir" now?

'somthing_different'

> What about new subdirs?  What hash will they get?

new subobjects inherit all plugins from the object they are created 
in at the creation time. future changes of plugins of the object will 
not be applied to already created subobjects, only to new subobjects.

Note: if a plugin is used for rendering the object content then its 
changing needs a convertion method. Thus if you create a file in 
the dir then the hash plugin gets used, and you need to convert the 
dir to change the hash successfully. As there is no such convertion 
methods yet, you cannot change the hash of not empty dir.

-- 
Thanks,
Vitaly Fertman

