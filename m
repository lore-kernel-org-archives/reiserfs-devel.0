From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 11:59:23 +0200
Message-ID: <200407231159.23162.christian.mayrhuber@gmx.net>
References: <40FE0B47.3010600@slaphack.com> <40FF3DAD.6020100@slaphack.com> <200407221410.25043.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407221410.25043.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 22 July 2004 12:10, Vitaly Fertman wrote:
> > First question:  Can I manually enable/disable a particular plugin for a
> > particular directory?  (like how cryptocompress is supposed to be...)
>
> you can change a plugin for a file if it does not destroy its structure.
> Thus for an empty directory you can :
> 	# cat somedir/metas/plugin/hash ; echo
> 	1 r5 r5 hash
> 	# echo -e "tea\0" > somedir/metas/plugin/hash

So if one does 
# echo -e "tea" > somedir/metas/plugin/hash
it can crash reiser4, because of a non terminated C string?

It would be a good idea if the meta filesystem interface always auto 
terminates strings (add + '\0') issued by echo. procfs does it that way.

-- 
lg, Chris

