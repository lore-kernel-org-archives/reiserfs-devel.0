From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Please /dev/null html-only mail rather than sending it out on this list
Date: Sun, 18 Apr 2004 17:45:04 -0400
Message-ID: <200404181745.04988.phma@webjockey.net>
References: <20040418212659.GA5506@free.transpect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18035-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040418212659.GA5506@free.transpect.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 18 April 2004 17:26, Whit Blauvelt wrote:
> Hi,
>
> That a lot of spam has been coming through this list is one thing. That the
> list daemon threatens to cut people from the list whose systems refuse to
> accept some of the spam is another.
>
> Might I suggest a simple category of stuff to throw out before forwarding
> to the list: HTML-only mail. 99%+ of it is spam, and the other <1% isn't
> the sort of people who have any interest in advanced file systems.
>
> Two easy ways to block a lot of it:
>
> 1. With procmail:
>
> # HTML only message are most probably spam.
>
> :0
>
> * ^Content-Type:.*text/html
> {
>   LOG="(HTML) "
>
>   :0
>
>   /dev/null
> }

Also, multipart mail that consists of an HTML part and no text part is *all* 
spam. (I have one sender that sends a legitimate HTML-only mail.) To get rid 
of this, use this procmail rule:

:0 B
* H ?? Content-Type: multipart
* Content-Type: text/html
* ! Content-Type: text/plain
* ! ^Received:
/dev/null
#The Received check is there because I am a postmaster.

Also block mail from IP addresses known to be open relays, open proxies, 
rooted boxes, etc.

phma
-- 
li fi'u vu'u fi'u fi'u du li pa
