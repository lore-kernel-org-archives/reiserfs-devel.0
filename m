From: Oliver Neukum <oliver@neukum.name>
Subject: Re: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 19:20:58 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200209111920.58952.oliver@neukum.name>
References: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L.0209111340060.1857-100000@imladris.surriel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@conectiva.com.br>, Xuan Baldauf <xuan--lkml@baldauf.org>
Cc: linux-kernel@vger.kernel.org, Reiserfs List <reiserfs-list@namesys.com>

Am Mittwoch, 11. September 2002 18:42 schrieb Rik van Riel:

> Your observation is right, but I'm not sure how much it will
> matter if we start reading the file at stat() time or at
> read() time.
>
> This is because one disk seek takes about 10 million CPU
> cycles on modern systems and we'll have completed the stat(),
> open() and started the read() before the disk arm has started
> moving ;)

Do we gain by sorting the disk accesses ?
How about savings due to better cooperation with the IO
scheduler?

	Regards
		Oliver
