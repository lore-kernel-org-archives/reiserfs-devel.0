From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Wed, 12 Mar 2003 15:43:03 +0100
Message-ID: <3E6F4777.1040802@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com>	 <1045930351.16042.377.camel@tiny.suse.com>	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>	 <1046020695.16048.409.camel@tiny.suse.com>	 <3E59787F.2030009@mb.tu-ilmenau.de>	 <1046095718.16047.440.camel@tiny.suse.com>	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>	 <3E5F196C.1040001@mb.tu-ilmenau.de>	 <1046439149.2163.21.camel@tiny.suse.com>	 <3E66B73D.6030008@mb.tu-ilmenau.de>	 <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de>	 <3E69FA70.5030601@mb.tu-ilmenau.de>	 <1047227975.8215.150.camel@tiny.suse.com>	 <3E6B74C0.5050702@mb.tu-ilmenau.de>	 <1047230647.8219.161.camel@tiny.suse.com>	 <3E6B7C61.9050405@mb.tu-ilmenau.de> <1047415578.8215.383.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13229-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/11/2003 09:46 PM, Chris Mason wrote:
> [ slow down between 2.419 data logging and 2.4.21-pre data logging ]
> 
> Ok, could you please apply the search_reada-4 patch I sent and do your
> benchmark again on 2.4.21-preX with these mount options:
> 
> mount -o alloc=old_way:concentrating_formatted_nodes,notail
> 
> It's about 10% faster here, but my dataset is slightly different.
> 

I did it and also tested without the alloc mount option from above.

Here is the overview including the "old" things to refer to. The dataset 
didn't change in the meantime.

(old)
2.4.21-pre5 data=ordered                              [A]
       first run  second run  diff  average    rate
real  9m05.375s   9m23.272s  3.2%  9m14.324s  6.63MB/s
user  0m01.440s   0m01.730s
sys   1m11.640s   1m08.870s

2.4.19 data=ordered                                   [B]
       first run  second run  diff  average    rate
real  7m46.287s   7m34.031s  2.7%  7m40.159s  7.99MB/s
user  0m01.520s   0m01.580s
sys   1m21.920s   1m21.300s


(new)
2.4.21-pre5 [A] + search_reada-4 +
mount -o noatime,alloc=old_way:concentrating_formatted_nodes,notail [C]

       first run second run  diff   average    rate
real  7m59.631s  7m57.167s  0.52%  7m58.399s  7.68MB/s
user  0m01.580s  0m01.250s
sys   1m11.200s  1m09.520s


2.4.21-pre5 [A] + search_reada-4 without special mount options
(is: mount -o noatime,notail,data=ordered)                          [D]

       first run second run  diff   average    rate
real  7m57.365s  7m55.638s  0.36%  7m56.502s  7.71MB/s
user  0m01.510s  0m01.570s
sys   1m07.730s  1m08.020s


* What means a performance increase of 2.4.21-pre5 with [D] vs. without
    search_reada-4 [A] by  ~16%  !!!
* The difference of the special mount option [C] against my default [D]
   is about 0.3%  ;-))
* With search_reada-4  2.4.21-pre5 [D] only looses ~3.6% throughput rate
    against 2.4.19 [B]
  ...in this test.


Do you think the group-alloc-4 patch would increase throughput with this 
test?

Thank you for your great work,

Manuel



