From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 22:09:08 -0700
Message-ID: <432E47F4.202@namesys.com>
References: <432AFB44.9060707@namesys.com> <20050916174028.GA32745@infradead.org> <432B1F84.3000902@namesys.com> <20050916205045.GI28578@csclub.uwaterloo.ca> <20050916205323.GJ28578@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932260AbVISFJJ@vger.kernel.org>
In-Reply-To: <20050916205323.GJ28578@csclub.uwaterloo.ca>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Lennart Sorensen wrote:

>
> Neither was ready for use when they were
>included in the kernel and should probably have had big warning signs in
>the kernel config for them. 
>  
>
They did have warning signs: they were labeled experimental....  as is
reiser4. 

At some point developers and their limited size mailing list simply
cannot make things crash, and then it needs to go in to the main kernel
labeled experimental.

Of course, the reiser4 code is not as stable as it was before the
changes Christoph asked for.

Hans
