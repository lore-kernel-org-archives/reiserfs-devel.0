From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: journal log file
Date: Mon, 20 May 2002 16:02:21 +0200
Message-ID: <200205201602.21334.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

On Monday 20 May 2002 06:15, Oleg Drokin wrote:
> > partitions (/, /var and /cache), and two of them were created with
> > reiserfs (/var and /cache). The thing is my / partition hasn't a lot of
> > room to keep the journal log file. What's the biggest size it can reach?
> > Will I have one
>
> For a filesystem with 4k blocksize standard journal is always 32M (and
> variable blocksize or relocated journal patches won't be produced for 2.2
> kernels anyway).

Oleg, you should have mentioned that Chris had a "variable" log size patch for 
"ages" but he only haven't had enough time for polishing it.

I for myself were very excited when we get this in some day 'cause than I have 
some little more space on my "boot" partition left or I can shrink it 
finally.

Regards,
	Dieter
