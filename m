From: michael chang <thenewme91@gmail.com>
Subject: Re: undelete
Date: Thu, 3 Nov 2005 16:12:36 -0500
Message-ID: <b14e81f00511031312q4e305606q1c498c0297c01eed@mail.gmail.com>
References: <871119507.20051103221858@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <871119507.20051103221858@pobox.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Drake <christopher@pobox.com>
Cc: Reiserfs-List@namesys.com

On 11/3/05, Chris Drake <christopher@pobox.com> wrote:
> Hi,
>
> The most important feature of Microsofts new server file-system
> announcement is the ability to easily "undelete":-
> http://www.microsoft.com/windowsserver2003/evaluation/overview/technologi=
es/storage.mspx
>
> Could this be incorporated into reiserfs ?  (including the recovery of
> overwritten files etc of course)

Disclaimer: I am not a Namesys staff member.

IIRC, putting this kind of thing in reiserfs (reiserfs v3) is probably
very unlikely, as it would require radical and very messy changes.

However, there is something of a discussion of sorts about a CVS- or
SVN-type plugin that may do something like this for Reiser4 - in
theory, it currently has the framework (plugin architecture) to
support this, although no one AFAIK has written and submitted code
recently for it.  (I believe someone expressed intrest in such an
idea, although I don't know if he has proceeded with it.)

That said, Reiser4 is experimental software, and shouldn't be used on
production systems, although when all is said and done (kernel
acceptance, as well as things like cryptocompress and file-as-dir [if
it comes back] and repacker, which are currently unavailable but
hopefully will be available soon) I believe Reiser4 will be a great
filesystem.

There are some recent messages in the archive (if you dare to sift
through it) that go over this sort of topic...

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
