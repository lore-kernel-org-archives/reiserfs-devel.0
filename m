From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 21:33:13 -0500
Message-ID: <42CC9469.9000001@slaphack.com>
References: <hubert@uhoreg.ca>	<200507062033.j66KXNqM008212@laptop11.inf.utfsm.cl> <87ackzei41.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87ackzei41.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Jonathan Briggs <jbriggs@esoft.com>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, vitaly@thebsh.namesys.com

Hubert Chan wrote:
> On Wed, 06 Jul 2005 16:33:23 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:
> 
> 
>>Hubert Chan <hubert@uhoreg.ca> wrote:
>>
>>>If you can store the parents, then finding cycles (relatively)
>>>quickly is pretty easy: before you try to make A the parent of B,
>>>walk up the parent pointers starting from A.  If you ever reach B,
>>>you have a cycle.  If not, you don't have a cycle.  (Hmmm.  Do I need
>>>a proof of correctness for this?  It's just depth-first-search, which
>>>everybody learned in their first algorithms course.)
> 
> 
>>Correct. And you need space for potentially a huge lot of up pointers
>>for each file.
> 
> 
> People (that I know of) don't normally have a huge lot of hardlinks to a
> single file.

And speaking of which, the only doomsday scenario (running out of RAM) 
that I can think of with this scheme is if we have a ton of hardlinks to 
the same file and we try to move one of them.  But this scales linearly 
with the number of hardlinks, I think.  Maybe not quite, but certainly 
not exponentially.

The only other doomsday scenario is if we have a ludicrously deep tree.

To make this work in real usage, not DOS testing, we really need both of 
those, and even then I'm not sure it can work.  What's the maximum 
number of hardlinks supported to a single file?  What's the maximum tree 
depth?  Can these be limited to prevent actual DOS attempts?

Now, if we were to ever actually *create* a cycle, then yes, we might 
end up traversing the whole tree to delete it, possibly running out of 
RAM.  But we don't ever actually create cycles except if we were to have 
corruption, which could as easily create cycles in any other FS.
