From: Tierra <etierra@gmail.com>
Subject: Re: reiser4 for windows
Date: Sun, 5 Dec 2004 21:17:45 -0700
Message-ID: <c7ef32a7041205201729feacb5@mail.gmail.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com>
	 <1102300289.19084.7.camel@titania.zlynx.org>
Reply-To: Tierra <etierra@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1102300289.19084.7.camel@titania.zlynx.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: reiserfs-list@namesys.com

On Sun, 05 Dec 2004 19:31:29 -0700, Jonathan Briggs <jbriggs@esoft.com> wrote:
> There are ext2/3 and reiserfs access programs for Windows.  They are not
> implemented as Windows filesystem drivers.  I do not know if this is
> because of technical difficulties or Windows vs. GPL licensing problems.
> 
> Most of them bring up the filesystem in a Windows Explorerish interface.
> You can then copy files in or out.

You mean much like rfstool?
http://www.p-nand-q.com/download/rfstool.html

I've seen other reiserfs GUI tools, all pretty much are a wrapper
around the above library (including my own). But I've never seen
anything with write access, just read-only. Also, AFAIK, Gerson Kurz
has no plans of working on that project anymore, so it's a limited few
who could pull off a Reiser4 Windows library.

Bryan Petty
