From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 12 Mar 2003 09:55:30 -0500
Message-ID: <1047480930.8219.551.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
	 <1045930351.16042.377.camel@tiny.suse.com>
	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>
	 <1046020695.16048.409.camel@tiny.suse.com>
	 <3E59787F.2030009@mb.tu-ilmenau.de>
	 <1046095718.16047.440.camel@tiny.suse.com>
	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>
	 <3E5F196C.1040001@mb.tu-ilmenau.de>
	 <1046439149.2163.21.camel@tiny.suse.com>
	 <3E66B73D.6030008@mb.tu-ilmenau.de>
	 <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de>
	 <3E69FA70.5030601@mb.tu-ilmenau.de>
	 <1047227975.8215.150.camel@tiny.suse.com>
	 <3E6B74C0.5050702@mb.tu-ilmenau.de>
	 <1047230647.8219.161.camel@tiny.suse.com>
	 <3E6B7C61.9050405@mb.tu-ilmenau.de>
	 <1047415578.8215.383.camel@tiny.suse.com>
	 <3E6F4777.1040802@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6F4777.1040802@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2003-03-12 at 09:43, Manuel Krause wrote:

> * What means a performance increase of 2.4.21-pre5 with [D] vs. without
>     search_reada-4 [A] by  ~16%  !!!
> * The difference of the special mount option [C] against my default [D]
>    is about 0.3%  ;-))
> * With search_reada-4  2.4.21-pre5 [D] only looses ~3.6% throughput rate
>     against 2.4.19 [B]
>   ...in this test.
> 

Outstanding, things are starting to make sense.

> 
> Do you think the group-alloc-4 patch would increase throughput with this 
> test?
> 

No, it will make this test slower (this is the default 2.4.21
allocator's best case)

> Thank you for your great work,

Thank you for all the testing and analysis, it really helps us.

-chris


