From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: some testing questions
Date: Mon, 14 Aug 2006 16:15:58 +0400
Message-ID: <200608141615.58185.vs@namesys.com>
References: <44DCC20C.7020400@email.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44DCC20C.7020400@email.si>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Gasper Azman <gazman@email.si>

Hello

On Friday 11 August 2006 21:44, Gasper Azman wrote:
> Hello everyone, especially the namesys team.
>
>
> I have been reading this list for quite some time, and saw that issues
> of fragmentation have again arisen. So, a decision was made to put the
> portage tree on a separate reiser4 partition, and to benchmark it over
> time.
>
> Because I know I'm not the smartest guy in the universe, I'm asking
> everyone here which data they would require (or want to see), how to
> obtain it (program names would suffice, but other advice will not go
> amiss) and how frequently the analysis is to be run. 

reiser4progs incluses a program measurefs.reiser4. It should be able to 
measure tree fragmentation. I am not sure how does portage tree evolve, but 
maybe it could be interesting too see how does reiser4 tree fragmentation 
change when filesystem is loaded regularly.

> Since this would be 
> a new partition with nothing but the portage tree, it is an ideal and
> clean environment for testing a specific feature of reiser4 (as has been
> frequently mentioned).
>
> I hope to make a small contribution to the development of IMHO the most
> promising filesystem since ext3. :)
>
>
>
> Keep it up,
>
>
> Gasper
