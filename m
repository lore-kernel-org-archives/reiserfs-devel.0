From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Wed, 16 Aug 2006 15:48:43 -0700
Message-ID: <44E3A0CB.8020000@namesys.com>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl>	 <44E24563.1040900@namesys.com> <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com> <44E29DD9.7030302@namesys.com> <44E334EB.5000001@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29617-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44E334EB.5000001@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: Gregory Maxwell <gmaxwell@gmail.com>, Edward Shishkin <edward@namesys.com>, Tom Reinhart <rhino_tom@hotmail.com>, reiserfs-list@namesys.com

Ric Wheeler wrote:
> Hans Reiser wrote:
>> I am skeptical that bitflip errors above the storage layer are as common
>> as the ZFS authors say, and their statistics that I have seen somehow
>> lack a lot of detail about how they were gathered.  If, say, a device
>> with 100 errors counts as 100 instances for their statistics.....  Well,
>> it would be nice to know how they were gathered.  Next time I meet them
>> I must ask.
>>   
> I think that most big vendors have a lot of information about failure
> rates on drives, but cannot actually share the details in public (due
> to NDA's with the suppliers).
>
> One thing that we are trying to do is to get some of the more
> "community" oriented people at Seagate Research to come out and talk
> to the people about what are reasonable types of errors to code
> against.  Current idea is to get everyone in the same place a couple
> of days before the next FAST conference (i.e., linux IO people or file
> system people and these vendors).  (See the USENIX page for details on
> FAST at http://www.usenix.org/events/fast07/cfp/).
>
> I will say that media errors tend to be larger than single bit errors,
> i.e. you will lose a set of sectors instead of seeing a single bit
> flip on one sector (remember that the drive vendors do extensive ECC
> at their level).  What their ECC will not fix is something like junk
> settling on the platter or a really bad error like a bad disk head.
I think that integration of fs, fsck, and raid is the right solution for
media errors.  What I haven't seen data I trust on is what is bitflip
error rate for the  non-media sources.  Since I haven't seen data I
believe (where belief requires details being supplied), my inclination
is to say plugins that users can choose to use if they want them are the
right solution.
> I think that ECC would be overkill,
I view it as an option that we make available to enterprise customers
who want to feel good.

It is not for me to tell them that they are wrong, for I lack the data,
it is merely for me to supply it as a non-default option, and let the
users tell me how often it actually gets triggered when they use it.
