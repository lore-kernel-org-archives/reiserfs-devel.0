From: Oleg Drokin <green@namesys.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 19:13:56 +0400
Message-ID: <20020410191356.A22756@namesys.com>
References: <20020410165508.D54344@off.aspic.com> <20020410190203.A22633@namesys.com> <20020410170919.G54344@off.aspic.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410170919.G54344@off.aspic.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Wed, Apr 10, 2002 at 05:09:19PM +0200, Philippe Gramoulle wrote:

> > So I assume you are negatively surprised, right?
> > And if you undo the speedup patch only, do you get your numbers back?
> > Also do you have highmem on for 2.4.19-pre6 kernel?
> Sorry for the confusion :
> With 2.4.18 + TCP patch => 10Mb/s
> Now witout the speedup patch and with a 2.4.19-pre6 + the patches i've listed => 6.32 Mb/s NFS TCP

> That's why i want to give your speedup patch a try !! :o)

Ah. So my question remains, do you have highmem enabled? If you do,
also try without highmem with and without speedup patches.
Number of peoples raised a question about Andrea Archangelli's patch
that went into 2.4.19-pre5 to improve I/O throughtput wrt several allocation
zones.
I myself see throughtput decrease with highmem on.

> i'll redo the test, time for me to rebuild the kernel with the speedup patch and redo the tests, say 15minutes.
> I' send the figures then.

Ok. Thank you.

Bye,
    Oleg
