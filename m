From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 14:48:28 +0400
Message-ID: <15749.46844.233761.653142@laputa.namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020916102742.6538D2926@hofmann.snowcra.sh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Vilain <sam@vilain.net>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Sam Vilain writes:
 > How can I reserve space on a filesystem for the superuser?  There
 > doesn't seem to be an option to mkreiserfs or reiserfstune for it.

I am afraid, there is no support for this, currently. But implementation
should be fairly trivial, through.

 > 
 > Is this essential UNIX filesystem feature implemented?

Well, nobody asked for it yet. :)

 > --

Nikita.

 >    Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
