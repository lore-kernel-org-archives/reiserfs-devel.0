From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: ReiserFS white paper
Date: Tue, 18 Nov 2003 13:38:49 +0300
Message-ID: <16313.63161.570632.911736@laputa.namesys.com>
References: <Pine.GSO.4.58.0311151016160.20395@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.58.0311151016160.20395@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

Zhihui Zhang writes:
 > Hi,
 > 
 > I spent some time on ReiserFS white paper.  It is difficult to read. Can
 > you explain a little bit about closure and keyword systems or give me some
 > pointers?
 > 
 > Incidentally, the new plugin infrastructure is nice. But it does not seem
 > to be the same as OOP.  Same type of items share the same array of

Well, it is not OOP, correct. But it is ADT (abstract data types) which
is, actually, exactly what one needs.

 > methods.  But they does not have private data members.  In addition, will
 > Reiser4 plan to support full database semantics (e.g., rollback,
 > isolation) in the future?  My guess is that it will be prohibitively

It can be implemented in many possible ways. Isolation can be achieved
by versioning or by keeping commit-duration locks, for example, so that
it is possible to trade concurrency for efficiency.

 > expensive.  If so, you still have to build a storage layer on top of
 > ReiserFS.

Reiser4 _is_ a storage foundation.

 > 
 > Thanks,
 > 
 > -Zhihui

Nikita.

 > 
 > -- 
