From: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Subject: Re: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 21:09:33 +0200
Message-ID: <20020410210933.A11599@off.aspic.com>
References: <20020410165508.D54344@off.aspic.com> <20020410190203.A22633@namesys.com> <20020410170919.G54344@off.aspic.com> <20020410191356.A22756@namesys.com> <20020410204848.N54344@off.aspic.com> <20020410230527.B23934@namesys.com>
Reply-To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020410230527.B23934@namesys.com>; from green@namesys.com on Wed, Apr 10, 2002 at 11:05:27PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Wed, Apr 10, 2002 at 11:05:27PM +0400, Oleg Drokin wrote:
> Hello!
> 
> On Wed, Apr 10, 2002 at 08:48:48PM +0200, Philippe Gramoulle wrote:
>  
> > I'll send the missing test ( without speedup patch and without Highmem) later tonight.
> > PS: i'll also redo some tests with 2.4.18 +NFS_ALL and try with UDP as well.
> 
> Ok. Can you also try to measure writing speed without NFS in between?
> (like dd if=/dev/zero of=/localfs/file ...)
> With and without speedup & highmem
> 
> Thank you.
> 
> Bye,
>     Oleg

Yes , i'll do that.

Hopefully , i should be done with all tests tomorrow.

Thanks,

Philippe.
