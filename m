From: Oleg Drokin <green@namesys.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 19:02:03 +0400
Message-ID: <20020410190203.A22633@namesys.com>
References: <20020410165508.D54344@off.aspic.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410165508.D54344@off.aspic.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Wed, Apr 10, 2002 at 04:55:08PM +0200, Philippe Gramoulle wrote:

> Here is the bitmap.c.rej:
> -   s->s_dirt = 1;

> Is this something i can blindly update by hand ,i mean manually remove "s->s_dirt = 1;" ?

Yes, just remove that line manually.

> At the moment i'm pretty surprised by the NFSv3 TCP performance:
> ( 6.32 Mb/s for a single dd if=/dev/zero of =testfile bs=8192 count=25000 , 200Mb file)
> ( average of 460 Kb/s when uploading a 184Mo compiled kernel tree through FTP)
> 
> Before that i manage to get 10Mb/s on an eepro100 with vanilla 2.4.18 and NFS_ALL TCP from Trond
> (either NFSv3 TCP or UDP)

So I assume you are negatively surprised, right?
And if you undo the speedup patch only, do you get your numbers back?
Also do you have highmem on for 2.4.19-pre6 kernel?

Bye,
    Oleg
