From: Brian Tinsley <btinsley@emageon.com>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Sun, 26 Jan 2003 23:23:53 -0600
Message-ID: <3E34C269.9060800@emageon.com>
References: <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127054903.D976@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ookhoi@humilis.net
Cc: Francois-Rene Rideau <fare@tunes.org>, reiserfs-list@namesys.com

>
>
>According to the manpage it should work:
>-s | --journal-size N
> N is size of journal in blocks. When journal is to be on a separate
> device - its size defaults to number of blocks that device has. When
> journal is to be on a host device - its size defaults 8193 and maximal
> possible value is 32749 (for blocksize 4k). Minimun is 513 for both
> cases.
>
>I've played with it a bit. It seems it never can mount if I did
>mkreiserfs with the -s option (1024, 2048, 8193 (default), 10240). I can
>if I mkreiserfs without -s (or others).
>  
>

It seems like I've done this before. I want to say that it requires some 
kernel patches, but at the moment I cannot remember. Perhaps Chris  M. 
or Oleg can refresh my memory :)


