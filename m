From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Hi!
Date: Mon, 14 Jul 2003 21:29:24 +0200
Message-ID: <200307142129.24398.Dieter.Nuetzel@hamburg.de>
References: <3F12F763.4080205@feridot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F12F763.4080205@feridot.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ferenc Kiraly <feri@feridot.com>, reiserfs-list@namesys.com

Am Montag, 14. Juli 2003 20:33 schrieb Ferenc Kiraly:
> 	Hi!
>
> I have a reiserfs root (/) partition where the first 5 blocks went bad.
> I need to recover as much as possible from that partition. Is
> it possible? And if so, how should I go about it?
>
> I have tried reiserfsck with the --rebuild-sb and --rebuild-tree
> options, with no luck.

Start with SuSE's "dd_rescue".

Then rebuild your FS (reiserfsck).

Good luck!

-Dieter

