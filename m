From: Hans Reiser <reiser@namesys.com>
Subject: Re: Debian, ACLs and 2.6.8 Linux kernel?
Date: Mon, 01 Aug 2005 12:14:42 -0700
Message-ID: <42EE74A2.4050904@namesys.com>
References: <42EDE8CB.8050300@vandervlis.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42EDE8CB.8050300@vandervlis.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul van der Vlis <paul@vandervlis.nl>
Cc: reiserfs-list@namesys.com

Paul van der Vlis wrote:

> Hello,
>
> I am wondering why Debian's 2.6.8-2 kernel does not have ACL support
> for Reiserfs. Are there any known issues?  (Debian has ACLs for all
> other filesystems, but not for Reiserfs.)
>
> I am also wondering why the default in Debian is to use "notail" as a
> boot-option. Is it a problem to remove this boot-option later?

Notail has better performance in V3, for the same reason fragments hurts
BSD FFS performance.  V4 fixes this.  I have mixed feelings as to
whether I would advise using notail as a default for V3.  Probably yes. 
It is reasonable of them to do so.

>
> With regards,
> Paul van der Vlis
> Groningen, Netherlands.
>
>
>

