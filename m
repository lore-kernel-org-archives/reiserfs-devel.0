From: Tierra <etierra@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 18:33:10 -0600
Message-ID: <c7ef32a70408251733283cd88b@mail.gmail.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net> <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org> <1453698131.20040826011935@tnonline.net> <20040825163225.4441cfdd.akpm@osdl.org> <20040825233739.GP10907@legion.cup.hp.com> <20040825234629.GF2612@wiggy.net> <c7ef32a704082517012aca6061@mail.gmail.com> <20040826000540.GG2612@wiggy.net> <c7ef32a70408251732442bff16@mail.gmail.com>
Reply-To: Tierra <etierra@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c7ef32a70408251732442bff16@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

On Thu, 26 Aug 2004 02:05:40 +0200, Wichert Akkerman <wichert@wiggy.net> wrote:
> But what for? Personally I still haven't seen a good use for them.
> Apple's resource fork comes close though.

There's one way where it can really come in handy, and that's with
specific application file types. Certain media could be saved in a
better format and read more efficiently. The reason you haven't seen
this done yet though is because multiple data streams isn't a standard
and isn't available in most enviroments. There also isn't any file
transfer protocols that will handle transfer of multiple data streams
except through Windows File Sharing.

Take into account though that I have absolutely no experience or
knowledge of how it all works in the backend, and don't know the
implications involved in the implementation.

As for applications that already use data streams, you mentioned
Apple's resource fork already, so I assume you know about file types
there. IIS currently uses ADS for image thumbnailing and it's also
possible to hide an alternate website right inline with a public one.
I've heard of a couple other applications on Windows that uses them.
But you are right, none of them _appropriately_ use data streams for
any specific advantage over regular files except to keep system
controlled information hidden.

Bryan
