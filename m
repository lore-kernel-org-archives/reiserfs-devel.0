From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 12:41:01 +0200
Message-ID: <20041109104101.GD26192@nysv.org>
References: <b28a886104110808555d3f59dc@mail.gmail.com> <1099933755.13138.4.camel@localhost> <b28a886104110823161fe3a30d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b28a886104110823161fe3a30d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy West <jkwest@gmail.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Tue, Nov 09, 2004 at 02:16:46AM -0500, Jeremy West wrote:
>
>So ... it seems to me that reiser4 is having some issues handling
>segfault events.  I'm not sure how to tell what caused the segfault. 
>I don't think it's memory, because it happens in the same spot of the
>build every time.  I've done this 4 times now.  That is not random.

I think it's time to chunk out the metadata with debugfs.reiser4 -P
and provide it for downloading :)

Another question; have you been having Bus Errors?
I have some, pretty systematically, and to be honest, I've been
too lazy to have anything done about them :P

-- 
mjt

