From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: metas Permission Denied
Date: Fri, 30 Apr 2004 00:00:24 -0500
Message-ID: <4091DD68.5080006@mrs.umn.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>	<16528.46352.173184.528623@laputa.namesys.com>	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu> <16529.9818.916980.360020@laputa.namesys.com> <409129D4.6050703@namesys.com> <5C8CA275-9A1D-11D8-8CFE-000A95C88606@aoc.nrao.edu> <40916B01.1050803@mrs.umn.edu> <4091DC48.1070304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4091DC48.1070304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Boyd Waters <bwaters+mac@aoc.nrao.edu>, reiserfs-list <reiserfs-list@namesys.com>

> 
> I don't understand the sentence above.  Is the bit only used by the 
> nondefault policies?
> 

Sort of.  The bit always applies for execute.  The bit never applies for 
traverse directory, unless the default policy is changed.
