From: Joachim Bremer <joachim.bremer@ricardo.de>
Subject: Re: File corruption with 2.4.20pre6
Date: Wed, 11 Sep 2002 20:36:40 +0200 (MEST)
Message-ID: <200209111836.g8BIae931952@chekov.ricardo.de>
References: <20020911174641.A10234@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11423-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020911174641.A10234@namesys.com> from Oleg Drokin at "Sep 11,
 2002 05:46:41 pm"
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Joachim Bremer <joachim.bremer@ricardo.de>, reiserfs-list@namesys.com

Hi all,

> Hello!
> 
> On Wed, Sep 11, 2002 at 12:41:25PM +0200, Joachim Bremer wrote:
> 
> > I've got an easy to produce file corruption with
> > linux-2.4.20pre6 and then tested with the file-write
> > patch on pre4. I verified the problem on 2 different machines -
> > 1. Uniprozessor with an Athlon XP1600+
> > 2. Dualprozessor with 2 Athlon MP2000+
> 
> Thanks a lot for your report!
> 
> This is my stupid bug and I am starting to wonder how did it passed through
> my tests...
> 
> This trivial patch below should take care of it. Can you try it? 
> Thank you.

pretty short test on the single CPU system showed OK. If there is a problem
on the Dual CPU (I dont't think so) I will file a report.

Thanks for the quick fix

Joachim

> 
> 
> ===== fs/reiserfs/file.c 1.10 vs edited =====
> --- 1.10/fs/reiserfs/file.c	Tue Sep 10 16:06:23 2002
> +++ edited/fs/reiserfs/file.c	Wed Sep 11 17:43:48 2002
> @@ -1189,7 +1189,7 @@
>  
>  	already_written += write_bytes;
>  	buf += write_bytes;
> -	pos = *ppos += write_bytes;
> +	*ppos = pos += write_bytes;
>  	count -= write_bytes;
>      }
>  
> 
> Bye,
>     Oleg
> 

