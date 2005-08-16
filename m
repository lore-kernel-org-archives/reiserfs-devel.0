From: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 13:27:25 -0700
Message-ID: <d9a6586e05081613275071c00a@mail.gmail.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>
	 <20050815125025.GA29390@tranquility.scriptkitchen.com>
	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>
	 <4300A603.2050602@namesys.com>
	 <d9a6586e05081509195017d679@mail.gmail.com>
	 <4300D240.7010109@namesys.com>
	 <d9a6586e0508151108431fabba@mail.gmail.com>
	 <4302458E.9070604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4302458E.9070604@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 8/16/05, Hans Reiser <reiser@namesys.com> wrote:
> Reiser4 does a very nice job of packing the tree tightly, which is
> independent of seeks.  Ditto for compression plugin.
> He merely needs to ignore some code, he is not harmed by it.  If he
> wants to write a new block allocator, sure, why not, we have allocator
> plugins yes?   His will just be simpler.....

But the most important thing is to reduce the number of writes as low
as possible.
