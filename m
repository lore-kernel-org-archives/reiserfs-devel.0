From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: Re: possible recursive locking detected - while running fs operations in loops - 2.6.18-rc2-git5
Date: Sun, 30 Jul 2006 08:17:42 +0200
Message-ID: <9a8748490607292317t405c906ek8b1577920eeace65@mail.gmail.com>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>
	 <20060725232924.GU6452@schatzie.adilger.int>
	 <9a8748490607291518m59573244wac00486a64f6385b@mail.gmail.com>
	 <44CBEA7A.4010308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CBEA7A.4010308@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Al Viro <viro@ftp.linux.org.uk>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, akpm@osdl.org

On 30/07/06, Hans Reiser <reiser@namesys.com> wrote:
> Jesper Juhl wrote:
>
> >
> > Thanks. That's a nice little test suite.
> >
> Yes, it is quite useful, our developers have added it to the regression
> suite....
>
That's nice.

Now how about that lock validator message I managed to tease out?

Akpm said "... the reiserfs locking appears to be unneeded - this inode
is going down and nobody else can look it up, so what is to be locked
against?" - can you comment on that?


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
