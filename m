From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel loop with lseek + LFS on reiser partition.
Date: Mon, 22 Apr 2002 12:32:42 +0400
Message-ID: <20020422123242.A8619@namesys.com>
References: <OF3FAEC010.18270BFB-ONC1256BA3.002DB214@ev-i.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF3FAEC010.18270BFB-ONC1256BA3.002DB214@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: reiserfs-list@namesys.com

Hello!

   You seem to forgot to attach a program itself.

Bye,
    Oleg
On Mon, Apr 22, 2002 at 10:28:05AM +0200, wolfgang.glas@ev-i.at wrote:
> Hi all,
> 
> I was just about to report a seek bug in samba-2.2.3a, when I wrote the 
> attached sample program seeking in a file to position 128GB from the 
> beginning and the ne writing "HEllo, world!" to that position. The prgram 
> closes fd's 0,1,2 before doing all that, because I tried to simulate the 
> fd numbers of the samba server. Hence, error reporting goes to syslog(2) 
> instead of stderr. (I recently read about sparse files and decided to give 
> them a try...; Program compiled LFS support; see comment in C-file)
> 
> Running the program under SuSE7.3 with the folowing two kernels lets the 
> process starve in an infineite loop inside the kernel (99% kernel CPU):
> 
> linux-2.4.16 from SuSE
> linux-2.4.18 with the speedup patches from this mailing list plus 
> lvm-1.0.3
> 
> glibc-2.2.4 (SuSE 7.3)
> 
>  No go with kill, kill -9...... Only reboot helps.
> 
> 6GB Reiserfs partition on top of lvm, mount with -o conv. 
> 
>   Best regards,
> 
>     Wolfgang
> 
> 
> 
> --
> Dr. Wolfgang Glas                        EV-i Informationstechnologie 
> GmbH.
> Gesch?ftsf?hrer                          Sebastian-Kneipp-Weg 17
> Wolfgang.Glas@ev-i.at                    A-6020 Innsbruck/Austria
> phone: ++43-512-284883-2                 fax: ++43-512-281624-31

