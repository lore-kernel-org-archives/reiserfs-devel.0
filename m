From: Clifford Beshers <clifford.beshers@lindows.com>
Subject: Re: mm vs. official for reiser4.
Date: Mon, 09 Feb 2004 10:05:29 -0800
Message-ID: <4027CBE9.6030307@lindows.com>
References: <16419.38404.592630.141335@laputa.namesys.com>	<20040206140319.GC30481@favonius> <16419.41118.153096.216109@laputa.namesys.com> <4023D127.7030301@namesys.com> <40277FF5.8050800@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40277FF5.8050800@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

I prefer Hans' method.  Limiting variables is essential for productive 
testing and debugging.  Get a stable FS with one kernel, make sure you 
understand all the issues, then deal with forks.

Vince wrote:

> Count another vote in favour of the -mm branch. My opinion is that 
> most reiser4 testers will also be likely to run the most 
> "bleeding-edge" kernel branch...
>
> Hans Reiser wrote:
>
>> Until we have removed all bugs that we can hit with internal testing, 
>> we will produce snapshots for use with only one kernel branch.  I am 
>> guessing that more reiser4 testers will use Linus kernel than 
>> Morton's.  Readers should correct me if I err.....
>>
>

