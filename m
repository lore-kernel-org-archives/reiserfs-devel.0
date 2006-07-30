From: Hans Reiser <reiser@namesys.com>
Subject: Re: possible recursive locking detected - while running fs operations
 in loops - 2.6.18-rc2-git5
Date: Sat, 29 Jul 2006 18:46:25 -0600
Message-ID: <44CC0161.60806@namesys.com>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>	 <20060725232924.GU6452@schatzie.adilger.int>	 <9a8748490607291518m59573244wac00486a64f6385b@mail.gmail.com>	 <44CBEA7A.4010308@namesys.com> <9a8748490607292317t405c906ek8b1577920eeace65@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <9a8748490607292317t405c906ek8b1577920eeace65@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Al Viro <viro@ftp.linux.org.uk>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, akpm@osdl.org, Alexander Zarochentcev <zam@namesys.com>

Jesper Juhl wrote:

> On 30/07/06, Hans Reiser <reiser@namesys.com> wrote:
>
>> Jesper Juhl wrote:
>>
>> >
>> > Thanks. That's a nice little test suite.
>> >
>> Yes, it is quite useful, our developers have added it to the regression
>> suite....
>>
> That's nice.
>
> Now how about that lock validator message I managed to tease out?
>
> Akpm said "... the reiserfs locking appears to be unneeded - this inode
> is going down and nobody else can look it up, so what is to be locked
> against?" - can you comment on that?
>
>
Err, how about Zam handles all locking issues and this is Sunday with
the family?  I know, lame, but he'll answer you on Monday Russian
time.....;-)
