From: Matt Stegman <matts@ksu.edu>
Subject: Re: Using fs views to isolate untrusted processes: I need an assistant
 architect in the USA for Phase I of a DARPA funded linux kernel project
Date: Mon, 2 Aug 2004 23:30:27 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0408022312330.11129-100000@unix2.cc.ksu.edu>
References: <873c35nl2l.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <873c35nl2l.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

It sounds closer to trustees than ACLs - permissions applied higher in the
tree apply to lower objects by default, unless inheritance is explicitly
denied.  Except this is done per process, not per user/group.  Presumably,
other processes would not be able to see what a process' view is).

Now, I'd love to see trustees implemented in reiser4 (warning: moving
off-topic now).  Are any plans in the works to implement POSIX ACLs or
other permission schemes more flexible than your regular UNIX permissions?
I've used trustees with Netware, and I believe they're quite superior to
ACLs.  I remember Hans' rant against EAs (aka xattrs) but I don't think he
ever said he hated ACLs as well.  And with the metas/plugin/permission
file it looks like some groundwork exists for ACLs/trustees/whatever.

-- 
Matt Stegman


On Mon, 2 Aug 2004, Hubert Chan wrote:

> >>>>> "David" == David Greaves <david@dgreaves.com> writes:
>
> David> It sounds like running exe's setgid (or addgid?) and then having acls.
> David> But then the acls are not tied to the file objects, more appended
> David> to the file acl list by 'pattern' according to the exe.
>
> Possibly.  But, from my understanding of views, apache would not even
> be able to see that /etc/passwd exists -- it is not just limited to not
> being able to read it.  I don't think you can do that with acls, and
> still allow apache to see some entries in /etc.
>
> It also seems much easier to administer, since the permissions are tied
> to the executable, rather than being tied to the file object.  (Say I
> want to see what files apache can read as part of a security audit --
> with acls, I would have to do a search over the whole filesystem.)


