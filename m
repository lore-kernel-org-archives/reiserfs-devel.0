From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 22:52:14 +0400
Message-ID: <200308062252.14315.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <200308062201.15385.vitaly@namesys.com> <20030806201405.A1357@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806201405.A1357@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: reiserfs-list@namesys.com, copy@harddisk-recovery.nl

> You can verify on
>
> 	http://www.bitwizard.nl/io_throughput.gif
>
> that (almost) no data was written throughout the first pass.
>
> You can do something like:
>
> #define write my_write
> #define llseek my_llseek
>
....
>
> Add a flush_postponed_writes to the end of pass0.

Ok, thank you for suggestion, actually there is a list of buffers in 
progs and when the amount of buffers exceeds some limit some 
of dirty ones are flushed on disk -- which were accessed earlier. 
And all of them are flush at the end of each pass.

-- 
Thanks,
Vitaly Fertman

