From: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 17:09:19 +0200
Message-ID: <20020410170919.G54344@off.aspic.com>
References: <20020410165508.D54344@off.aspic.com> <20020410190203.A22633@namesys.com>
Reply-To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410190203.A22633@namesys.com>; from green@namesys.com on Wed, Apr 10, 2002 at 07:02:03PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hi Oleg,

> So I assume you are negatively surprised, right?
> And if you undo the speedup patch only, do you get your numbers back?
> Also do you have highmem on for 2.4.19-pre6 kernel?

Sorry for the confusion :

With 2.4.18 + TCP patch => 10Mb/s
Now witout the speedup patch and with a 2.4.19-pre6 + the patches i've listed => 6.32 Mb/s NFS TCP

That's why i want to give your speedup patch a try !! :o)

i'll redo the test, time for me to rebuild the kernel with the speedup patch and redo the tests, say 15minutes.

I' send the figures then.

Thanks,

Philippe.
