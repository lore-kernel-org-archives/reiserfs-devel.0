From: "=?iso-8859-1?Q?arthur.chereau?=" <arthur.chereau@voila.fr>
Subject: =?iso-8859-1?Q?Re:__Reiserfs/emacs_incompatibility/bug_=3F?=
Date: Mon, 30 Sep 2002 08:42:47 +0200
Message-ID: <H38NZB$69AAF5A88B45DCEF699FDF55EA5A8356@voila.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11563-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?utf-8?Q?reiserfs-list?= <reiserfs-list@namesys.com>

> Hello!
> 
> On Mon, Sep 30, 2002 at 08:34:20AM +0200, arthur.chereau wrote:
> > $ cat test
> > version 2
> > $ ls -i test*
> > 1505190 test 1505189 test~
> > $ emacs test
> > $ cat test
> > version 3
> > $ ls -i test*
> > 1505191 test 1505189 test~
> > The fact that it doesn't happen on ext2 makes me think it's related to Reiserfs.
> 
> What kernel versions have you tried (that show this behavior)?

It happens with 2.4.18 and 2.4.19.


------------------------------------------

Faites un voeu et puis Voila ! www.voila.fr 

