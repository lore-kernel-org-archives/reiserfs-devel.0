From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pending is pending
Date: 05 Aug 2002 20:03:02 -0400
Message-ID: <1028592182.1759.300.camel@tiny>
References: <3D4F0A0A.4050603@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D4F0A0A.4050603@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Mon, 2002-08-05 at 19:28, Manuel Krause wrote:
> Hey ReiserFS-team,
> 
> come on, fill
>     ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending
> with life/patches, please!
> 
> I can't calm down and get back to my rock-solid patience until the hold 
> back patches come out... ;-)

Step one was getting the commit_super patch into the kernel, I sent that
this morning.  All of the data logging stuff depends on it, and we
wanted to get the major changes in first.

-chris


