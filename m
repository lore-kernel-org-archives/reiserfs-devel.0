From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4: maybe just fix bugs?
Date: Mon, 31 Jul 2006 20:18:50 -0600
Message-ID: <44CEBA0A.3060206@namesys.com>
References: <1158166a0607310226m5e134307o8c6bedd1f883479c@mail.gmail.com> <20060801013104.f7557fb1.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932456AbWHAJTN@vger.kernel.org>
In-Reply-To: <20060801013104.f7557fb1.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Denis Vlasenko <vda.linux@googlemail.com>, linux-kernel@vger.kernel.org, Reiserfs mail-list <Reiserfs-List@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

Andrew Morton wrote:

>On Mon, 31 Jul 2006 10:26:55 +0100
>"Denis Vlasenko" <vda.linux@googlemail.com> wrote:
>
>  
>
>>The reiser4 thread seem to be longer than usual.
>>    
>>
>
>Meanwhile here's poor old me trying to find another four hours to finish
>reviewing the thing.
>  
>
Thanks Andrew.

>The writeout code is ugly, although that's largely due to a mismatch between
>what reiser4 wants to do and what the VFS/MM expects it to do.
>
I agree --- both with it being ugly, and that being part of why.

>  If it
>works, we can live with it, although perhaps the VFS could be made smarter.
>  
>
I would be curious regarding any ideas on that.  Next time I read
through that code, I will keep in mind that you are open to making VFS
changes if it improves things, and I will try to get clever somehow and
send it by you.  Our squalloc code though is I must say the most
complicated and ugliest piece of code I ever worked on for which every
cumulative ugliness had a substantive performance advantage requiring us
to keep it.  If you spare yourself from reading that, it is
understandable to do so.

>I'd say that resier4's major problem is the lack of xattrs, acls and
>direct-io.  That's likely to significantly limit its vendor uptake.  (As
>might the copyright assignment thing, but is that a kernel.org concern?)
>  
>
Thanks to you and the batch write code, direct io support will now be
much easier to code, and it probably will get coded the soonest of those
features.  acls are on the todo list, but doing them right might require
solving a few additional issues (finishing the inheritance code, etc.)

>The plugins appear to be wildly misnamed - they're just an internal
>abstraction layer which permits later feature additions to be added in a
>clean and safe manner.  Certainly not worth all this fuss.
>
>Could I suggest that further technical critiques of reiser4 include a
>file-and-line reference?  That should ease the load on vger.
>
>Thanks.
>
>
>  
>
