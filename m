From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 11 Mar 2003 15:46:18 -0500
Message-ID: <1047415578.8215.383.camel@tiny.suse.com>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6B7C61.9050405@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

[ slow down between 2.419 data logging and 2.4.21-pre data logging ]

Ok, could you please apply the search_reada-4 patch I sent and do your
benchmark again on 2.4.21-preX with these mount options:

mount -o alloc=old_way:concentrating_formatted_nodes,notail

It's about 10% faster here, but my dataset is slightly different.

-chris


