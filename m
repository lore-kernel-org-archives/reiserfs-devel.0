From: Matt Stegman <matts@ksu.edu>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 12:44:25 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0508141229330.23379-100000@unix2.cc.ksu.edu>
References: <42FF4A1C.9030406@perkel.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FF4A1C.9030406@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Perkel <marc@perkel.com>
Cc: reiserfs-list@namesys.com

On Sun, 14 Aug 2005, Marc Perkel wrote:
>
> My background is in Netware. Netware did it right. It's permissions that
> it had 15 years ago were beyond what Linux might ever acheive. Then I
> downgraded to Windows, then I further downgraded to Linux. In fact when
> I started using linux it took me months of denial before I realized -
> this really is all there is. One user, one group - and that's all.
> Further - the ability of a user to delete files that they have no
> read/write rights to is just plain silly. In Netware if you have no
> right to a file, you not only can't delete it - you can't even list it
> in the directory. It's as if that file isn't even there.

A minor nitpick: if you wish to delete a file, you need write permission
on the directory - the permission on the file doesn't really matter
(unless the sticky bit set is set on the directory, in which case you have
to own the file to delete it...).

> ACLs finally restored some of this power although the implementation in
> Linux is crude at best. I thought there is a glimmer of hope that some
> day Linux will catch up to where Novell was 15 years ago. It is so
> frustrating dealing with Linux culture and VI mentality trying to get
> people to think outside the box.

Marc, I agree with you.  You might be interested in the Linux Trustees
project:

http://trustees.sourceforge.net/

Still not not the match of NetWare's flexibility, but it's a step in the
right direction.  If it patches correctly into a -mm kernel, I think it
should even work on top of reiser4.  Additionally, Novell has released
Open Enterprise Server, which supposedly supports creation of NSS volumes
on Linux (SUSE Linux Enterprise Server 9), supporting trustees!

-- 
Matt Stegman



