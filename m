From: Oleg Drokin <green@namesys.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 20:47:56 +0400
Message-ID: <20020711204756.A1216@namesys.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com> <20020711170537.A2611@namesys.com> <004901c228dd$f01fe220$0e01a8c0@englishbay.com> <20020711172612.A2740@namesys.com> <000501c228df$dd95df40$0e01a8c0@englishbay.com> <20020711173931.A2838@namesys.com> <01c101c228f0$cb229ae0$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <01c101c228f0$cb229ae0$0e01a8c0@englishbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian <brian@english-bay.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 11, 2002 at 08:36:55AM -0700, Brian wrote:

> > > First did --rebuild-sb then --rebuild-tree with -S
> > --rebuild-sb asked you a question, what was your answer?
> Ah, do you mean about the size of the partition?

No, it was asking you about the superblock version.
And if you have answered incorrectly, this is bad.
Also what mount /dev/yourdevice /mnt -t reiserfs 
produces in kernel logs?

Bye,
    Oleg
