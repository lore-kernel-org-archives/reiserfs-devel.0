From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: a hosed reiserfs
Date: Wed, 7 Jul 2004 11:55:34 +0200
Message-ID: <20040707115534.510b1246@philou.gramoulle.local>
References: <3DF9165145FACB4C96977FF650C1E9040C46A168@its-mail1.its.corp.gwl.com>
	<20040707055420.GI4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040707055420.GI4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello,

Feature wise, the lack of reiser4 quota support is definitely a showstopper=
 for us, and maybe for a lot of people too.
So currently i'm focusing on performance of Reiser4 with databases, mainly =
MySQL.

Thanks

Philippe

--
Lycos Europe


On Wed, 7 Jul 2004 08:54:20 +0300
mjt@nysv.org (Markus T=F6rnqvist) wrote:

  | Since feature-wise I don't see Reiser4 that lacking. Maybe the biggest =
issue
  | is of course viewports, but since that's coming by DARPA, there's stuff
  | like copy-on-capture and chdir to a non-executable file and syscalls.
  | But nothing mission critical or half-broken. Right?
