From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: reiser4 merging action list
Date: Tue, 28 Jun 2005 13:16:46 +0400
Message-ID: <42C1157E.8040506@yandex.ru>
References: <42BB7B32.4010100@slaphack.com.suse.lists.linux.kernel> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl.suse.lists.linux.kernel> <20050627092138.GD11013@nysv.org.suse.lists.linux.kernel> <20050627124255.GB6280@thunk.org.suse.lists.linux.kernel> <42C0578F.7030608@namesys.com.suse.lists.linux.kernel> <20050627212628.GB27805@thunk.org.suse.lists.linux.kernel> <42C084F1.70607@namesys.com.suse.lists.linux.kernel> <p73vf3zuqzq.fsf@verdi.suse.de> <1119947829.3495.25.camel@tribesman.namesys.com> <20050628091117.GJ8035@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050628091117.GJ8035@wotan.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <ak@suse.de>
Cc: Vladimir Saveliev <vs@namesys.com>, Hans Reiser <reiser@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Christoph Hellwig <hch@infradead.org>

Andi Kleen wrote:
> Yes, i was looking at some older tree with reiser4. Sorry, just
> ignore what is already done.
> 
> But still spin_macros.h should be completely removed imho. Such
> custom lock wrappers are strongly discouraged because it 
> makes it hard for others to read your code.
>
I may comfirm that this makes Reiser4 very difficult to investigate.
Ctags doesn't work with that too..

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
