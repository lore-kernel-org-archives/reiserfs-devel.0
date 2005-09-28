From: Hans Reiser <reiser@namesys.com>
Subject: Re: iosched (was Re: Full of surprises - A reiser4 story from userland)
Date: Wed, 28 Sep 2005 13:32:54 -0700
Message-ID: <433AFDF6.3070404@namesys.com>
References: <1127914812.12894.96.camel@laptop> <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop> <433ABD7B.1010903@slaphack.com> <1127932340.12894.149.camel@laptop>            <5d8b7b90509281213c95e30c@mail.gmail.com> <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509281952.j8SJq9Uo007371@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Islam Amer <pharon@gmail.com>, Fionn Behrens <fionn@spamfilter.de>, reiserfs-list@namesys.com

 Check out the latest cfq in the latest kernel, it is much better than
the others for most applications.  Anticipatory used to be the best, but
cfq-3 is better now.
