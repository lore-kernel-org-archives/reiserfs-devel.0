From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 13:01:55 +0300
Message-ID: <20040813100155.GK1284@nysv.org>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408122138.46787.frbiscani@jumpy.it> <200408130031.13061.vitaly@namesys.com> <200408122308.06962.frbiscani@jumpy.it> <20040813091612.GF13834@backtop.namesys.com> <20040813093119.GI1284@nysv.org> <411C8D45.1000709@namesys.com> <20040813094431.GJ1284@nysv.org> <16668.37156.126350.883214@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16668.37156.126350.883214@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Clusterfs.COM>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On Fri, Aug 13, 2004 at 02:00:04PM +0400, Nikita Danilov wrote:
>
>simply changes id of fibration plugin associated with foo. Doing this
>on non-empty foo would result in corruption and hence is
>disabled. Vladimir, as far as I can tell, meant that if one writes

And on a file it would do nothing, I assume, ever.

>If I were going to implement such thing, I would proceed as follows:

Hooray!

Thanks for the pointers, maybe that's what I should try some time when
I have too much time :)

But you may remember what happened when I last tried to touch Reiser4
code and VFS ;)

-- 
mjt

