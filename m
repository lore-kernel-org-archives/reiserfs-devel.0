From: Oleg Drokin <green@namesys.com>
Subject: Re: Hard disk crash and solution
Date: Thu, 23 Jan 2003 09:52:01 +0300
Message-ID: <20030123095201.A12043@namesys.com>
References: <IKENJBHCILNPNAGHKCHFOEDMCCAA.Art@chello.nl> <3E2F13BE.8040407@namesys.com> <20030123074357.A2442@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12461-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030123074357.A2442@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Hans Reiser <reiser@namesys.com>, Niek <Art@chello.nl>, reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>, mason <mason@namesys.com>

Hello!

On Thu, Jan 23, 2003 at 07:43:57AM +0100, Ookhoi wrote:
> > I think we should have fsck ask the user to check and see if they are
> > using the latest fsck.
> > "You really want to be using the very latest stable version of fsck
> > when you run it.  Please go to www.namesys.com, click on the download
> > button, and see if you have the latest version before you continue."
> If XFree86 crashes, it says something like, 
> "This is release foo, date bar. If it is more than six months old, or if
> your video card is newer than this release, please see if a newer
> release fixes it before you report a bug"

I think it does already. Along with suggesting on where to send bugreports
if this is the latest release.

> Maybe fsck should say the same. It could very well be that you don't
> have access to the internet when you have to perform a fsck :-)  And
> then you still would like to know how old your tools are. If you release
> new tools at least every two months, you can say two months. You can
> also point to the -pre releases (with the usual warning).

main.c:  ** If you are using the latest reiserfsprogs and  it fails **\n\
main.c-  ** please  email bug reports to reiserfs-list@namesys.com, **\n\
main.c-  ** providing  as  much  information  as  possible --  your **\n\

Though this warning is printed at the beginning.

Bye,
    Oleg
