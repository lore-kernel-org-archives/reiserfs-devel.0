From: Oleg Drokin <green@namesys.com>
Subject: Re: About  reiserfs file corruption in 2.5.70 for PPC64
Date: Fri, 13 Jun 2003 13:24:37 +0400
Message-ID: <20030613092437.GA10314@namesys.com>
References: <CDENIKBOGMAOLOMEGJGKIEHACAAA.liuwt@s-ec.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <CDENIKBOGMAOLOMEGJGKIEHACAAA.liuwt@s-ec.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Weitai Liu <liuwt@s-ec.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jun 13, 2003 at 02:17:46PM +0800, Weitai Liu wrote:
>        I have tested 2.5.70 for PPC64 on my IBM p630 machine,  
>  This system runs  SuSE Linux 8.1 for PPC64 . Some system files that I  have moved  to other directories  on my  system will be corrupted randomly,  these files can be accessed, 
>  but their content  will be  zero partially, e.g., some bytes will  be zero  ("00" ). 
>      there is no   panic  on my system .
>      there are  bugs probably in reiserfs of 2.5.70 kernel for PPC64.

Hm.
What if you mount with "-o nolargeio=1" and repeat the test, are the symptoms still the same?

Thank you.

Bye,
    Oleg
