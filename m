From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Question on IICACHE and mount info (2.4.19-pre5)
Date: Mon, 08 Apr 2002 13:44:48 +0200
Message-ID: <3CB182B0.4030009@mb.tu-ilmenau.de>
References: <3CACE903.30901@mb.tu-ilmenau.de> <20020405090248.A6915@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 04/05/2002 07:02 AM, Oleg Drokin wrote:

> Hello!
> 
> On Fri, Apr 05, 2002 at 02:00:03AM +0200, Manuel Krause wrote:
> 
[...]
> 
> Do you see any difference with and without iicache?
> 
[...]
> 
> Bye,
>     Oleg
> 


So, I made some semi-professional tests (only one run, and I have no 
overview about my files size statistics) with my reiserfs partitions. 
The data is only copied from the partitions backup counterpart that was 
freshly created. There was KDE up during copying.


First partition: 1958788 kB (my system)
---------------------------------------
notail:
 real    5m16.853s user    0m1.660s sys     0m53.090s

notail+noborder:
 real    5m30.247s user    0m1.580s sys     0m49.840s

notail+iicache:
 real    4m55.041s user    0m1.820s sys     0m52.650s

notail+noborder+iicache:
 real    5m32.181s user    0m1.260s sys     0m48.590s

 
Second partition: 4085252 kB (mostly archives)
------------------------------------------
notail:
 real    11m3.024s  user    0m1.460s sys     1m26.780s

notail+noborder:
 real    12m38.724s user    0m1.380s sys     1m22.570s

notail+iicache:
 real    11m13.734s user    0m1.620s sys     1m26.650s

notail+noborder+iicache:
 real    11m50.198s user    0m1.520s sys     1m19.530s



Yes, I have differences. But I think they're not the ones we wanted to 
see?! I double checked the lines I pasted to this email ;-)


Best regards,

Manuel



