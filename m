From: Boyd Waters <bwaters+mac@aoc.nrao.edu>
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 15:15:51 -0600
Message-ID: <64BBEC74-9A22-11D8-8CFE-000A95C88606@aoc.nrao.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu>	<16528.46352.173184.528623@laputa.namesys.com>	<39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu> <16529.9818.916980.360020@laputa.namesys.com> <409129D4.6050703@namesys.com> <5C8CA275-9A1D-11D8-8CFE-000A95C88606@aoc.nrao.edu> <40916B01.1050803@mrs.umn.edu>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40916B01.1050803@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>


On Apr 29, 2004, at 2:52 PM, Grant Miner wrote:

> In Windows they also just have a bit for "traverse directory / execute 
> file" and another bit for "list directory / read data".
>
> However, the default policy makes the OS ignore the traverse/execute 
> for directory traversal (but not file execution) entirely!  This might 
> be the way to go in Linux as well.

Yow! Thanks for the info...

No, I use the directory-traversal (without read) semantics all the 
time, *ignoring* this bit would be a Bad Thing for a multi-user system 
to do.

~ boyd

