From: Hans Reiser <reiser@namesys.com>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 21:55:36 -0700
Message-ID: <4091DC48.1070304@namesys.com>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>	<16528.46352.173184.528623@laputa.namesys.com>	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu> <16529.9818.916980.360020@laputa.namesys.com> <409129D4.6050703@namesys.com> <5C8CA275-9A1D-11D8-8CFE-000A95C88606@aoc.nrao.edu> <40916B01.1050803@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40916B01.1050803@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: Boyd Waters <bwaters+mac@aoc.nrao.edu>, reiserfs-list <reiserfs-list@namesys.com>

Grant Miner wrote:

>
>> The traditional semantics of the 'x' bit on directories is awful; 
>> Banyan Vines had an explicit 'scan' attrib on directories for this, 
>> and I believe Windows has something as well. Some way to express 
>> "permission to descend into this directory" as opposed to "permission 
>> to readdir() this directory". Something that is NOT the 'x' bit. 
>> Would be perhaps too awful or impossible to add to POSIX, I don't know.
>
>
> In Windows they also just have a bit for "traverse directory / execute 
> file" and another bit for "list directory / read data".
>
> However, the default policy makes the OS ignore the traverse/execute 
> for directory traversal (but not file execution) entirely!

I don't understand the sentence above.  Is the bit only used by the 
nondefault policies?

>   This might be the way to go in Linux as well.
>
>

