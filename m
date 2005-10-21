From: James Rayner <iphitus@gmail.com>
Subject: Re: Reiser4 + laptop -> ouch
Date: Fri, 21 Oct 2005 21:38:53 +1000
Message-ID: <1e1a7e1b0510210438s57beb1b8ra6d359610704d72a@mail.gmail.com>
References: <43537D56.3020208@eastwind.ru> <op.sysz7pxnth1vuj@localhost>
	 <200510182209.19370.zam@namesys.com> <op.syxzvsesth1vuj@localhost>
	 <b14e81f00510201300k74c3d428rfac2dbb2969e3e3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00510201300k74c3d428rfac2dbb2969e3e3d@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>, reiserfs-list@namesys.com

On 10/21/05, michael chang <thenewme91@gmail.com> wrote:
>
> Try a 2.6.12 or 2.6.13 kernel, without swsusp2 patches included (since
> they don't work anyways, you shouldn't run a kernel with them in case
> they do funky things).  Maybe a recent -mm kernel?
>

Suspend2 has been improved substantially, and works for most people,
if they put a few minutes of their time into setting it up properly.
It has been cleaned up substantially and wont do 'funky things' like
you suggest.

An -mm kernel is more likely to do funky things, then a well patched
suspend2 + reiser4. Try archck, http://iphitus.loudas.com/archck.php

James
--
iphitus - archck maintainer
Home:iphitus.loudas.com Blog: iphitus.blogspot.com
