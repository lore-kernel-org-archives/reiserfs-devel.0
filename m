From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Fibration questions
Date: Thu, 22 Jul 2004 14:10:25 +0400
Message-ID: <200407221410.25043.vitaly@namesys.com>
References: <40FE0B47.3010600@slaphack.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FF3DAD.6020100@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>, Markus =?utf-8?q?T=C3=B6rnqvist?= <mjt@nysv.org>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

> First question:  Can I manually enable/disable a particular plugin for a
> particular directory?  (like how cryptocompress is supposed to be...)

you can change a plugin for a file if it does not destroy its structure. 
Thus for an empty directory you can :
	# cat somedir/metas/plugin/hash ; echo
	1 r5 r5 hash
	# echo -e "tea\0" > somedir/metas/plugin/hash
	# cat somedir/metas/plugin/hash ; echo
	2 tea tea hash

> Second question:  Would such a setting be recursive?  Can I tell it
> whether to recurse or not?

plugins are inherited at the creation time from the parent of the object 
being created. Thus in the above example all subdirs would have the
hash r5 before changing the 'somedir' hash to 'tea' and will have the
'tea' hash after.

-- 
Thanks,
Vitaly Fertman

