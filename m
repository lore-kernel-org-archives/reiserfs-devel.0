From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Multiple data streams...
Date: Wed, 02 Apr 2003 10:30:20 -0500 EST
Message-ID: <3134644043-BeMail@cr593174-a>
References: <200304022240.57346.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304022240.57346.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Russell Coker wrote on Wed, 2 Apr 2003 22:40:57 +1000:
> The Linux API does not support multiple data streams.  Support for extended 
> attributes has recently been added, this will do most things that you might 
> want to do with multiple streams and does it in a standard way that is 
> supported.

In case people don't know, extra streams are used extensively in BeOS (for icons, e-mail attributes (subject, sender, date, etc), MIME types of files
and lots of other things).  Sometimes I wish their was a ReiserFS
implementation for BeOS so that performance would improve (small streams
are stored in the inode, but once that overflows, things get slow and
it uses at least two disk blocks for even the smallest stream data).

- Alex
