From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 22:25:54 +0100
Message-ID: <20060315212554.GA17098@wintermute>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com> <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com> <4417BEC4.6060506@namesys.com> <1142451941.16641.32.camel@localhost> <44187C8D.5050105@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28281-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44187C8D.5050105@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, reiserfs-list@namesys.com

On 12:43 Wed 15 Mar     , Hans Reiser wrote:
> I am the reiserfs/reiser4 sub-maintainer.  So, if reiser4 works well,
> and is faster than any other Linux FS, and it is,  maintaining it over
> time is for me to worry about, not them. 

I feel this thread is about to trail off to shores we all know too
well. AFAICS we do have two completely different issues here: 

* The core maintainers want the whole code to adhere to certain
  standards. This doesn't have anything to do with performance
  etc. It's just for the fact that this standard is both, a sign of
  reliability and maintainability (even for the unlikely case that
  Namesys would disappear)

* Reiser4 doesn't adhere to some of these standards because they don't
  make much sense from a performance (and design) point of view. 

I think the short term solution should be to adapt Reiser4 to the
standard, but in the long run keep bugging the Linux people to change
some paradigms (as one of Linux' core advantages has always been the
ability and willingness to throw decayed code overboard).

When you think about it, both POV do make sense. It's just so sad this
whole debate has become much more a political than a style debate.

-Andreas

