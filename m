From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 snapshot
Date: Tue, 23 Dec 2003 15:31:04 +0300
Message-ID: <16360.13704.279272.690355@laputa.namesys.com>
References: <16360.8933.883691.281877@laputa.namesys.com>
	<3FE83374.8070803@Rotanovs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE83374.8070803@Rotanovs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viktors Rotanovs <Viktors@Rotanovs.com>
Cc: Reiserfs-List@Namesys.COM

Viktors Rotanovs writes:
 > Nikita Danilov wrote:
 > 
 > >new reiser4 snapshot (for 2.6.0) is available at the
 > >http://www.namesys.com/snapshots/2003.12.23/
 > >See READ.ME file there for more instructions.
 > >  
 > >
 > What areas are still not ready for production?
 > How risky it would be to put, say, 20000 e-mail users (cyrus imap and 
 > nothing else) on reiser4 partition?

I wouldn't recommend it, frankly. Reiser4 should first pass through more
extensive testing (first internally, and then in something like -mm, or
-wli) before it will be ready for "production".

 > Reiser4 works very very well on my desktop pc, so I'm eager to try it on 
 > something bigger.

Great.

 > 
 > Also, does lack of sendfile in the current snapshot mean that Apache 
 > will lose in performance when serving from Reiser4 partition?

Hmm, what Apache uses sendfile for?

 > 
 > Best Wishes,
 > Viktors

Nikita.
