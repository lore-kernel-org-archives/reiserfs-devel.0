From: "Anthony R." <russo.lutions@verizon.net>
Subject: Re: [PATCH] ReiserFS I/O error Handling [was Re: kernel BUG at fs/reiserfs/prints.c:339!
 kernel 2.6.5]
Date: Sun, 18 Apr 2004 16:47:57 -0400
Message-ID: <4082E97D.10605@verizon.net>
References: <407FF7CA.3050002@verizon.net> <4080573C.4090709@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4080573C.4090709@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-list@namesys.com>



Jeff Mahoney wrote:

> It's most definately a hardware problem. It could be your disk, your
> controller, or the cable connecting them, but somehow hdb1 started
> getting I/O errors. One of them just happened to be in the journal area,
> which ReiserFS doesn't handle well at the moment; it just panics, which
> is what you saw.


FYI, I did an extensive HW test from the vendor and all tests passed.
So I'm not sure it's definitely a HW problem.

I will check out the patches though, thanks.

-- tony

