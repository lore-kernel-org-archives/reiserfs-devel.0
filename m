From: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 20:48:48 +0200
Message-ID: <20020410204848.N54344@off.aspic.com>
References: <20020410165508.D54344@off.aspic.com> <20020410190203.A22633@namesys.com> <20020410170919.G54344@off.aspic.com> <20020410191356.A22756@namesys.com>
Reply-To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410191356.A22756@namesys.com>; from green@namesys.com on Wed, Apr 10, 2002 at 07:13:56PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Wed, Apr 10, 2002 at 07:13:56PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Apr 10, 2002 at 05:09:19PM +0200, Philippe Gramoulle wrote:
> 
> > > So I assume you are negatively surprised, right?
> > > And if you undo the speedup patch only, do you get your numbers back?
> > > Also do you have highmem on for 2.4.19-pre6 kernel?
> > Sorry for the confusion :
> > With 2.4.18 + TCP patch => 10Mb/s
> > Now witout the speedup patch and with a 2.4.19-pre6 + the patches i've listed => 6.32 Mb/s NFS TCP
> 
> > That's why i want to give your speedup patch a try !! :o)
> 
> Ah. So my question remains, do you have highmem enabled? If you do,
> also try without highmem with and without speedup patches.

Yep , i forgot to answer your question :-(

Yes Higmem is enabled.

As you suggested, i'll try with and without the speedup patch as well as with and
without Highmem.

> Number of peoples raised a question about Andrea Archangelli's patch
> that went into 2.4.19-pre5 to improve I/O throughtput wrt several allocation
> zones.
> I myself see throughtput decrease with highmem on.

As a reminder here is the test with no speedup patch and Highmem on:
time dd if=/dev/zero of=test1 bs=8192 count=25000
25000+0 records in
25000+0 records out

real    0m32.182s
user    0m0.020s
sys     0m1.530s

Now with the speedup patch and still highmem on:

time dd if=/dev/zero of=test2 bs=8192 count=25000
25000+0 records in
25000+0 records out

real    0m41.149s
user    0m0.000s
sys     0m0.920s

With the speedup patch and highmem off:

time dd if=/dev/zero of=zobada bs=8192 count=25000
e25000+0 records in             
25000+0 records out             
                                
real    0m40.390s               
user    0m0.020s                
sys     0m1.070s              

I'll send the missing test ( without speedup patch and without Highmem) later tonight.

Thanks,

Philippe.

PS: i'll also redo some tests with 2.4.18 +NFS_ALL and try with UDP as well.
